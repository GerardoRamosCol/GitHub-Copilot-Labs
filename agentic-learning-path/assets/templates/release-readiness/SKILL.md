---
name: release-readiness
description: "Assess fictional Northstar releases against policy. Use for release readiness, go/no-go checks, gate reviews, blocker analysis, and release risk reports."
argument-hint: "[release version]"
---

# Release readiness

## Procedure

1. Read the release policy, change summary, known risks, and release metadata.
2. Evaluate every gate with the [readiness checklist](./references/checklist.md).
3. Classify each gate as `Pass`, `Blocked`, or `Unknown`.
4. Cite repository evidence; never invent missing facts.
5. Render the result with the [report template](./assets/report-template.md).
6. Finish with unresolved questions and the minimum next evidence required.

Do not modify source evidence or contact external systems.
