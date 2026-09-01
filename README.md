# GitHub Copilot Developer Training

This repository provides three ways to learn practical GitHub Copilot workflows:
a language-neutral agentic learning path, a self-paced developer learning path,
and a prepared three-hour workshop using minimal inventory domain starters.

## Choose an offering

| Offering | Best for | Duration | Starting point | Languages | Start |
|---|---|---:|---|---|---|
| Agentic Copilot Learning Path | Learners who want reusable instructions, prompts, agents, skills, and CLI workflows | 6-8 hours | Fictional release-readiness workspace | Language-neutral | [Agentic Path](agentic-learning-path/README.md) |
| Self-paced Developer Learning Path | Learners who want a progressive, end-to-end course | 5-7 hours | Empty local directory | Python, .NET, or TypeScript | [Learning Path](learning-path/README.md) |
| Regular Code Labs | Instructor-led or time-boxed workshops | 3 hours | Prepared starter implementation | Python, .NET, or TypeScript | [Student Guide](docs/student-guide.md) |

## Agentic Copilot Learning Path

The [GitHub Copilot Agentic Learning Path](agentic-learning-path/README.md) is a
language-neutral sequence of seven labs covering Copilot fundamentals,
repository instructions, file-specific instructions, prompt files, custom
agents, Agent Skills, and GitHub Copilot CLI. It uses local fictional release
evidence and requires no cloud resource or external repository write.

## Developer Learning Path

The [GitHub Copilot Developer Learning Path](learning-path/README.md) starts with
an empty local directory and builds one inventory application through six labs:

1. [GitHub Copilot fundamentals](learning-path/labs/01-copilot-fundamentals/README.md)
2. [Prompting and core scenarios](learning-path/labs/02-prompting-and-core-scenarios/README.md)
3. [Advanced Copilot workflows](learning-path/labs/03-advanced-copilot-workflows/README.md)
4. [Agentic development concepts](learning-path/labs/04-agentic-development-concepts/README.md)
5. [Agent Mode](learning-path/labs/05-agent-mode/README.md)
6. [Azure DevOps through remote MCP](learning-path/labs/06-mcp-azure-devops/README.md)

Begin with the [learning path environment setup](learning-path/docs/environment-setup.md),
then complete the labs in order. Lab 6 uses a prepared Azure DevOps project and
has additional setup requirements.

## Regular Code Labs

The regular labs are a three-hour workshop based on the starter implementations
under `tracks/`. Follow the [student guide](docs/student-guide.md); facilitators
should use the [instructor guide](docs/instructor-guide.md) and complete its
preflight before delivery.

Each starter is a minimal inventory domain implementation, not a FastAPI,
ASP.NET Core, or Express application. The starters intentionally accept zero or
negative reservation quantities. Existing tests pass so learners can expose the
defect with a focused failing test, fix it without changing the public API, and
validate the full track.

## Supported Tracks

| Track | Exact path | Runtime and framework | Validation command |
|---|---|---|---|
| Python | `tracks/python/` | Python 3.11+, pytest 8 | `python -m pytest` |
| .NET | `tracks/dotnet/` | .NET 8, xUnit 2 | `dotnet test --configuration Release` |
| TypeScript | `tracks/typescript/` | Node.js 22, TypeScript 5.9, Vitest 3 | `npm run build` and `npm test` |

## Prerequisites

- Visual Studio Code with GitHub Copilot access, signed in and enabled
- Git and familiarity with basic source-control workflows
- One supported runtime: Python 3.11+, .NET SDK 8, or Node.js 22 with npm
- PowerShell 6+ and GitHub Copilot CLI for the agentic path's final lab
- For the remote MCP lab, access to an isolated Microsoft Entra-backed Azure
  DevOps project and outbound HTTPS access to `mcp.dev.azure.com`

## Repository Layout

```text
agentic-learning-path/  Language-neutral seven-lab agentic customization course
learning-path/          Self-paced six-lab course, setup, and course assets
docs/                   Student and instructor guides for the regular labs
tracks/                 Prepared Python, .NET, and TypeScript domain starters
.github/                Repository instructions and reusable Copilot prompts
.vscode/mcp.json        Remote Azure DevOps MCP configuration
azure-pipelines.yml     Validation pipeline for all three prepared tracks
```

## Validation

These commands match `azure-pipelines.yml`:

```powershell
# Agentic course documentation
pwsh -File agentic-learning-path/scripts/validate-course.ps1

# Python
Push-Location tracks/python
python -m pip install -e ".[test]"
python -m pytest
Pop-Location

# .NET
Push-Location tracks/dotnet
dotnet test --configuration Release
Pop-Location

# TypeScript
Push-Location tracks/typescript
npm ci
npm run build
npm test
Pop-Location
```

Run the commands from the repository root.

## Shared Working Agreement

- Keep Python, .NET, and TypeScript behavior equivalent.
- Change only the selected track unless shared documentation or infrastructure
  is explicitly in scope.
- Preserve public APIs unless an exercise explicitly changes the contract.
- Prefer the smallest implementation that satisfies the acceptance criteria.
- Add focused tests for behavior changes and run the selected track's full suite.
- Do not add databases, web frameworks, cloud services, or dependencies unless
  the task requires them.
- Report changed files, commands, results, and remaining risks.
- Never commit secrets, tokens, tenant identifiers, or learner-specific values.
