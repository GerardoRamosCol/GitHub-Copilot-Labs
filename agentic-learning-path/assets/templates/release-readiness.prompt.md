---
name: release-readiness
description: "Assess a release against repository policy and report evidence, blockers, risks, and open questions."
argument-hint: "version=<release version>"
agent: plan
tools: [read, search]
---

Assess release `${input:version:2.4.0}`.

**Goal:** Produce a release-readiness assessment without changing files.

**Context:** Read [the policy](../../docs/release-policy.md),
[change summary](../../docs/change-summary.md),
[known risks](../../docs/known-risks.md), and
[release metadata](../../release.json).

**Constraints:** Use only repository evidence. Distinguish facts, assumptions,
and missing evidence. Do not run commands, edit files, or contact external systems.

**Examples:** A missing owner or unresolved critical risk is `Blocked`; conflicting
dates are `Unknown` until reconciled.

**Validation:** Map every policy gate to `Pass`, `Blocked`, or `Unknown`, cite its
source, and list all unresolved questions.
