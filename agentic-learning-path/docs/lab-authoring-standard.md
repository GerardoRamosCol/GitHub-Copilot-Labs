# Agentic Lab Authoring Standard

This standard keeps the agentic labs safe, current, and independently reviewable.

## Required sections

Every lab contains:

1. observable objectives;
2. prerequisites and a starting checkpoint;
3. at least 20 explicit, numbered learner actions;
4. prompts in fenced `text` blocks when wording affects correctness;
5. review points for generated output and approval points only for tool authority;
6. at least one executable validation command;
7. a checkpoint naming files, behavior, and evidence;
8. recovery guidance for likely failures; and
9. cleanup or permission-restoration guidance.

## Prompt pattern

Correctness-sensitive prompts name five elements:

- **Goal:** the observable outcome;
- **Context:** files, symbols, or records to use;
- **Constraints:** scope and behavior that must not change;
- **Examples:** representative cases or expected structure; and
- **Validation:** evidence required before completion.

A weak prompt may be used for comparison, but learners never apply unreviewed
output.

## Customization quality

- YAML frontmatter uses spaces, valid delimiters, and quoted values when needed.
- Descriptions state what the customization does and when it should be used.
- `applyTo` patterns are no broader than the demonstrated need.
- Agents receive the smallest useful tool set and have one role.
- Skill `name` values match their parent directories.
- Relative resource links resolve from the customization file.
- Labs collect discovery evidence through references or customization diagnostics.
- Labs do not depend on an ordering among combined instruction files.

## Approval language

Use **review** for generated text, plans, and diffs. Use **approve** only when a
learner authorizes a command, tool call, or external mutation. Never frame
approval as routine.

## Checkpoint evidence

A checkpoint names the expected workspace state, commands to run, observable
behavior, discovery evidence, and changed files to inspect. Model wording may vary; the
scope, facts, safety rules, and validation contract may not.
