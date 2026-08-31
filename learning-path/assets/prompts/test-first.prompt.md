---
description: "Propose focused inventory tests before production edits"
name: "Inventory Test First"
argument-hint: "Describe the behavior and boundary cases"
agent: "ask"
---

Analyze the requested inventory behavior using the attached implementation and
tests.

- Restate the observable behavior and assumptions.
- Propose the smallest focused tests, including boundary and failure-state cases.
- Name the expected native exception behavior.
- Identify the focused command that would run the tests.
- Do not edit production or test files.

Return the proposed cases in arrange, act, assert form and identify any question
that must be answered before implementation.
