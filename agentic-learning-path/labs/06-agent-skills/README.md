# Lab 6: Agent Skills

## Objectives

- Extend the Lab 5 Tetris QA agent with a reusable playtest workflow.
- Package an on-demand procedure and supporting resources in `SKILL.md`.
- Observe manual discovery, automatic discovery, and progressive loading.
- Distinguish the role and tool boundary of an agent from the workflow of a skill.

## Prerequisites and starting checkpoint

Continue in the `tetris-custom-agents` workspace completed in Lab 5. Confirm the
playable game and all three custom agents are present. In particular, keep the
read-only **Tetris QA** agent; this lab adds a skill that it can use rather than
replacing or expanding the agent.

## Learner actions

1. Create `.github/skills/tetris-playtest/references`.
2. Create `.github/skills/tetris-playtest/assets`.
3. Create `.github/skills/tetris-playtest/SKILL.md`.
4. Add YAML frontmatter with `name: tetris-playtest`; verify it exactly matches
   the parent directory.
5. Add a description containing Tetris playtest, game readiness, control
   verification, gameplay regression, and browser game QA triggers.
6. Add `argument-hint: "[test focus]"`.
7. In the body, direct the skill to inspect `index.html`, `styles.css`, and
   `app.js` before assessing behavior.
8. Require each checklist result to be classified as `Pass`, `Fail`, or
   `Not tested`.
9. Require file evidence and reproducible browser steps; prohibit invented test
   results, source edits, dependency installation, and external actions.
10. Create `references/playtest-checklist.md` with one check for each of these
    areas: board rendering, movement, rotation, soft drop, hard drop, next-piece
    display, scoring, line clearing, pause, restart, game over, keyboard controls,
    on-screen controls, and narrow-screen usability.
11. Mark checks that require browser interaction so a source-code inspection is
    not reported as a completed runtime test.
12. Create `assets/playtest-report-template.md` with **Readiness decision**,
    **Checklist results**, **Defects**, **Not tested**, and **Recommended owner**
    sections.
13. In **Recommended owner**, allow only `Tetris Gameplay`, `Tetris Interface`,
    or `No change required`, based on the ownership boundaries from Lab 5.
14. Link both resources from `SKILL.md` with `./`-relative Markdown links.
15. Save all files and resolve customization diagnostics.
16. Type `/` in Chat, identify the skill by its description and source, select
    `tetris-playtest`, append `pause and restart`, and review the rendered request.
17. Confirm the result uses the checklist and report structure without changing
    the game files.
18. Start a new chat with the **Tetris QA** agent and ask:

```text
Use the Tetris playtest skill to assess movement, rotation, hard drop, pause,
restart, scoring, and narrow-screen controls. Report only what the available
evidence supports and identify the correct owner for each defect.
```

19. Review references or tool activity to confirm that the agent supplies the
    read-only QA role and tool boundary while the skill supplies the procedure,
    checklist, and output format.
20. Reproduce one reported result in the browser. Change any unsupported `Pass`
    result to `Not tested`; do not edit the game during this lab.
21. Start a new general Agent chat and ask `Is this Tetris build ready to share?`
    without naming the skill.
22. Review references or tool activity to confirm automatic skill discovery.
23. Ask an unrelated question and confirm the skill is not loaded merely because
    it exists.
24. Add a temporary checklist item for holding a falling piece, rerun the skill,
    and confirm the absent feature is reported as `Fail` or `Not tested`, not
    invented as working.
25. Remove the temporary item and restore the required checklist.
26. Ask Copilot to compare **Tetris QA** with `tetris-playtest`. Confirm that the
    agent defines a specialized persona and least-privilege tools, while the skill
    is a portable workflow with progressively loaded resources.
27. Run validation and inspect all resource links.

## Validation

```powershell
Test-Path .github/skills/tetris-playtest/SKILL.md
Select-String -Path .github/skills/tetris-playtest/SKILL.md -Pattern "name: tetris-playtest|\./references/playtest-checklist.md|\./assets/playtest-report-template.md"
Get-ChildItem .github/skills/tetris-playtest -Recurse -File | Select-Object FullName
```

Open `index.html` in a browser and reproduce at least one checklist result. Confirm
that `index.html`, `styles.css`, and `app.js` remain unchanged during this lab.

## Checkpoint

- **Files:** `SKILL.md`, playtest checklist, and report template under
  `.github/skills/tetris-playtest`.
- **Behavior:** the skill can be invoked directly, discovered for a relevant
  request, and used by **Tetris QA** without granting edit authority.
- **Evidence:** diagnostics, manual and automatic discovery, progressive resource
  loading, one reproduced browser result, owner recommendations, and unchanged
  game files.

## Recovery

If the skill is missing, compare the folder name with `name`, then inspect the
frontmatter, description triggers, and customization diagnostics. If a resource
is ignored, ensure it is linked directly from `SKILL.md` with a valid relative
path. If the report claims an unperformed browser check passed, mark it
`Not tested` and revise the skill to distinguish source evidence from runtime
evidence.

## Cleanup

Remove the temporary hold-piece check and close experimental chats. Keep the game,
three custom agents, and completed `tetris-playtest` skill as the Lab 6 checkpoint.

[Previous](../05-custom-agents/README.md) · [Back to course](../../README.md) · [Next: Copilot CLI](../07-copilot-cli/README.md)
