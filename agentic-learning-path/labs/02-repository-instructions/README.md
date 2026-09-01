# Lab 2: Repository Instructions

## Objectives

- Create concise, always-on repository instructions.
- Measure behavior before and after durable context is added.
- Verify instruction discovery with references and diagnostics.
- Resolve vague or conflicting guidance without relying on model memory.

## Prerequisites and starting checkpoint

Start after completing Lab 1. The starter evidence files must be unchanged.

## Learner actions

1. In a new Ask chat, request a release-readiness summary without naming source
   files and save observations about format and citations outside the repository.
2. Open **Chat: Open Customizations** from the Command Palette.
3. Select the Instructions view and inspect existing user or organization
   instructions; do not change them.
4. Create `.github/copilot-instructions.md` at the workspace root.
5. Ask Copilot to propose project-wide rules based on the starter files.
6. Review the proposal and reject rules that merely copy the README.
7. Add a rule identifying the four authoritative evidence files.
8. Add a rule that missing evidence never counts as a passed gate.
9. Add a rule separating facts, assumptions, risks, and open questions.
10. Add a rule requiring workspace-relative citations for readiness conclusions.
11. Add a rule prohibiting edits to source evidence during assessment.
12. Add a rule prohibiting external issues, pull requests, and releases.
13. Add a rule requiring a changed-file report after edits.
14. Keep each rule short, actionable, and written in Markdown.
15. Save the file and open customization diagnostics.
16. Resolve any location, parsing, or discovery error before continuing.
17. Start a new Ask chat and repeat the request from action 1.
18. Review the response references and confirm repository instructions were used.
19. Compare the before/after answers for source use, uncertainty, and citations.
20. Add this intentionally vague rule temporarily: `Always make it perfect.`
21. Ask what that rule requires, review the ambiguity, and remove it.
22. Ask whether the instructions guarantee compliance; confirm that review and
    validation are still required.
23. Run the validation commands below and inspect the changed file.

## Validation

```powershell
Test-Path .github/copilot-instructions.md
Select-String -Path .github/copilot-instructions.md -Pattern "missing|cite|external"
```

## Checkpoint

- **Files:** `.github/copilot-instructions.md` exists.
- **Behavior:** new chats receive project-wide evidence and safety guidance.
- **Evidence:** before/after comparison, diagnostics without errors, response
   references, reviewed changed file.

## Recovery

If instructions are not discovered, verify the exact path, save the file, open
customization diagnostics, and start a new chat. Do not compensate by pasting the
instructions into every prompt because that does not test automatic discovery.

## Cleanup

Remove the intentionally vague rule and close comparison chats. Do not alter
user- or organization-level instructions.

[Previous](../01-github-copilot/README.md) · [Back to course](../../README.md) · [Next: Custom instructions](../03-custom-instructions/README.md)
