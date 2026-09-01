# Lab 5: VS Code Custom Agents

## Objectives

- Create a browser game from one focused Agent prompt.
- Create three custom agents with clear, non-overlapping game responsibilities.
- Use each agent to make a scoped change to HTML, CSS, or JavaScript.
- Verify that agent instructions, tool boundaries, and manual review keep work controlled.

## Prerequisites and starting checkpoint

This lab is independent. Create and open an empty folder named `tetris-custom-agents`
as the VS Code workspace root. No existing artifacts, package manager, runtime,
or build step is required.

## Learner actions

1. Create and open the empty `tetris-custom-agents` folder in VS Code.
2. Open Chat and select **Agent**.
3. Send the focused build prompt below.

```text
Create a playable Tetris game as a fresh static web application.

Create only index.html, styles.css, and app.js in this workspace. Use plain HTML,
CSS, and JavaScript without packages, a build step, or external assets. Render a
10-column board, show the next piece, score, level, and cleared-line count. Support
left, right, down, rotate, hard drop, pause, restart, line clearing, and game over.
Use keyboard controls and visible on-screen controls. Keep the layout usable on a
small screen. Do not create documentation, configuration, or dependency files.
After editing, summarize the controls and the files changed.
```

4. Review the proposed file list before approving the edits.
5. Open `index.html` in a browser and confirm the board, score, and controls render.
6. Play briefly and confirm that a piece can move, rotate, and hard drop.
7. Create the `.github/agents` directory.
8. Create `.github/agents/tetris-gameplay.agent.md` with display name `Tetris Gameplay`.
9. Give it a description containing Tetris controls, movement, rotation, scoring,
   line clearing, pause, restart, and game-over triggers.
10. Set its tools to `[read, search, edit]` and define its role as changing only
    game behavior in `app.js`; it must not redesign the page or add dependencies.
11. Create `.github/agents/tetris-interface.agent.md` with display name `Tetris Interface`.
12. Give it a description containing game layout, board visibility, on-screen
    controls, responsive design, contrast, and keyboard instructions.
13. Set its tools to `[read, search, edit]` and define its role as changing only
    `index.html` and `styles.css`; it must not change game rules in `app.js`.
14. Create `.github/agents/tetris-qa.agent.md` with display name `Tetris QA`.
15. Give it a description containing browser game testing, controls, score, line
    clearing, pause, restart, and game-over verification.
16. Set its tools to `[read, search]` and require a findings-first report with
    reproducible steps; it must not edit application files.
17. Save all three agents and resolve customization diagnostics before using them.
18. Select **Tetris Gameplay** from the agent picker and ask it to add a clear,
    visible paused state while preserving existing controls.
19. Review and approve only the `app.js` change, then confirm pause and restart work.
20. Select **Tetris Interface** and ask it to improve the visibility and spacing of
    the on-screen controls on a narrow browser window.
21. Review and approve only changes to `index.html` or `styles.css`, then test the
    controls at a narrow browser width.
22. Select **Tetris QA** and ask it to test the game for movement, rotation, hard
    drop, pause, restart, scoring, and game-over behavior.
23. Review the QA findings, reproduce one reported result, and decide whether a
    gameplay or interface change is needed.
24. Start a general Agent chat and ask which custom agent should investigate a
    score calculation problem; confirm it selects or recommends **Tetris Gameplay**.
25. Ask **Tetris QA** to fix a visual issue and verify that it reports the issue
    instead of receiving edit authority.
26. Inspect all changed files and confirm that only the three application files and
    three custom agent files were created.

## Validation

```powershell
Get-ChildItem -Recurse -File | Select-Object FullName
Select-String -Path .github/agents/*.agent.md -Pattern "name: Tetris|tools: \[read, search"
```

Open `index.html` in a browser. Confirm the game renders, the keyboard and on-screen
controls work, and the three custom agents appear in the agent picker.

## Checkpoint

- **Files:** `index.html`, `styles.css`, `app.js`, and three files under `.github/agents`.
- **Behavior:** the browser game is playable and each custom agent owns a distinct
  gameplay, interface, or quality-assurance operation.
- **Evidence:** reviewed initial prompt output, working controls, customization
  diagnostics, three agent definitions, one scoped change per editing agent, and a
  read-only QA report.

## Recovery

If the initial prompt creates extra files, remove only files outside the requested
three application files. If an agent is missing, verify its `.agent.md` suffix,
frontmatter delimiters, description, and customization diagnostics. If a custom
agent appears to have broader authority than intended, review its `tools` list and
start a new chat after saving the definition.

## Cleanup

Keep the completed game and three agent definitions for experimentation. Remove any
temporary agent instructions or files that were not part of the requested game.

[Back to course](../../README.md) · [Next: Agent Skills](../06-agent-skills/README.md)
