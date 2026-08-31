# Lab 5: Agent Mode

**Expected time:** 60-75 minutes

Supervise Agent Mode through a sustained, cross-file stock-transfer feature.
The agent may inspect files, edit code, and run commands, but each capability
remains bounded by your plan and approvals.

## Objectives

- scope a multi-file Agent Mode task with explicit acceptance criteria;
- inspect and approve tool calls according to their effect;
- steer implementation while preserving atomic domain behavior; and
- verify a final report against tests and diffs.

## Prerequisites

Start from the passing Lab 4 commit. Keep external MCP tools disabled; this lab
uses only local repository and terminal capabilities.

## Steps

1. Create and switch to `feature/stock-transfer`.
2. Run the full suite and save the passing result as baseline evidence.
3. Create a checkpoint in VS Code or record the current commit ID.
4. Open Agent Mode and attach only your selected track plus repository
   instructions.
5. Send this task using the structure from
   [the planning asset](../../assets/prompts/plan-feature.prompt.md):

   ```text
   Implement an atomic stock transfer between two InventoryItem instances.

   Acceptance criteria:
   - A positive quantity reduces the source and increases the destination.
   - Zero and negative quantities are rejected before mutation.
   - Insufficient source stock is rejected without mutating either item.
   - Source and destination must be different items.
   - A successful transfer returns an immutable result containing source SKU,
     destination SKU, quantity, source remaining quantity, and destination
     resulting quantity.
   - Existing reservation and report behavior remains unchanged.
   - Add focused tests and use no new runtime dependency or framework.

   Before editing, inspect the repository and propose a phased plan with files,
   public API decisions, validation commands, and risks. Wait for approval.
   ```

6. Review whether the plan accounts for validation order and partial mutation.
7. Ask the agent to explain how its design guarantees atomic failure before you
   approve edits.
8. Correct any plan that subtracts from the source before all validations pass.
9. Approve the test phase only. Inspect every proposed test name and assertion.
10. Require focused cases for success, zero, negative, insufficient stock, and
    same-item transfer.
11. Require failure tests to assert both final quantities, not only exceptions.
12. Approve the focused test command and confirm failures reflect missing
    behavior rather than broken setup.
13. Approve production edits only after the failure evidence is understood.
14. Deny any request to install a package, add a database, or introduce a web
    endpoint. Ask the agent to use language-native domain constructs.
15. While implementation is in progress, steer the agent with:

    ```text
    Keep validation and mutation in one domain operation. Do not implement a
    rollback after partial mutation; validate every failure condition first.
    ```

16. Inspect whether the agent changes `reserve`. If it does, require a concrete
    reason and regression tests or revert that part of the diff.
17. Approve the focused test run. If it fails, require diagnosis against exact
    output before another edit.
18. Ask the agent to add or correct the immutable transfer result without
    exposing setters or mutable fields.
19. Run focused tests again and inspect success and failure state assertions.
20. Approve the full-suite command only after focused tests pass.
21. Compare full-suite output with the Lab 5 baseline and confirm no prior test
    was removed or skipped.
22. Review the complete diff file by file. Look for API drift, duplicated
    validation, broad formatting, hidden mutation, and generated artifacts.
23. Invoke the findings-first review prompt created in Lab 3 against the diff.
24. Resolve only findings tied to the acceptance criteria or regressions, then
    rerun focused and full suites.
25. Ask Agent Mode for a final evidence report with changed files, commands,
    results, criterion-to-test mapping, denied operations, and remaining risks.
26. Verify every claim in the report. Ask for correction when a command or test
    is not present in the terminal evidence.
27. Inspect `git status` and remove only unneeded generated artifacts.
28. Commit the feature after all evidence is green:

    ```powershell
    git add .
    git commit -m "feat: add atomic stock transfers"
    ```

## Checkpoint

Stock transfer succeeds for valid input and is atomic for every invalid case.
The result is immutable, existing behavior still passes, no dependency was
added, and the agent's report matches the diff and command output.

## Recovery

If the agent mutates before validation, restore the Lab 5 checkpoint or revert
only the affected operation. Keep useful tests, restate validation-before-
mutation as a constraint, and rerun the focused failure cases before proceeding.

## Navigation

[Previous: Lab 4 - Agentic development concepts](../04-agentic-development-concepts/README.md) |
[Course contents](../../README.md) |
[Next: Lab 6 - Azure DevOps through remote MCP](../06-mcp-azure-devops/README.md)
