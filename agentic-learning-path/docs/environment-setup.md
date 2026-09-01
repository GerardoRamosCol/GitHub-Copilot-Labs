# Environment Setup

Complete this preflight before Lab 1.

## Required tools

- Visual Studio Code on the current stable release
- an active GitHub Copilot subscription or organizational entitlement
- the GitHub Copilot extension enabled and signed in
- permission to create files and run local commands
- PowerShell 6 or later on Windows

Verify the local tools:

```powershell
$PSVersionTable.PSVersion
```

Open Chat with `Ctrl+Alt+I`. Confirm that Ask, Plan, and Agent are available. UI
labels can vary slightly by stable VS Code release or organizational policy.
Send a non-mutating preflight request:

```text
State the active chat role and list the workspace files you can see. Do not edit
files or run commands.
```

Run **Chat: Open Customizations** from the Command Palette. Confirm that the
Instructions, Prompts, Agents, and Skills views are available. In Chat, open the
customization diagnostics view and note where discovery or frontmatter errors
will appear.

## GitHub Copilot CLI

Lab 7 uses the standalone `copilot` command. On Windows, install the stable CLI
with WinGet:

```powershell
winget install GitHub.Copilot
```

Open a new terminal if needed, then verify:

```powershell
copilot --version
```

Authenticate interactively with the OAuth device flow:

```powershell
copilot login
```

Follow the one-time browser authorization flow. Do not paste credentials into a
prompt or commit them. Environment variables such as `COPILOT_GITHUB_TOKEN`,
`GH_TOKEN`, or `GITHUB_TOKEN` can override stored credentials; unset unintended
values when troubleshooting. Interactive training should use OAuth rather than
a personal access token.

If an organization or enterprise administrator disabled Copilot CLI, complete
Labs 1-6 and use the instructor demonstration for Lab 7.

## Prepare the learner workspace

1. Create an empty local directory named `copilot-release-lab`.
2. Copy the contents of [the starter web application](../assets/starter-workspace/README.md)
   into it while preserving the `docs` directory.
3. Open that directory as the VS Code workspace root.
4. Open `index.html` in a browser to confirm the application renders.
5. Do not copy files from `assets/templates` yet.

## Preflight checkpoint

Confirm:

- PowerShell reports a supported version;
- VS Code Chat responds using the intended GitHub account;
- Agent and Plan roles are available;
- customization diagnostics can be opened;
- `copilot --version` succeeds, or the facilitator approved the Lab 7 fallback;
- the learner workspace contains only the starter files; and
- no secret or learner-specific value is present in the workspace.
