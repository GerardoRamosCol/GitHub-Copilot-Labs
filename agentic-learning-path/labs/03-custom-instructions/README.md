# Lab 3: File-Specific Custom Instructions

## Objectives

- Target guidance using a narrow `applyTo` glob.
- Test matching, nonmatching, semantic, and manual instruction attachment.
- Diagnose discovery and frontmatter problems.
- Avoid assumptions about instruction combination order.

## Prerequisites and starting checkpoint

Start after Lab 2 with repository instructions enabled.

## Learner actions

1. Create the `reports` directory and an empty `reports/readiness.md` file.
3. Create `.github/instructions`.
4. Create `.github/instructions/release-docs.instructions.md`.
5. Add YAML frontmatter bounded by `---` lines.
6. Set `name` to `Release documentation`.
7. Write a keyword-rich `description` that mentions readiness reports, gates,
   release risks, and open questions.
8. Set `applyTo` to the narrow glob `reports/**/*.md`.
9. Add a required heading order: Decision, Gate assessment, Risks, Open questions.
10. Require each gate to be marked `Pass`, `Blocked`, or `Unknown`.
11. Require a relative source citation beside each factual conclusion.
12. State that missing evidence must not be converted into a pass.
13. Save the file and inspect customization diagnostics.
14. Open `reports/readiness.md`, select Agent, and request that it add the four
    required section headings to that matching file.
15. Review the proposed edit and response references, then approve only the
    scoped file edit; confirm both repository and targeted instructions applied.
16. Open `docs/change-summary.md` and request an outline for that source file.
17. Confirm the report-specific instruction is not automatically applied to the
    nonmatching path.
18. Remove `applyTo` temporarily, retain the description, and ask for a release
    readiness report in a new chat to observe semantic discovery.
19. Manually attach the instruction through **Add Context > Instructions** and
    compare that explicit behavior.
20. Restore `applyTo: "reports/**/*.md"`.
21. Add a temporary conflicting sentence that reverses the required heading order.
22. Review the resulting ambiguity, then remove the conflict rather than assuming
    one instruction file wins by order.
23. Ask Copilot to explain when `AGENTS.md` may be preferable for shared
    multi-agent conventions; do not add it in this lab.
24. Run the validation commands and review the changed files.

## Validation

```powershell
Test-Path .github/instructions/release-docs.instructions.md
Select-String -Path .github/instructions/release-docs.instructions.md -Pattern "applyTo:.*reports"
```

## Checkpoint

- **Files:** targeted instruction and `reports/readiness.md`.
- **Behavior:** report files receive targeted rules; source evidence files do not.
- **Evidence:** matching/nonmatching references, clean diagnostics, restored narrow
  glob, and conflict removed.

## Recovery

If matching fails, verify the file is saved under `.github/instructions`, its
suffix is `.instructions.md`, and the report path matches the glob. Use manual
attachment to distinguish discovery failure from poor instruction content.

## Cleanup

Remove temporary semantic-only and conflicting variants. Leave the narrow glob
in place and do not enable experimental nested `AGENTS.md` behavior.

[Previous](../02-repository-instructions/README.md) · [Back to course](../../README.md) · [Next: Prompt files](../04-prompt-files/README.md)
