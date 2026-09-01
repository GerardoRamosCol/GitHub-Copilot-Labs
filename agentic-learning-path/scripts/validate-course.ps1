[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$courseRoot = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) {
    $failures.Add($Message)
}

$labDirectories = Get-ChildItem (Join-Path $courseRoot 'labs') -Directory | Sort-Object Name
if ($labDirectories.Count -ne 7) {
    Add-Failure "Expected 7 lab directories; found $($labDirectories.Count)."
}

$requiredHeadings = @(
    '## Objectives',
    '## Prerequisites and starting checkpoint',
    '## Learner actions',
    '## Validation',
    '## Checkpoint',
    '## Recovery',
    '## Cleanup'
)

foreach ($labDirectory in $labDirectories) {
    $readme = Join-Path $labDirectory.FullName 'README.md'
    if (-not (Test-Path $readme)) {
        Add-Failure "Missing lab README: $readme"
        continue
    }

    $content = Get-Content $readme -Raw
    foreach ($heading in $requiredHeadings) {
        if (-not $content.Contains($heading)) {
            Add-Failure "$readme is missing '$heading'."
        }
    }

    $actionsSection = [regex]::Match(
        $content,
        '(?ms)^## Learner actions\s+(.*?)(?=^## )'
    ).Groups[1].Value
    $actionCount = ([regex]::Matches($actionsSection, '(?m)^\d+\.\s+')).Count
    if ($actionCount -lt 20) {
        Add-Failure "$readme has $actionCount numbered actions; expected at least 20."
    }

    $validationSection = [regex]::Match(
        $content,
        '(?ms)^## Validation\s+(.*?)(?=^## )'
    ).Groups[1].Value
    if ($validationSection -notmatch '```(?:powershell|pwsh|shell|bash)') {
        Add-Failure "$readme has no executable fenced command in Validation."
    }
}

$markdownFiles = Get-ChildItem $courseRoot -Recurse -File -Filter '*.md'
foreach ($markdownFile in $markdownFiles) {
    $content = Get-Content $markdownFile.FullName -Raw
    $links = [regex]::Matches($content, '!?(?:\[[^\]]*\])\(([^)]+)\)')
    foreach ($link in $links) {
        $target = $link.Groups[1].Value.Trim()
        if ($target -match '^(?:https?://|mailto:|#)') { continue }
        $baseDirectory = $markdownFile.DirectoryName
        # Prompt template links are authored for the documented learner
        # destination at <starter>/.github/prompts.
        if ($markdownFile.Name -like '*.prompt.md' -and
            $markdownFile.FullName -like "$(Join-Path $courseRoot 'assets/templates')*") {
            $baseDirectory = Join-Path $courseRoot 'assets/starter-workspace/.github/prompts'
        }
        $pathOnly = [System.Uri]::UnescapeDataString(($target -split '#')[0])
        if ([string]::IsNullOrWhiteSpace($pathOnly)) { continue }
        $resolved = [System.IO.Path]::GetFullPath((Join-Path $baseDirectory $pathOnly))
        if (-not (Test-Path $resolved)) {
            Add-Failure "Broken relative link in $($markdownFile.FullName): $target"
        }
    }
}

$templateFiles = Get-ChildItem (Join-Path $courseRoot 'assets/templates') -Recurse -File |
    Where-Object { $_.Name -match '(?:\.instructions\.md|\.prompt\.md|\.agent\.md|^SKILL\.md$)' }
foreach ($templateFile in $templateFiles) {
    $lines = Get-Content $templateFile.FullName
    if ($lines.Count -lt 3 -or $lines[0] -ne '---' -or ($lines | Select-Object -Skip 1 | Select-String -SimpleMatch '---' | Select-Object -First 1) -eq $null) {
        Add-Failure "Malformed YAML frontmatter delimiters: $($templateFile.FullName)"
        continue
    }

    $frontmatterEnd = [array]::IndexOf($lines, '---', 1)
    $frontmatter = $lines[1..($frontmatterEnd - 1)] -join "`n"
    if ($frontmatter -notmatch '(?m)^description:\s*.+$') {
        Add-Failure "Missing description in template frontmatter: $($templateFile.FullName)"
    }
    if ($templateFile.Name -eq 'SKILL.md' -and
        $frontmatter -notmatch '(?m)^name:\s*[a-z0-9]+(?:-[a-z0-9]+)*\s*$') {
        Add-Failure "Invalid or missing skill name: $($templateFile.FullName)"
    }
    if ($templateFile.Name -like '*.instructions.md' -and
        $frontmatter -notmatch '(?m)^applyTo:\s*.+$') {
        Add-Failure "Missing applyTo in instruction template: $($templateFile.FullName)"
    }
    if ($templateFile.Name -like '*.agent.md' -and
        $frontmatter -notmatch '(?m)^tools:\s*\[read, search\]\s*$') {
        Add-Failure "Agent template is not read-only: $($templateFile.FullName)"
    }
}

$skillFile = Join-Path $courseRoot 'assets/templates/release-readiness/SKILL.md'
if (Test-Path $skillFile) {
    $skillName = (Select-String -Path $skillFile -Pattern '^name:\s*(.+)$').Matches.Groups[1].Value.Trim()
    $folderName = Split-Path (Split-Path $skillFile -Parent) -Leaf
    if ($skillName -ne $folderName) {
        Add-Failure "Skill name '$skillName' does not match folder '$folderName'."
    }
}

if ($failures.Count -gt 0) {
    Write-Host "Agentic course validation failed ($($failures.Count) issue(s)):" -ForegroundColor Red
    $failures | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host "Agentic course validation passed: 7 labs, required sections/actions, links, and template frontmatter." -ForegroundColor Green
