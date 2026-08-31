# Lab 4: Agentic Development Concepts

**Expected time:** 45-60 minutes

Practice the agent loop as a supervised engineering process before giving an
agent a larger implementation task.

## Objectives

- apply the understand, plan, act, observe, validate, and report loop;
- define acceptance criteria, allowed files, and approval boundaries;
- steer an agent when evidence changes the plan; and
- recover from a partial failure without discarding correct work.

## Prerequisites

Start from the Lab 3 checkpoint with a passing suite, repository instructions,
and a clean working tree.

## Agent loop

An agent can select tools and perform multiple steps, but it does not own the
engineering decision. You remain responsible for scope, authorization, and the
interpretation of evidence.

```text
Understand -> Plan -> Act -> Observe -> Validate -> Report
                   ^                  |
                   +------ steer -----+
```

## Steps

1. Create and switch to `feature/low-stock-report`.
2. Write these acceptance criteria in temporary notes:

   ```text
   Return only items whose quantity is less than or equal to reorder level.
   Sort results by SKU ascending.
   Include SKU, name, quantity, and reorder level.
   Do not mutate the input collection or its items.
   Return an empty result for empty input.
   Keep the feature independent of frameworks and storage.
   ```

3. Identify the production and test files an implementation is likely to touch.
   Do not ask Copilot yet.
4. Open Chat and select Agent Mode, but disable unrelated MCP tools if any are
   enabled.
5. Attach your selected track folder and send the planning prompt from
   [the course asset](../../assets/prompts/plan-feature.prompt.md), including the
   acceptance criteria above.
6. Explicitly require a plan without edits or terminal commands.
7. Compare the agent's proposed files with your prediction from step 3.
8. Ask the agent to identify assumptions, public API choices, and the smallest
   focused test command for its plan.
9. Reject any database, web framework, asynchronous API, or new package in the
   plan. Ask for a revised plan if one appears.
10. Approve only the first phase: add tests for filtering, equality inclusion,
    sorting, and empty input. Do not approve production edits yet.
11. Inspect each requested file edit. Confirm it stays inside your selected
    track and follows repository instructions.
12. Approve the focused test command and observe the expected failures caused by
    the missing report implementation.
13. Ask the agent to summarize what the failures prove and what they do not
    prove. Require references to actual output.
14. Introduce this clarification before production edits:

    ```text
    Clarification: report entries must be immutable snapshots. Later inventory
    changes must not alter an already-created report result.
    ```

15. Ask the agent to revise its plan and tests for the clarified requirement.
    This is steering based on a changed contract, not a fresh task.
16. Review the proposed snapshot test, then approve only that test edit and the
    focused test command.
17. Approve the smallest production implementation that can satisfy the tests.
18. Observe tool calls and deny any dependency installation, network request,
    or edit outside the selected track.
19. If the focused test fails, ask the agent to diagnose from the exact output
    before making another edit.
20. Require the agent to state whether the failure changes the plan or exposes a
    local implementation defect.
21. Approve a local correction only when its explanation matches the evidence.
22. Run the focused report tests yourself after the agent reports success.
23. Run the full track suite and compare your output with the agent's report.
24. Inspect every changed file. Check deterministic sorting, snapshot behavior,
    input preservation, native naming, and absent unrelated changes.
25. Ask the agent for a final report containing changed files, acceptance
    criterion-to-test mapping, commands and results, and remaining risks.
26. Reject vague evidence such as “tests should pass.” Require actual command
    results.
27. Commit the validated feature:

    ```powershell
    git add .
    git commit -m "feat: add low-stock report"
    ```

## Checkpoint

The low-stock report filters on the equality boundary, sorts by SKU, returns
immutable snapshots, handles empty input, and does not mutate inventory. Focused
and full suites pass. The final agent report maps every criterion to evidence.

## Recovery

If an agent stalls, stop the run, preserve passing changes, and begin a new
request with the current `git diff`, failed command output, and one remaining
goal. Do not restart the entire feature or broaden permissions to make progress.

## Navigation

[Previous: Lab 3 - Advanced Copilot workflows](../03-advanced-copilot-workflows/README.md) |
[Course contents](../../README.md) |
[Next: Lab 5 - Agent Mode](../05-agent-mode/README.md)
