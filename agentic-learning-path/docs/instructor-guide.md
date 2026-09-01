# Instructor Guide

## Delivery model

Deliver the path as seven modules or as a self-paced course. The exercises use
one local HTML, CSS, and JavaScript release-readiness application. Labs do not
require .NET, Node.js, Python, cloud resources, or GitHub writes.

## Teaching contract

1. Generated text is untrusted until reviewed against source evidence.
2. Tool approval grants authority and is never a clickthrough.
3. Instructions influence a model but do not enforce policy.
4. Narrow context and least-privilege tools are preferable to broad access.
5. Diagnostics, changed files, and commands provide completion evidence.

## Facilitation checkpoints

| Lab | Minimum evidence |
|---|---|
| 1 | Browser application opens, role comparison, structured prompt, rejected unsafe proposal |
| 2 | Always-on instructions, before/after comparison, discovery evidence |
| 3 | Narrow matching instruction, matching/nonmatching evidence, no conflict |
| 4 | Discoverable prompt, variable input, three invocation methods |
| 5 | Two read-only agents, role boundaries, manual handoff |
| 6 | Valid skill and resources, manual/automatic discovery, progressive loading |
| 7 | CLI identity/version, permission decision, agent and skill discovery, unchanged workspace |

Grade evidence and reasoning, not exact model wording. Ask learners to identify
which source supports each readiness conclusion.

## Delivery preflight

1. Update VS Code and the GitHub Copilot extension on a test machine.
2. Confirm organizational policy enables Agent, customizations, and Copilot CLI.
3. Open the Agent Customizations editor and diagnostics.
4. Confirm current stable frontmatter fields and default locations.
5. Install the stable CLI with WinGet and verify `copilot --version`.
6. Confirm `copilot login`, `/context`, and `/agent` behavior.
7. Verify the repository-level skill is visible in VS Code and Copilot CLI.
8. Check official documentation for renamed UI labels or preview status.
9. Run the course validator.
10. Test the copied starter web application from a disposable directory.

## Common recovery

**Customization is absent:** check its location, file suffix, frontmatter
boundaries, description, `applyTo`, and diagnostics. Reload the window only after
saving files.

**Instruction does not apply:** check that the active or referenced file matches
the glob. Inspect response references; attach the instruction manually to isolate
discovery from content quality.

**Agent has unexpected tools:** inspect both agent and prompt tool lists. Prompt
file tools take precedence over tools on a referenced custom agent.

**Skill does not load:** verify that the directory and `name` match, the
description contains task triggers, and all resources are linked from `SKILL.md`.

**CLI is unavailable:** verify PowerShell 6+, installation, PATH, entitlement,
and organizational policy. Demonstrate Lab 7 without collecting credentials.

**Output varies:** compare required structure, source citations, assumptions, and
safety boundaries. Do not force a textual match with reference templates.

## Security guidance

Use a disposable local workspace containing no confidential data. Learners
should approve individual read-only commands, reject broad permissions, and
never use `--allow-all-tools` or `/yolo` in the course. Public-preview sandbox
and cloud modes are optional demonstrations and must be rechecked before use.

## Completion review

Collect checkpoint evidence rather than chat transcripts. Each learner should
explain one rejected proposal, one instruction-discovery decision, one tool
restriction, one skill-loading decision, and one CLI permission decision.
