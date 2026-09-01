# Lab 5: VS Code Custom Agents

## Objectives

- Create specialized agents with single roles and least-privilege tools.
- Test manual and inferred agent selection.
- Build a review handoff that preserves human control.
- Verify read-only agents cannot mutate the workspace.

## Prerequisites and starting checkpoint

Start after Lab 4. Customization diagnostics must show no errors.

## Learner actions

1. Create `.github/agents`.
3. Create `.github/agents/release-planner.agent.md`.
4. Add frontmatter with the display name `Release Planner`.
5. Add a description containing release gates, blockers, risks, and missing
   evidence so the agent can be discovered for those tasks.
6. Set `tools: [read, search]` and `agents: []`.
7. Do not pin a model; availability differs by entitlement.
8. In the body, define the single role: assess readiness from workspace evidence.
9. Prohibit edits, command execution, external services, and invented evidence.
10. Require Decision, Gate assessment, Risks, and Open questions in the output.
11. Create `.github/agents/release-reviewer.agent.md`.
12. Give the reviewer a description focused on unsupported claims, missed
    blockers, and source conflicts.
13. Set reviewer tools to `[read, search]` and agents to `[]`.
14. Require findings-first output grouped as Critical, Important, and Advisory.
15. Prohibit rewriting the assessment or editing files.
16. Save both agents and resolve all customization diagnostics.
17. Select **Release Planner** manually from the agent picker.
18. Ask it to assess release 2.4.0 and review its citations.
19. Start a general Agent chat and ask it to use the release planner; inspect
    whether inference/delegation selects the intended specialist.
20. Ask the planner to edit `reports/readiness.md`; verify no edit tool is
    available and do not broaden its tools.
21. Add this handoff to planner frontmatter: label `Review readiness assessment`,
    target `release-reviewer`, a review prompt, and `send: false`.
22. Run the planner again and select the handoff button.
23. Review the prefilled reviewer prompt before manually sending it.
24. Confirm the reviewer checks evidence independently and reports findings only.
25. Run validation and inspect both agent files.

## Validation

```powershell
Get-ChildItem .github/agents/*.agent.md | Select-Object Name
Select-String -Path .github/agents/*.agent.md -Pattern "tools: \[read, search\]"
```

## Checkpoint

- **Files:** planner and reviewer agent files.
- **Behavior:** each agent has one read-only role; the planner offers a manual
  reviewer handoff.
- **Evidence:** manual and inferred use, unavailable mutation tools, `send: false`,
    diagnostics, and reviewed agent files.

## Recovery

If an agent is missing, check `.github/agents`, the `.agent.md` suffix, and its
description. If tools appear broader than expected, verify that no invoked prompt
file overrides the agent tool list. Test directly from the agent picker.

## Cleanup

Leave both agents read-only. Remove experimental hooks, model pins, edit tools,
or automatic handoff submission if any were added during exploration.

[Previous](../04-prompt-files/README.md) · [Back to course](../../README.md) · [Next: Agent Skills](../06-agent-skills/README.md)
