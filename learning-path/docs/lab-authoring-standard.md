# Lab Authoring Standard

This standard keeps the learning-path labs consistent and independently reviewable.

## Required sections

Every lab contains:

1. an expected duration of at least 30 minutes;
2. objectives stated as observable learner outcomes;
3. prerequisites and the required starting checkpoint;
4. at least 20 explicit, numbered learner actions;
5. prompts in fenced `text` blocks when wording matters;
6. review points that ask the learner to inspect output before applying it;
7. at least one executable validation command when code or configuration changes;
8. a checkpoint with expected files, behavior, and evidence;
9. recovery guidance for the most likely failure; and
10. cleanup or permission-restoration guidance where applicable.

## Prompt pattern

Prompts should name five elements when they affect correctness:

- **Goal:** the observable outcome;
- **Context:** files, symbols, errors, or external records to use;
- **Constraints:** scope and behavior that must not change;
- **Examples:** representative boundary cases; and
- **Validation:** commands or evidence required before completion.

Labs may begin with an intentionally weak prompt for comparison, but must not
instruct learners to apply unreviewed output.

## Approval language

Use **review** for generated text and diffs. Use **approve** only when a learner
is authorizing a tool call, terminal command, or external mutation. Never frame
approval as a routine clickthrough.

## Track equivalence

Acceptance criteria are language-neutral. Track callouts contain only commands,
paths, naming, and exception conventions. A learner completes one track.

## Checkpoint evidence

A checkpoint names:

- expected repository state;
- focused and full validation commands;
- expected observable behavior;
- the diff or external records to inspect; and
- a suggested commit message when the lab changes local code.

Generated code does not need to match an instructor implementation line for
line. It must satisfy the behavior, scope, and validation contract.
