# Lab 6: Agent Skills

## Objectives

- Package a portable, on-demand workflow in `SKILL.md`.
- Bundle and reference checklist and report-template resources.
- Observe manual discovery, automatic discovery, and progressive loading.
- Distinguish a skill from instructions, prompts, and custom agents.

## Prerequisites and starting checkpoint

Start after Lab 5 with both custom agents available.

## Learner actions

1. Create `.github/skills/release-readiness/references`.
3. Create `.github/skills/release-readiness/assets`.
4. Create `.github/skills/release-readiness/SKILL.md`.
5. Add YAML frontmatter with `name: release-readiness`; verify it exactly matches
   the parent directory.
6. Add a description containing release readiness, go/no-go, gate review,
   blocker analysis, and release risk report triggers.
7. Add `argument-hint: "[release version]"`.
8. In the body, direct the skill to read policy, change, risk, and metadata files.
9. Require evaluation of every gate as `Pass`, `Blocked`, or `Unknown`.
10. Require source citations and prohibit invented evidence or external actions.
11. Create `references/checklist.md` with one check per policy gate.
12. Create `assets/report-template.md` with Decision, Gate assessment, Risks, and
    Open questions sections.
13. Link both resources from `SKILL.md` with `./`-relative Markdown links.
14. Save all files and resolve customization diagnostics.
15. Type `/` in Chat, identify the skill by its description and source, select
    the release-readiness **skill** rather than the similarly named Lab 4 prompt,
    append `2.4.0`, and review the rendered structure.
16. Start a new Agent chat and ask `Is Northstar 2.4.0 ready to release?` without
    naming the skill.
17. Review references or tool activity to confirm automatic skill discovery.
18. Ask an unrelated question and confirm the skill is not
    loaded merely because it exists.
19. Change one checklist item, rerun the skill, and observe that a linked resource
    is loaded only when the procedure needs it.
20. Restore the correct checklist item.
21. Ask Copilot to compare the skill with repository instructions, the focused
    prompt file, and the release-planner agent.
22. Confirm the skill is a portable workflow with resources rather than an
    always-on rule or persona.
23. Start Copilot CLI and ask it to list or use the repository release-readiness
    skill; if CLI policy blocks access, capture the facilitator fallback evidence.
24. Optionally read about `context: fork`, but do not add this experimental field
    to the required solution.
25. Run validation and inspect all resource links.

## Validation

```powershell
Test-Path .github/skills/release-readiness/SKILL.md
Select-String -Path .github/skills/release-readiness/SKILL.md -Pattern "name: release-readiness|\./references/checklist.md|\./assets/report-template.md"
```

## Checkpoint

- **Files:** `SKILL.md`, checklist, and report template under one matching skill
  directory.
- **Behavior:** manual and relevant automatic requests load the skill; unrelated
  requests do not.
- **Evidence:** diagnostics, resource references, progressive-loading observation,
    CLI discovery or documented policy fallback, and reviewed resources.

## Recovery

If the skill silently fails, first compare the folder and `name`, then inspect
frontmatter and description triggers. If a resource is ignored, ensure it is
linked directly from `SKILL.md` with a valid relative path.

## Cleanup

Restore the checklist, remove experimental `context` fields, and exit the CLI
session without granting broad permissions.

[Previous](../05-custom-agents/README.md) · [Back to course](../../README.md) · [Next: Copilot CLI](../07-copilot-cli/README.md)
