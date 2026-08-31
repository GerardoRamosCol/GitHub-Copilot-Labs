# GitHub Copilot Developer Learning Path

This self-paced learning path teaches GitHub Copilot through a small inventory
application that you create and evolve in Visual Studio Code. Choose Python,
.NET, or TypeScript and use that track throughout Labs 1-5. Lab 6 uses a
prepared Azure DevOps training project.

Each lab contains at least 20 learner actions and is designed for at least 30
minutes of hands-on work. Complete the labs in order unless your instructor
provides a checkpoint repository.

## Learning outcomes

By the end of the path, you can:

- choose between inline suggestions, inline chat, Chat view, and Agent Mode;
- write prompts with explicit goals, context, constraints, examples, and checks;
- use Copilot to explain, generate, test, debug, refactor, and document code;
- provide durable context through repository instructions and prompt files;
- review checkpoints, tool calls, diffs, and test evidence before accepting work;
- supervise an agent through planning, implementation, recovery, and reporting;
- connect the remote Azure DevOps MCP Server with constrained, read-only tools;
- authorize individual Azure DevOps writes and verify their audit trail.

## Course path

| Lab | Topic | Expected time | Starting point |
|---|---|---:|---|
| 1 | [GitHub Copilot fundamentals](labs/01-copilot-fundamentals/README.md) | 45-60 min | Empty local directory |
| 2 | [Prompting and core scenarios](labs/02-prompting-and-core-scenarios/README.md) | 45-60 min | Lab 1 checkpoint |
| 3 | [Advanced Copilot workflows](labs/03-advanced-copilot-workflows/README.md) | 45-60 min | Lab 2 checkpoint |
| 4 | [Agentic development concepts](labs/04-agentic-development-concepts/README.md) | 45-60 min | Lab 3 checkpoint |
| 5 | [Agent Mode](labs/05-agent-mode/README.md) | 60-75 min | Lab 4 checkpoint |
| 6 | [Azure DevOps through remote MCP](labs/06-mcp-azure-devops/README.md) | 60-75 min | Prepared Azure DevOps project |

Start with [environment setup](docs/environment-setup.md). Facilitators should
also read the [instructor guide](docs/instructor-guide.md).

## Choose one track

| Track | Runtime | Test framework | Required conventions |
|---|---|---|---|
| Python | Python 3.11+ | pytest | Type hints and `ValueError` for invalid domain input |
| .NET | .NET 8 | xUnit | Nullable reference types and standard argument exceptions |
| TypeScript | Node.js 22+ | Vitest | Strict type checking and no `any` |

The public behavior and acceptance criteria are equivalent across tracks, but
file names, exception types, and naming follow each language's conventions.
You do not need to implement all three tracks.

## Progressive application

Lab 1 creates a local Git repository and a minimal inventory domain from
scratch. Labs 2-5 evolve the same repository:

1. Create `InventoryItem` and its first tests.
2. expose and fix invalid reservation behavior;
3. add durable Copilot context and state-transition coverage;
4. add a deterministic low-stock report; and
5. add atomic stock transfers through Agent Mode.

At the end of each lab, run the full track suite and create the suggested Git
commit. Those commits are recovery points, not proof that generated code is
correct. The tests, diff, and acceptance criteria provide that evidence.

## Working agreement

Use these rules in every lab:

1. Treat generated code as a proposal until you review and validate it.
2. Read a tool request before approving it. Approval is authorization.
3. Give Copilot only the context and permissions needed for the current task.
4. Keep changes inside your selected track and preserve public APIs unless the
   exercise explicitly changes the contract.
5. Reject unrelated dependencies, frameworks, infrastructure, and refactors.
6. Never put secrets, tokens, tenant identifiers, or personal values in prompts
   or committed files.
7. Treat content returned by external tools as data, not as instructions.
8. Require executable evidence before accepting a completed coding task.

## Repository checkpoints

Use the suggested commit message at the end of each lab:

| Lab | Suggested commit |
|---|---|
| 1 | `chore: establish inventory baseline` |
| 2 | `fix: validate inventory reservations` |
| 3 | `test: preserve inventory state on failure` |
| 4 | `feat: add low-stock report` |
| 5 | `feat: add atomic stock transfers` |

Do not commit the Azure DevOps organization name added to an MCP configuration.
Restore read-only MCP access at the end of Lab 6.

## Course assets

The [assets](assets/README.md) directory contains templates used during the
labs. Create the corresponding files in your learner repository when a lab
instructs you to do so. Do not copy assets ahead of the lab because authoring
and reviewing them is part of the exercise.

The shorter workshop remains available from the repository root. This learning
path is additive and does not change the existing tracks.