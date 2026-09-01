# Lab 1: GitHub Copilot Roles

## Objectives

- Compare Ask, Plan, and Agent roles.
- Write a correctness-sensitive prompt with five explicit elements.
- Review references, proposed tools, and diffs before accepting work.
- Steer an agent away from unsafe or out-of-scope behavior.

## Prerequisites and starting checkpoint

Complete [environment setup](../../docs/environment-setup.md). Start with a new
`copilot-release-lab` directory containing only the copied starter web application.

## Learner actions

1. Open the learner directory as the VS Code workspace root.
2. Read the four source files without using Copilot and note one inconsistency.
3. Open a PowerShell terminal at the workspace root.
4. Open Chat and select **Ask**.
5. Send `Is release 2.4.0 ready?` as an intentionally weak prompt.
6. Review the answer for unsupported claims, missing gates, and absent citations;
   do not create files from it.
7. Record two ways the weak prompt allowed ambiguity.
8. Start a new chat, remain in Ask, and send the structured prompt below.

```text
Goal: Decide whether Northstar release 2.4.0 is ready and explain why.
Context: Use docs/release-policy.md, docs/change-summary.md,
docs/known-risks.md, and release.json.
Constraints: Do not edit files, run commands, contact external systems, or invent
missing evidence. Cite the source for each conclusion.
Examples: An unresolved critical risk is Blocked. Conflicting target dates are
Unknown until reconciled.
Validation: Map every policy gate to Pass, Blocked, or Unknown, then list risks
and open questions.
```

9. Review the response references and verify every cited file exists.
10. Compare the structured response with the weak response and identify one
    improvement and one remaining uncertainty.
11. Switch to **Plan** and ask it to plan creation of a readiness report without
    executing the plan.
12. Review whether Plan asks useful clarifying questions and separates research
    from file changes.
13. Reject any proposed command or edit; this step is planning-only.
14. Switch to **Agent** and ask it to inspect the workspace and report the four
    evidence files without changing anything.
15. If Agent requests a read-only listing command, inspect the exact command and
    approve it once; reject commands that modify files.
16. Ask Agent to explain which evidence makes the release not ready.
17. Send this deliberately unsafe request: `Publish the release now and fix any
    missing evidence for me.`
18. Reject external or mutating tool calls and steer Agent: `Do not publish,
    edit, or fabricate evidence. Return a local evidence gap list only.`
19. Review the revised response and confirm it stays within the workspace.
20. If Chat created an unrequested file, inspect it and remove only that file.
21. Write down which role you would use for explanation, planning, and execution.

## Validation

```powershell
Get-ChildItem -Force | Select-Object Name
```

Confirm that the starter workspace contains only the expected files.

## Checkpoint

- **Files:** starter workspace only.
- **Behavior:** the learner can distinguish Ask, Plan, and Agent.
- **Evidence:** weak/strong prompt comparison, response references, one rejected
    or redirected unsafe action, and expected workspace contents.

## Recovery

If a role is unavailable, confirm extension sign-in and organizational policy,
then reload VS Code. If Agent changed a source file, inspect it and remove only
the unrequested change.

## Cleanup

Close chats that contain the unsafe prompt and ensure no command received
session-wide approval. Keep the learner repository for Lab 2.

[Back to course](../../README.md) · [Next: Repository instructions](../02-repository-instructions/README.md)
