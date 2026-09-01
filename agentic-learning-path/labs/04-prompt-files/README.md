# Lab 4: Reusable Prompt Files

## Objectives

- Package one focused task in a reusable prompt file.
- Configure inputs, references, an agent role, and minimal tools.
- Invoke a prompt three ways and understand tool-list priority.
- Distinguish prompts from instructions, agents, and skills.

## Prerequisites and starting checkpoint

Start after Lab 3 with both instruction types discovered correctly.

## Learner actions

1. Create `.github/prompts`.
3. Create `.github/prompts/release-readiness.prompt.md`.
4. Add YAML frontmatter with a `name` of `release-readiness`.
5. Add a description stating what the assessment does and when to invoke it.
6. Add `argument-hint: "version=<release version>"`.
7. Set `agent: plan` so the prompt is non-mutating.
8. Set `tools: [read, search]` and do not add edit or execute tools.
9. Add `${input:version:2.4.0}` for a reusable release-version input.
10. Reference the policy, change summary, known risks, and metadata with relative
    Markdown links from the prompt file.
11. Add the five-part prompt below, adapting links rather than duplicating source
    facts.

```text
Goal: Assess the requested release and return a readiness decision.
Context: Use only the linked policy, change summary, risks, and metadata.
Constraints: Do not edit, execute, contact external systems, or invent evidence.
Examples: Unresolved critical risk = Blocked; conflicting dates = Unknown.
Validation: Map every gate to Pass, Blocked, or Unknown with a source citation,
then list risks and open questions.
```

12. Save the file and resolve customization diagnostic errors.
13. In Chat, type `/` and select `release-readiness`.
14. Supply version 2.4.0 and review the result without applying changes.
15. Run **Chat: Run Prompt** from the Command Palette and choose the same prompt.
16. Open the prompt file and use its editor play button in a new chat.
17. Compare the three results for role, references, and tool availability.
18. Temporarily add `edit` to the prompt tools while Plan remains selected.
19. Review how prompt-defined tools take priority over tools from a referenced
    agent or role; do not approve an edit.
20. Restore `tools: [read, search]`.
21. Ask Copilot why this focused task is a prompt instead of repository guidance.
22. Ask when the workflow should become a skill with bundled resources.
23. Record that prompt files run with local VS Code agents and are not consumed by
    Agent Host; a portable workflow should use an Agent Skill.
24. Run validation and inspect the complete prompt file.

## Validation

```powershell
Test-Path .github/prompts/release-readiness.prompt.md
Select-String -Path .github/prompts/release-readiness.prompt.md -Pattern "tools: \[read, search\]"
```

## Checkpoint

- **Files:** `.github/prompts/release-readiness.prompt.md`.
- **Behavior:** the slash command produces an evidence-backed, read-only report.
- **Evidence:** diagnostics, three invocation methods, input substitution, minimal
    final tool list, and reviewed prompt file.

## Recovery

If the prompt is absent from `/`, check its suffix, folder, saved frontmatter,
and diagnostics. If links fail, resolve them relative to the prompt file, not the
workspace root.

## Cleanup

Remove the temporary edit tool. Keep the final prompt read-only and close chats
that contain experimental tool settings.

[Previous](../03-custom-instructions/README.md) · [Back to course](../../README.md) · [Next: Custom agents](../05-custom-agents/README.md)
