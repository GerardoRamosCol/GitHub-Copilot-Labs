# Northstar Release Dashboard

Northstar is preparing release 2.4.0 of a fictional collaboration product. This
standalone web application opens directly in a browser; it requires no package
manager, build step, .NET runtime, Node.js, or Python.

Open `index.html` in a browser to view the dashboard. The page reads local data
from `app.js` and is styled by `styles.css`.

Use the source files to decide whether the release is ready. Do not invent facts
when evidence is missing or inconsistent. Record uncertainty as an open question.

## Source files

- `docs/release-policy.md` defines the release gates.
- `docs/change-summary.md` lists candidate changes.
- `docs/known-risks.md` records known operational risks.
- `release.json` contains release metadata supplied by automation.

A readiness report should separate satisfied gates, blocked gates, risks, and
open questions, and cite the source for every conclusion.
