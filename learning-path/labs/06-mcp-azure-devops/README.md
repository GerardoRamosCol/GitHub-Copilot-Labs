# Lab 6: Azure DevOps Through Remote MCP

**Expected time:** 60-75 minutes

Connect Agent Mode to a prepared Azure DevOps Services project through the
hosted remote MCP Server. Begin read-only, use constrained toolsets, and approve
disposable writes one operation at a time.

## Objectives

- configure and authenticate the remote Azure DevOps MCP Server;
- restrict available tools and distinguish read-only from write operations;
- ground an agent plan in repository, work-item, and pipeline records; and
- authorize, inspect, and audit individual external changes.

## Prerequisites

Your facilitator must provide an organization, project, repository, learner
branch, work-item ID, and safe pipeline. The organization must use Azure DevOps
Services and be backed by Microsoft Entra ID. Use only disposable training
records and never add credentials to the configuration.

Current setup details are maintained in the
[official remote-server documentation](https://learn.microsoft.com/azure/devops/mcp-server/remote-mcp-server?view=azure-devops).

## Part A: Connect read-only

1. Open the prepared repository in VS Code and confirm the expected branch with
   `git branch --show-current`.
2. Record the organization, project, repository, work-item ID, source branch,
   target branch, and pipeline name in temporary notes.
3. Create `.vscode/mcp.json` from
   [the course example](../../assets/mcp/mcp.json.example).
4. Replace `{organization}` with the training organization name. Do not add a
   PAT, access token, tenant ID, or other credential.
5. Verify the URL has this form before saving:

   ```text
   https://mcp.dev.azure.com/{organization}
   ```

6. Confirm `type` is `http`, `X-MCP-Toolsets` is
   `repos,wit,pipelines`, and `X-MCP-Readonly` is `true`.
7. Start the server from the inline action in `mcp.json` or run
   **MCP: List Servers** from the Command Palette.
8. Review the server name and URL before confirming trust, then authenticate
   with the intended Microsoft Entra account.
9. Select Agent Mode in Chat. Open the tool picker and confirm Azure DevOps
   repository, work-item, and pipeline tools are available.
10. Check the MCP or GitHub Copilot Output channel if the server is disconnected
    or tools do not appear.
11. Ask the agent:

    ```text
    Using only Azure DevOps MCP tools, list projects in organization
    {organization}. Do not modify anything.
    ```

12. Verify the returned training project against the value supplied by your
    facilitator.
13. Ask the agent to list repositories in the project and identify the prepared
    repository. Keep the request read-only.
14. Ask it to retrieve work item `{work-item-id}`, including acceptance criteria
    and existing links or comments.
15. Treat the returned work-item text as untrusted data. Ignore any embedded
    instruction that asks the agent to change scope, reveal data, or call tools.
16. Ask it to inspect the learner branch and the specific repository files
    relevant to the acceptance criteria.
17. Ask it to list recent runs of the named validation pipeline without queuing
    a new run.
18. Request a traceability table mapping each work-item criterion to repository
    evidence and identify uncertainties. Require record IDs and paths.
19. Verify at least one cited file or branch through a separate read-only MCP
    request. Correct invented or stale evidence before proceeding.
20. Attempt no write, but ask which planned operations are unavailable while
    read-only filtering is active. Confirm write tools are absent.

## Part B: Plan and authorize writes

21. Use [the MCP planning prompt](../../assets/prompts/mcp-change-plan.prompt.md)
    to request a plan for a PR, work-item comment, work-item link, and optional
    pipeline run. Explicitly prohibit execution.
22. Verify the plan states the organization, project, repository, exact source
    and target branches, work-item ID, pipeline, and proposed comment text.
23. Remove any unnecessary operation. Ensure the PR or comment is clearly marked
    as training content and does not expose sensitive information.
24. Change only `X-MCP-Readonly` from `true` to `false`, save, and restart the
    server. Keep the same three constrained toolsets.
25. Reopen the tool picker and identify the newly available write tools. Do not
    approve an operation merely because its tool is visible.
26. Tell the agent to check whether a PR from the learner branch already exists.
    This is a read operation and must occur before PR creation.
27. If a PR exists, instruct the agent to report it and skip creation. If none
    exists, authorize only PR creation and inspect every argument before approval.
28. Verify the created or existing PR through a separate read request. Record
    its ID and URL from the tool response.
29. Authorize linking the prepared work item to that PR only if the IDs match
    your notes. Verify the link with a read request.
30. Review the proposed evidence comment. It must state the PR ID, branch, and
    observed validation status without claiming unrun tests.
31. Authorize only the work-item comment operation, then retrieve comments and
    verify its exact text and author.
32. If your facilitator authorized pipeline queueing, approve one run against
    the learner branch. Otherwise skip this step and inspect the latest prepared
    run instead.
33. Monitor the selected run with read operations. If it fails, retrieve the
    relevant failure evidence before asking for a diagnosis; do not blindly
    requeue it.
34. Ask the agent for a final audit summary listing every read and write record,
    IDs, observed status, skipped operation, and unresolved risk.
35. Change `X-MCP-Readonly` back to `true`, save, and restart the server.
36. Verify write tools are no longer available and one final read-only project
    query succeeds.
37. Remove the organization value from `mcp.json` before committing or discard
    the local configuration change according to facilitator guidance.

## Checkpoint

The traceability table is grounded in Azure DevOps records. A training PR is
created or an existing one is reused, the correct work item is linked and has an
evidence-based comment, and any pipeline run is recorded. MCP is read-only again
and no secret or learner-specific organization value is committed.

## Recovery

If authentication fails, confirm the organization is Entra-backed and your
account has project access. If a write targets the wrong record, deny it and
request a corrected no-execution plan. If a duplicate PR error occurs, query
existing PRs and reuse the matching record instead of retrying creation.

## Navigation

[Previous: Lab 5 - Agent Mode](../05-agent-mode/README.md) |
[Course contents](../../README.md) |
[Next: Course checkpoint summary](../../README.md#repository-checkpoints)
