# Lab 7: GitHub Copilot CLI

## Objectives

- Use Copilot CLI interactively and programmatically.
- Reuse repository instructions, custom agents, and Agent Skills.
- Review, deny, and narrowly allow tool use.
- Validate that a non-mutating workflow leaves the repository unchanged.

## Prerequisites and starting checkpoint

Start after Lab 6. Complete the CLI portion of
[environment setup](../../docs/environment-setup.md). Use PowerShell 6+ on
Windows and launch only from the disposable learner repository.

## Learner actions

1. Open PowerShell at the `copilot-release-lab` root, not your home directory.
2. Run `copilot --version` and record the version as checkpoint evidence.
3. If authentication is required, run `copilot login` and complete the OAuth
   device flow without copying credentials into Chat or files.
4. Start the interactive interface with `copilot`.
6. Review the trusted-directory prompt and approve only the disposable learner
   workspace after confirming its path.
7. Ask which repository instructions are active and compare the answer with the
   project file.
8. Use `/context` and review the context breakdown without changing settings.
9. In ask/execute mode, ask for the four release evidence files and decline any
   unnecessary command.
10. Press `Shift+Tab` to enter plan mode.
11. Request a plan to assess release 2.4.0; review it before any action.
12. Press `Shift+Tab` again to leave plan mode when the UI indicates the desired
    role.
13. Enter `/agent` and select the repository `release-planner` agent.
14. Ask it for a gate-by-gate assessment and verify its read-only boundaries.
15. Ask Copilot to use the `release-readiness` skill and review whether its
    checklist and output template are reflected.
15. Request an unnecessary command, inspect the proposed command, then deny it
    and explain that no command is necessary for the answer.
16. Confirm Copilot adapts after denial instead of treating denial as failure.
17. Exit the interactive session using the displayed exit command or `Ctrl+C`.
18. Run the programmatic custom-agent invocation below and review its output.

```powershell
copilot --agent=release-planner --prompt "Assess Northstar release 2.4.0. Read only; cite repository evidence."
```

19. Review this broad and still unsafe policy example without running it:
    `--allow-all-tools --deny-tool='shell(rm)'`.
20. Explain why deny rules reduce but do not eliminate the risk of broad automatic
    approval; do not use `--allow-all-tools` or `/yolo` in this lab.
21. Optionally inspect `/sandbox enable` or `copilot --cloud` documentation; treat
    both sandbox modes as public-preview, not required course behavior.
22. Run final validation and confirm no local source or customization file changed.
23. If this is a shared machine, run `copilot logout`; otherwise retain the OAuth
    session according to local policy.

## Validation

```powershell
copilot --version
```

No local source or customization file should change during this lab.

## Checkpoint

- **Files:** the Lab 6 repository state remains unchanged.
- **Behavior:** CLI uses repository context, the custom agent, and the skill while
  preserving human control over tools.
- **Evidence:** version/identity check, `/context`, `/agent`, skill use, one denied
    command, and no changed source or customization files.

## Recovery

If `copilot` is not found, reopen PowerShell and verify the installation and
PATH. If login fails, check entitlement, organization policy, and unintended
token environment variables. If a customization is absent, compare its
repository path and diagnostics in VS Code before changing CLI configuration.

## Cleanup

Exit Copilot CLI, revoke any session-wide tool allowance by ending the session,
and sign out on shared machines. Confirm no token, generated report, or trusted
home-directory entry was committed.

[Previous](../06-agent-skills/README.md) · [Back to course](../../README.md)
