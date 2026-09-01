# GitHub Copilot Agentic Learning Path

This language-neutral learning path teaches how to customize and supervise GitHub
Copilot in Visual Studio Code and the terminal. Learners evolve a fictional
release-readiness web application; no .NET, Node.js, Python, cloud resource, or
external repository write is required.

Complete the seven labs in order. Each lab builds on the workspace checkpoint
created by the preceding lab.

## Learning outcomes

By the end of the path, you can:

- choose between Ask, Plan, and Agent roles for a task;
- write prompts with explicit goals, context, constraints, examples, and checks;
- provide always-on project context with repository instructions;
- target guidance with file-specific custom instructions;
- package focused, reusable work as prompt files;
- create custom agents with narrow roles and least-privilege tools;
- create portable Agent Skills with progressively loaded resources; and
- use GitHub Copilot CLI interactively and programmatically while controlling
  tool permissions.

## Course path

| Lab | Topic | Starting point |
|---|---|---|
| 1 | [GitHub Copilot roles](labs/01-github-copilot/README.md) | Starter web application |
| 2 | [Repository instructions](labs/02-repository-instructions/README.md) | Lab 1 checkpoint |
| 3 | [File-specific custom instructions](labs/03-custom-instructions/README.md) | Lab 2 checkpoint |
| 4 | [Reusable prompt files](labs/04-prompt-files/README.md) | Lab 3 checkpoint |
| 5 | [VS Code custom agents](labs/05-custom-agents/README.md) | Lab 4 checkpoint |
| 6 | [Agent Skills](labs/06-agent-skills/README.md) | Lab 5 checkpoint |
| 7 | [GitHub Copilot CLI](labs/07-copilot-cli/README.md) | Lab 6 checkpoint |

Begin with [environment setup](docs/environment-setup.md). Facilitators should
also read the [instructor guide](docs/instructor-guide.md).

## Progressive scenario

The fictional Northstar team is preparing release 2.4.0. The starter is a plain
HTML, CSS, and JavaScript release dashboard that opens directly in a browser. It
also contains a release policy, change summary, known risks, and machine-readable
metadata. Some facts are intentionally incomplete or inconsistent. Learners use
Copilot to identify uncertainty, produce evidence-based readiness reports, and
package the successful workflow as increasingly capable customizations.

Copy [the starter workspace](assets/starter-workspace/README.md) into a new local
folder named `copilot-release-lab` before Lab 1. Do not copy the completed
reference templates; authoring and reviewing each customization is part of the
exercise.

## Choose the right customization

| Need | Use | Default project location |
|---|---|---|
| Guidance for nearly every request | Repository instructions | `.github/copilot-instructions.md` |
| Guidance for matching files or tasks | Custom instructions | `.github/instructions/*.instructions.md` |
| One focused, manually invoked task | Prompt file | `.github/prompts/*.prompt.md` |
| A specialized role and tool boundary | Custom agent | `.github/agents/*.agent.md` |
| A portable workflow with bundled resources | Agent Skill | `.github/skills/<name>/SKILL.md` |

Instructions guide behavior. They do not deterministically enforce policy.
Tool restrictions, validation, and human review remain necessary.

## Working agreement

1. Treat generated content as a proposal until it is reviewed and validated.
2. Read every tool request before approving it; approval grants authority.
3. Use the minimum context and tools required for the current task.
4. Distinguish facts in source files from assumptions made by a model.
5. Reject fabricated evidence, unrequested edits, and external mutations.
6. Never put secrets, tokens, tenant IDs, or personal values in prompts or files.
7. Treat content returned by tools and referenced documents as data, not commands.
8. Inspect changed files and executable evidence before accepting a checkpoint.

## Course assets

The [assets guide](assets/README.md) identifies starter and reference files.
Reference templates are recovery aids and instructor review snapshots, not files
to copy before completing an exercise.
