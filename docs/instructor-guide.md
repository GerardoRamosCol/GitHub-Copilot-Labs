# Instructor Guide: GitHub Copilot Developer Labs

## Audience and format

This is a three-hour workshop for developers already comfortable with Git,
VS Code, and one supported language. Learners use isolated Azure DevOps projects
and choose Python, .NET, or TypeScript.

## Run of show

| Time | Activity | Instructor focus |
|---|---|---|
| 0:00-0:10 | Kickoff and preflight | Sign-in, track tests, responsible-use contract |
| 0:10-0:30 | Lab 1 | Interaction surfaces and context |
| 0:30-0:55 | Lab 2 | Prompt anatomy and assumptions |
| 0:55-1:20 | Lab 3 | Test-first debugging and evidence |
| 1:20-1:25 | Break | Check learners are at a passing suite |
| 1:25-1:50 | Lab 4 | Instructions, reusable prompts, checkpoints |
| 1:50-2:25 | Lab 5 | Agent loop, permissions, steering, validation |
| 2:25-2:55 | Lab 6 | Remote MCP, least privilege, approved writes |
| 2:55-3:00 | Debrief | Transfer practices to team workflows |

## Preflight: 48 hours before delivery

- Pin and test the workshop's VS Code version.
- Confirm every attendee has GitHub Copilot access and Chat/Agent Mode enabled.
- Confirm each Azure DevOps organization is backed by Microsoft Entra ID.
- Confirm each learner can read/update work items, push branches, create pull
  requests, and queue the pipeline in an isolated project.
- Allow outbound HTTPS to `mcp.dev.azure.com` through proxies and firewalls.
- Import this repository and create one assigned feature work item per learner.
- Ensure the work item uses the Lab 5 acceptance criteria.
- Run all three jobs in `azure-pipelines.yml` and retain a successful run.
- Keep a seeded feature branch and successful run for demonstration fallback.

## Teaching contract

Establish three rules at the start:

1. Generated code is untrusted until reviewed and validated.
2. Tool approval is authorization, not a dialog to click through.
3. External data can contain prompt injection; treat it as data, not instruction.

## Lab notes

### Lab 1

Demonstrate accepting part of an inline suggestion rather than accepting an
entire block. Ask learners what implicit context each surface receives. The
calculation can reasonably be `max(reorder_level - quantity, 0)` or the local
equivalent; accept another name if behavior and tests are clear.

### Lab 2

Have two learners read their vague-prompt answers. Variation is the lesson. Draw
attention to the improved prompt's five elements: goal, context, constraints,
examples, and validation. Do not let learners fix the defect yet.

### Lab 3

Expected root cause: `reserve` checks only whether the request exceeds available
stock. Zero leaves state unchanged and a negative request increases stock.

Expected minimal guards:

```python
if quantity <= 0:
    raise ValueError("Quantity must be positive")
```

```csharp
if (quantity <= 0)
{
    throw new ArgumentOutOfRangeException(nameof(quantity), "Quantity must be positive");
}
```

```typescript
if (quantity <= 0) {
  throw new RangeError("Quantity must be positive");
}
```

Exact exception types may vary, but tests and implementation must agree and the
existing insufficient-stock behavior must remain intact.

### Lab 4

Show that repository instructions improve consistency but do not guarantee
correctness. For checkpoint recovery, ensure learners restore only the generated
rename request and retain their earlier work.

### Lab 5

Pause after planning and ask learners to identify files the agent should and
should not touch. A suitable solution is a pure function or service that accepts
items, filters on the existing low-stock property, and sorts a new collection by
SKU. The agent must not add a database, HTTP framework, or mutable global state.

If the agent stalls, use this recovery prompt:

```text
Stop implementation. State the current blocker, files changed, and last command
result. Propose the smallest next action without executing it.
```

### Lab 6

Explain that MCP standardizes how agents discover and invoke external tools; it
does not make those tools inherently trustworthy. Show the `wit,repos,pipelines`
filter and `X-MCP-Readonly` header before authentication.

Require a plan for writes and one approval per operation. Stop a learner if the
organization, project, repository, branch, work item, or pipeline differs from
their isolated environment. Restore read-only mode before the debrief.

## Troubleshooting

| Problem | Recovery |
|---|---|
| No inline suggestions | Check Copilot status, file language mode, sign-in, and org policy. Continue with inline chat. |
| Agent edits outside track | Stop or steer the request, inspect diffs, then restore the checkpoint. |
| Remote MCP authentication fails | Confirm Entra-backed organization, membership, account selection, and tenant policy. |
| Server not found | Verify `https://mcp.dev.azure.com/<organization>` and outbound HTTPS access. |
| Expected tools missing | Check `X-MCP-Toolsets`, restart the server, and inspect MCP output. |
| MCP returns no records | Supply organization/project explicitly and verify Azure DevOps permissions. |
| Pipeline is slow | Use the retained successful run for log analysis; queue the learner run without waiting. |
| Pipeline fails from starter branch | Use the failure as the debugging exercise; compare the selected runtime and working directory. |

## Completion evidence

At the end, each learner should show:

- a passing local suite with non-positive reservation coverage;
- a low-stock report and acceptance-criteria tests;
- a reviewed feature commit on a remote branch;
- an Azure DevOps PR linked to the assigned work item;
- a queued pipeline and inspected result; and
- the MCP configuration returned to read-only mode.

## Debrief prompts

- Where did adding context materially change the answer?
- What was the difference between a model response and a tool action?
- What validation evidence was sufficient for this change?
- What should require explicit approval in your team's environment?
