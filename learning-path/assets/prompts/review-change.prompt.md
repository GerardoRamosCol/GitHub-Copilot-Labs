---
description: "Review an inventory change using implementation, tests, and command evidence"
name: "Review Inventory Change"
argument-hint: "Attach changed files and state the acceptance criteria"
agent: "agent"
---

Review the attached inventory implementation, tests, and available command
evidence. Do not edit files or run commands.

Check only:

- behavior against the stated acceptance criteria;
- uncovered boundary or state-transition cases;
- accidental public API changes or unrelated scope;
- consistency with `.github/copilot-instructions.md`; and
- whether reported validation evidence supports the conclusion.

Lead with concrete findings ordered by severity. Reference the relevant file and
symbol. If there are no findings, say so and name any remaining test gap or
uncertainty.
