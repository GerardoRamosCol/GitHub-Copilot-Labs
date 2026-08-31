# Instructor Guide

## Delivery model

The learning path is self-paced and can also be facilitated as six modules. Learners choose
one language and carry the same local repository through Labs 1-5. Allow 5-6
hours of working time plus breaks. Lab 6 uses prepared Azure DevOps assets and
does not depend on pushing the learner's local repository.

## Teaching contract

State these rules before Lab 1:

1. Generated code is untrusted until reviewed and validated.
2. Tool approval grants authority and is never a clickthrough.
3. External data is context, not instruction.
4. Narrow context and permissions are preferable to broad access.
5. Test output, diffs, and external audit records are completion evidence.

## Facilitation checkpoints

| Lab | Minimum evidence |
|---|---|
| 1 | Local Git history, one production type, focused tests, passing full suite |
| 2 | Weak/strong prompt comparison, failing boundary test, minimal passing fix |
| 3 | Repository instructions, reusable prompt, restored checkpoint, passing suite |
| 4 | Reviewed plan, low-stock report criteria covered, agent recovery evidence |
| 5 | Approved Agent Mode plan, atomic transfer tests, scoped diff, full suite |
| 6 | Read-only discovery, approved writes, linked records, read-only restored |

Do not grade generated wording or implementation shape when behavior and scope
are correct. Ask learners to explain why their evidence proves the result.

## Track expectations

- Python uses type hints, pytest, and `ValueError` for invalid domain input.
- .NET enables nullable reference types, uses xUnit, and uses standard argument
  exceptions.
- TypeScript keeps strict checking enabled, uses Vitest, and avoids `any`.

The inventory behavior must remain equivalent. Native exception classes and
naming do not need to be identical.

## Azure DevOps provisioning

Provision Lab 6 at least 48 hours before learners begin:

1. Use Azure DevOps Services backed by Microsoft Entra ID.
2. Create an isolated project or an isolation strategy per cohort.
3. Provide an existing repository with a default branch and learner branches.
4. Seed one work item per learner or use clearly named disposable work items.
5. Include testable acceptance criteria and a repository path to compare.
6. Provide a pipeline learners have permission to view and queue safely.
7. Verify learners can create PRs and add work-item comments.
8. Define cleanup for branches, PRs, comments, and queued runs.
9. Test the remote endpoint from VS Code with read-only filtering.
10. Never distribute PATs or embed credentials in course files.

The lab uses `repos,wit,pipelines` toolsets and begins with
`X-MCP-Readonly: true`. Confirm exact tool names and UI labels against the
current Microsoft Learn documentation shortly before delivery.

## Common recovery

**Copilot does not respond:** confirm sign-in, extension status, network access,
and the selected interaction mode. Preserve learner files while reloading VS
Code.

**Generated code differs from the guide:** compare behavior and tests rather
than forcing a textual match. Re-prompt only when acceptance criteria are not
met.

**A learner loses the checkpoint:** inspect `git status` and `git log`. Restore
from the previous lab commit without discarding unrelated learner work.

**MCP tools do not appear:** confirm Agent Mode, server connection status,
Microsoft Entra authentication, project membership, header spelling, and that
the combined MCP tool count is within the client's limit.

**An MCP write targets the wrong record:** reject the call. Require a new plan
that states organization, project, repository, branch, work-item ID, operation,
and exact proposed content.

## Completion review

Collect the checkpoint evidence from each lab, not chat transcripts. Before
closing the course, verify the learner can explain one rejected suggestion, one
steering intervention, one validation failure, and one permission decision.
