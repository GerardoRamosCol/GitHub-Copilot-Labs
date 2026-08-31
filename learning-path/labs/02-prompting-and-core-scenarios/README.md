# Lab 2: Prompting and Core Developer Scenarios

**Expected time:** 45-60 minutes

Use explain, generate, test, debug, refactor, and documentation workflows while
learning how prompt structure changes the quality and scope of Copilot output.

## Objectives

- include goal, context, constraints, examples, and validation in a prompt;
- distinguish a plausible answer from evidence-supported output;
- expose a defect with a focused test before changing production code; and
- preserve public behavior while making a minimal correction.

## Prerequisites

Start from the passing Lab 1 commit on a clean working tree.

## Steps

1. Create and switch to `lab/02-prompting` with
   `git switch -c lab/02-prompting`.
2. Add a `reserve` method signature to `InventoryItem`. It accepts a quantity and
   will reduce available stock. Do not implement validation yet.
3. Pause for an inline suggestion and inspect which behaviors Copilot assumed.
4. Keep a minimal implementation that subtracts quantity, then add one test
   proving `reserve(3)` changes quantity from `10` to `7`.
5. Add one test proving a request above available stock is rejected without
   changing quantity. Use the native exception convention for your track.
6. Run the full suite and make the implementation satisfy only those tests.
7. Open Chat, attach the implementation, and send the intentionally weak prompt:

   ```text
   Improve reserve.
   ```

8. Do not apply the response. Write down at least three assumptions Copilot made
   about desired behavior, compatibility, or scope.
9. Ask Copilot to critique that prompt for ambiguity and missing validation. Do
   not attach additional context yet.
10. Replace it with this structured prompt and attach both production and test
    files:

    ```text
    Goal: analyze the reservation method for missing input validation.
    Context: use the attached InventoryItem implementation and current tests.
    Constraints: preserve the public API and existing insufficient-stock
    behavior. Do not edit production code yet.
    Examples: reserve(1) is valid; reserve(0) and reserve(-1) are invalid.
    Validation: propose focused tests first and name the expected exception.
    ```

11. Compare both responses for specificity, testability, assumptions, and
    unrelated changes. Keep the comparison in temporary notes, not source code.
12. Ask Copilot to explain the current state transition for `reserve(-1)` using
    concrete before-and-after quantities.
13. Verify the explanation directly against the implementation. Correct the
    prompt if it discusses code that is not present.
14. Ask inline chat in the test file to add parameterized or table-driven cases
    for zero and `-1`. Review names and exception assertions before accepting.
15. Run only those new cases. They should fail because non-positive values are
    currently subtracted.
16. Add the focused failure output to Chat context and ask:

    ```text
    Debug this failure using only the attached implementation, tests, and test
    output. Identify the root cause and propose the smallest production change.
    Preserve the insufficient-stock behavior. Do not edit files.
    ```

17. Check that the proposed guard runs before mutation and rejects all values
    less than or equal to zero.
18. Ask inline chat to implement only that guard. Use `ValueError` in Python,
    `ArgumentOutOfRangeException` in .NET, or `RangeError` in TypeScript.
19. Review the diff before accepting. Reject new abstractions, dependencies, or
    changes to the public method name.
20. Run the focused invalid-input tests again, then run the full suite.
21. Add a test proving a valid reservation still works after the new guard.
22. Select the method and ask inline chat to improve names or readability without
    changing behavior. Apply a change only if it is smaller and clearer.
23. Ask Chat to generate a concise public documentation comment that states the
    valid range and failure conditions. Review exception claims against tests.
24. Run the full suite after documentation or refactoring changes.
25. Inspect `git diff`. Ask Copilot for a findings-first review limited to API
    compatibility, boundary coverage, and state mutation.
26. Commit the validated change:

    ```powershell
    git add .
    git commit -m "fix: validate inventory reservations"
    ```

## Checkpoint

The tests cover positive, insufficient, zero, and negative reservation values.
Invalid reservations fail before mutation, existing public names remain intact,
and the full suite passes. You can identify all five elements of the structured
prompt and explain which ambiguity each removed.

## Recovery

If the new tests pass before the fix, inspect whether your initial completion
already added a guard. Temporarily compare the behavior without that guard or
use the weak/strong prompt exercise to analyze another uncovered boundary. Do
not intentionally leave the repository defective at the checkpoint.

## Navigation

[Previous: Lab 1 - GitHub Copilot fundamentals](../01-copilot-fundamentals/README.md) |
[Course contents](../../README.md) |
[Next: Lab 3 - Advanced Copilot workflows](../03-advanced-copilot-workflows/README.md)
