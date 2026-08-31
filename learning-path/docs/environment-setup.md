# Environment Setup

Complete this preflight before Lab 1. You need only the tools for your selected
language track.

## Shared prerequisites

- Visual Studio Code, updated to the current stable release
- Git 2.40 or later
- an active GitHub Copilot entitlement
- the GitHub Copilot extension enabled and signed in
- permission to create files and run commands in a local working directory

Check Git from a terminal:

```powershell
git --version
git config --get user.name
git config --get user.email
```

Configure your Git identity if either value is empty. Do not use a token or
password as an identity value.

Open VS Code, open Chat with `Ctrl+Alt+I`, and confirm you can send:

```text
Reply with the name of the current interaction mode. Do not edit files.
```

The exact response can vary. The important evidence is that Chat responds and
the account indicator shows the intended GitHub identity.

## Python track

Install Python 3.11 or later, then check:

```powershell
python --version
python -m pip --version
```

Lab 1 creates a virtual environment and installs pytest. If `python` is not
recognized on Windows, try `py -3.11` and consistently substitute `py -3.11`
for `python` in the labs.

## .NET track

Install the .NET 8 SDK, then check:

```powershell
dotnet --version
dotnet --list-sdks
```

At least one `8.0` SDK must be listed.

## TypeScript track

Install Node.js 22 or later with npm, then check:

```powershell
node --version
npm --version
```

The labs use TypeScript with strict checking and Vitest. Lab 1 installs those
development dependencies in the learner repository.

## Lab 6 prerequisites

The Azure DevOps MCP lab has separate prerequisites. Your facilitator must
provide:

- an Azure DevOps Services organization backed by Microsoft Entra ID;
- membership in an isolated training project;
- an existing Git repository and learner branch;
- seeded work items with acceptance criteria; and
- a safe validation pipeline that learners may queue.

The remote server does not support Azure DevOps Server or standalone Microsoft
account organizations. Do not place a PAT in `.vscode/mcp.json`; the remote
server uses Microsoft Entra authentication.

## Preflight checkpoint

Before starting Lab 1, confirm:

- Git reports a version and your intended identity;
- VS Code can send and receive Copilot Chat messages;
- your selected language runtime reports the required version; and
- you know where you will create the local `copilot-inventory` directory.
