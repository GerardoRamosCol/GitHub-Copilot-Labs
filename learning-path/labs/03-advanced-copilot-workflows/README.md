# Lab 3: Advanced Copilot Workflows

**Expected time:** 45-60 minutes

Turn repeated guidance into repository instructions and prompt files, then use
checkpoints and diff review to control a deliberately over-broad edit.

## Objectives

- create durable repository and track-specific Copilot instructions;
- create and invoke a reusable prompt file;
- constrain multi-file work with explicit context and checkpoints; and
- restore unwanted edits and validate the restored state.

## Prerequisites

Start from the passing Lab 2 commit. Read the template descriptions in
[course assets](../../assets/README.md), but create the files yourself.

## Steps

1. Switch back to the main branch and merge `lab/02-prompting`, or continue on
   that branch if your instructor uses a linear history.
2. Create `.github/copilot-instructions.md` in the learner repository.
3. Ask Chat to propose repository instructions based on the production and test
   configuration. Require it to report a draft without editing files.
4. Compare the draft with
   [the course template](../../assets/copilot-instructions.template.md).
5. Write a concise instruction file that states selected-track scope, native
   test conventions, public API preservation, focused tests, full-suite
   validation, minimal dependencies, and secret handling.
6. Ask Chat which instruction lines apply to the current `reserve` method and
   test file. Check the answer against the file rather than assuming it loaded.
7. Create `.github/prompts/review-inventory-change.prompt.md`.
8. Add YAML frontmatter with a description and `agent: agent`, then write a
   findings-first review prompt using
   [the review template](../../assets/prompts/review-change.prompt.md).
9. Invoke the reusable prompt from Chat with the production and test files
   attached. Do not request edits.
10. Verify the response reports concrete findings before summaries and cites
    symbols or files rather than inventing line references.
11. Ask Chat to propose one test proving a failed insufficient-stock reservation
    leaves quantity unchanged. Require a no-edit test plan first.
12. Review the proposed arrange, act, and assert phases, including the quantity
    assertion after the exception.
13. Ask Agent Mode to implement only that test and run the focused test command.
    Review the requested path and command before approving each tool call.
14. Inspect the diff and focused output. Request a correction if the assertion
    checks only the exception and not the final quantity.
15. Run the full track suite yourself and confirm the instruction file's
    validation expectation was met.
16. Create a Git checkpoint with `git add .` and
    `git commit -m "test: preserve inventory state on failure"`.
17. Record the checkpoint commit ID with `git rev-parse --short HEAD`.
18. In Agent Mode, attach only your selected track and ask:

    ```text
    Rename the public reservation method to allocate across production code,
    tests, and documentation. Make all edits and run tests.
    ```

19. Review the proposed plan and observe how many files and callers a public API
    rename affects. Approve only local file edits and test commands, not pushes.
20. Let the agent produce the diff, then inspect it without committing.
21. Explain why this change violates the repository instruction to preserve
    public APIs, even if all tests pass.
22. Restore the checkpoint using VS Code's checkpoint control. If that control
    is unavailable, preserve untracked learner notes and use Git to restore only
    files changed by the rename.
23. Run `git status` and compare `git rev-parse --short HEAD` with the recorded
    checkpoint. Confirm no rename remains.
24. Run the focused reservation tests and full suite after restoration.
25. Invoke the reusable review prompt again and confirm it sees the restored API
    plus the state-preservation test.
26. Add a short `README.md` section describing how to run the selected track's
    tests. Ask Copilot to draft it, then verify every command before applying.
27. Inspect the final diff and commit only the verified README addition if one
    was needed.

## Checkpoint

The learner repository contains `.github/copilot-instructions.md`, a reusable
review prompt, and a test proving failed reservation does not mutate quantity.
The unwanted public API rename is absent and the full suite passes.

## Recovery

If the rename was committed accidentally, create a revert commit instead of
rewriting shared history. If repository instructions appear ignored, confirm
the exact file name and location, then start a new Chat session and ask Copilot
to summarize the applicable instructions before retrying.

## Navigation

[Previous: Lab 2 - Prompting and core scenarios](../02-prompting-and-core-scenarios/README.md) |
[Course contents](../../README.md) |
[Next: Lab 4 - Agentic development concepts](../04-agentic-development-concepts/README.md)
