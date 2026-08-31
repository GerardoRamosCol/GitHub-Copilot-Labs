# Student Guide: GitHub Copilot Developer Labs

## Workshop goal

You will work on a small inventory domain in one language track. The exercises
move from code completion and chat to a supervised agent that can edit files,
run commands, and call Azure DevOps through MCP.

AI output is a proposal, not evidence of correctness. Review changes and run an
appropriate check before accepting them.

## Choose a track

| Track | Production file | Test file | Test command |
|---|---|---|---|
| Python | `tracks/python/src/inventory/item.py` | `tracks/python/tests/test_item.py` | `python -m pytest` |
| .NET | `tracks/dotnet/Inventory.Domain/InventoryItem.cs` | `tracks/dotnet/Inventory.Domain.Tests/InventoryItemTests.cs` | `dotnet test` |
| TypeScript | `tracks/typescript/src/inventory-item.ts` | `tracks/typescript/tests/inventory-item.test.ts` | `npm test` |

Install your track's dependencies using the command in the root README. Open
the repository root in VS Code and confirm GitHub Copilot is signed in.

## Lab 1: Copilot fundamentals

**Time:** 20 minutes

**Objectives:** Distinguish inline suggestions, inline chat, and Chat view; add
useful context; review generated code.

1. Open your production file and read `is_low_stock`, `IsLowStock`, or
   `isLowStock`.
2. Below that member, type a comment describing a calculation that returns the
   number of units needed to reach the reorder level. Pause for an inline
   suggestion.
3. Accept only the useful portion. Rename the member to match local style.
4. Select the new code and open inline chat with `Ctrl+I`. Ask:

   ```text
   Add a concise documentation comment and keep the current public API unchanged.
   ```

5. Open Chat view with `Ctrl+Alt+I`. Attach the production file and ask:

   ```text
   Explain the boundary behavior of the low-stock calculation. Give two examples.
   Do not edit files.
   ```

6. Add one focused test for the new calculation and run your track's tests.

**Checkpoint:** Existing and new tests pass. You can explain why Chat view was
better for explanation and inline chat was better for a local edit.

## Lab 2: Prompting best practices

**Time:** 25 minutes

**Objectives:** Supply a goal, context, constraints, examples, and validation.

1. In Chat view, try this intentionally weak prompt:

   ```text
   Improve reserve.
   ```

2. Do not apply its answer. Identify what the model had to assume.
3. Replace it with the following structure, adapting names to your track:

   ```text
   Goal: analyze the reservation method for missing input validation.
   Context: use the inventory item implementation and its current tests.
   Constraints: preserve the public API and existing insufficient-stock behavior.
   Examples: reserve(1) is valid; reserve(0) and reserve(-1) must be rejected.
   Validation: propose focused tests first. Do not edit production code yet.
   ```

4. Attach both the production and test files explicitly. Ask Copilot to list its
   assumptions and expected exception behavior.
5. Compare the two responses for specificity, testability, and unwanted scope.
6. Refine the prompt once if the proposed test does not check both zero and a
   negative value.

**Checkpoint:** You have a test-first proposal with explicit boundary behavior,
but have not fixed the defect.

## Lab 3: Explain, debug, test, and refactor

**Time:** 25 minutes

**Objectives:** Use evidence to expose a defect and validate a minimal fix.

1. Ask inline chat to insert the proposed non-positive reservation test into the
   test file. Review the edit before keeping it.
2. Run the focused test. It should fail because the starter accepts zero and
   negative quantities.
3. Add the failing terminal output as chat context and ask:

   ```text
   Explain the root cause using the implementation and failing test. Propose the
   smallest fix. Preserve the existing insufficient-stock exception behavior.
   ```

4. Apply the fix, then run the focused test and full suite.
5. Ask Copilot to review the changed method for unnecessary complexity. Reject
   any unrelated refactor.

**Checkpoint:** Non-positive quantities are rejected, the full suite passes, and
the diff contains only the test and minimal production fix.

## Lab 4: Advanced Copilot workflows

**Time:** 25 minutes

**Objectives:** Apply durable repository context, reusable prompts, diffs, and
checkpoints.

1. Open `.github/copilot-instructions.md`. Ask Copilot to summarize which rules
   apply to your track.
2. Open `.github/prompts/review-api-change.prompt.md` and run it from chat. Attach
   the files changed in Lab 3.
3. Ask Copilot to add one test confirming a failed reservation leaves quantity
   unchanged. Require it to run the focused suite.
4. Review the diff. Add diff feedback if naming or assertions do not match the
   track's conventions.
5. Create a checkpoint, then ask Copilot to rename the public reservation method.
   Observe the blast radius and restore the checkpoint instead of keeping it.
6. Run the full suite after restoration.

**Checkpoint:** The state-preservation test passes, repository instructions were
followed, and you have restored a deliberately unwanted multi-file edit.

## Lab 5: Agentic development and Agent Mode

**Time:** 35 minutes

**Objectives:** Supervise the understand, plan, act, validate, report loop.

Create a branch named `feature/low-stock-report-<your-alias>`. In Agent Mode,
attach your track folder and send:

```text
Implement a low-stock report for this track.

Acceptance criteria:
- Return only items whose quantity is less than or equal to reorder level.
- Sort results by SKU ascending.
- Return SKU, name, quantity, and reorder level without mutating inventory.
- Keep domain logic independent of a web framework.
- Add focused tests for filtering, boundary inclusion, sorting, and empty input.

Before editing, inspect the track and propose a concise plan. Then implement the
smallest design consistent with repository instructions. Run focused tests and
the full track suite. Report changed files, test evidence, and remaining risks.
```

1. Review the plan before allowing edits. Correct scope or assumptions in chat.
2. Observe each tool request. Approve only commands and paths needed for your
   selected track.
3. While the agent runs, steer it once with this message:

   ```text
   Keep the report as domain logic. Do not add a database or web framework.
   ```

4. Review every diff and the test output. Ask for a correction if evidence is
   missing or acceptance criteria are not covered.
5. Commit and push the branch only after the full track suite passes.

**Checkpoint:** The pushed branch contains tested low-stock report behavior and
no unrelated framework or infrastructure changes.

## Lab 6: Azure DevOps through remote MCP

**Time:** 30 minutes

**Objectives:** Connect a remote MCP server, constrain its tools, inspect tool
calls, and deliberately authorize writes.

### Part A: Connect with read-only access

1. Open `.vscode/mcp.json` and replace `<organization>` with your isolated Azure
   DevOps organization name.
2. Start the server from the inline action or run `MCP: List Servers` from the
   Command Palette.
3. Review the server URL before confirming trust. Authenticate with your
   Microsoft Entra account.
4. Open **Configure Tools** in Chat and verify work-item, repository, and pipeline
   tools are available.
5. Ask Agent Mode:

   ```text
   Using only Azure DevOps MCP tools, list projects I can access, then show my
   assigned work items in project <project>. Do not modify anything.
   ```

6. Continue with:

   ```text
   Read work item <id>. Compare its acceptance criteria with my pushed branch.
   Inspect repository and pipeline data as needed. Cite the Azure DevOps records
   used and do not modify anything.
   ```

### Part B: Cross the write boundary

1. Confirm you are in your isolated project. Change `X-MCP-Readonly` from `true`
   to `false`, save, and restart the server.
2. Ask the agent for a write plan before allowing any mutation:

   ```text
   Plan these Azure DevOps updates without executing them: create a pull request
   from my feature branch to the default branch, link work item <id>, add a short
   implementation-and-test comment, and queue the validation pipeline. Show the
   exact records and intended changes.
   ```

3. Verify source branch, target branch, work-item ID, repository, and pipeline.
4. Tell the agent to execute one operation at a time. Inspect and approve each
   tool call separately.
5. Ask it to monitor the run, inspect failure logs if needed, and summarize the
   PR, linked work item, and pipeline evidence.
6. Restore `X-MCP-Readonly` to `true` and restart the server.

**Checkpoint:** A linked PR and pipeline run exist in your isolated project, the
work item has a concise evidence-based comment, and MCP is back in read-only mode.

## Debrief

- Which task benefited most from explicit context?
- Which agent action required the most scrutiny?
- What evidence did you require before trusting generated code?
- Which MCP permissions would you allow in a production repository?
