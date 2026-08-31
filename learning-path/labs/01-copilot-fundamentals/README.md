# Lab 1: GitHub Copilot Fundamentals

**Expected time:** 45-60 minutes

Create a local repository and a tested inventory domain while practicing the
main Copilot interaction surfaces. Complete only one language track.

## Objectives

- distinguish inline suggestions, inline chat, and Chat view;
- provide file context and constrain a response;
- accept, partially accept, or reject generated code deliberately; and
- validate generated behavior with tests and Git diffs.

## Prerequisites

Complete [environment setup](../../docs/environment-setup.md). Start from a
directory in which you are comfortable creating `copilot-inventory`.

## Steps

1. Open a terminal and create the working directory:

   ```powershell
    New-Item -ItemType Directory copilot-inventory
    Set-Location copilot-inventory
   ```

2. Initialize the repository with `git init` and confirm `git status` reports an
   empty repository.
3. Open the directory in VS Code with `code .` and confirm Copilot is signed in.
4. Create a `.gitignore` using the matching track block:

   ```text
   # Python: .venv/, __pycache__/, *.egg-info/, .pytest_cache/
   # .NET: bin/, obj/
   # TypeScript: node_modules/, dist/, coverage/
   ```

   Put each pattern on its own line and include only your selected track.
5. Scaffold the selected track from the VS Code terminal:

   **Python**

   ```powershell
   python -m venv .venv
   .\.venv\Scripts\Activate.ps1
   python -m pip install pytest
   New-Item -ItemType Directory -Force src\inventory, tests
   New-Item -ItemType File src\inventory\__init__.py, tests\test_item.py
   ```

   **.NET**

   ```powershell
   dotnet new sln -n Inventory
   dotnet new classlib -n Inventory.Domain -f net8.0
   dotnet new xunit -n Inventory.Domain.Tests -f net8.0
   dotnet sln add Inventory.Domain Inventory.Domain.Tests
   dotnet add Inventory.Domain.Tests reference Inventory.Domain
   ```

   **TypeScript**

   ```powershell
   npm init -y
   npm install --save-dev typescript vitest @types/node
   New-Item -ItemType Directory src, tests
   npx tsc --init
   ```

6. For Python, create `pyproject.toml` with project metadata and pytest configured
   to add `src` to `pythonpath`. For TypeScript, add `build: tsc --noEmit` and
   `test: vitest run` scripts, then set `strict`, `noUncheckedIndexedAccess`,
   `target: ES2022`, and `module: NodeNext` in `tsconfig.json`. Ask Chat for an
   explanation if needed, but edit and review the configuration yourself.
7. Run the empty test suite: `python -m pytest`, `dotnet test`, or `npm test`.
   Record what “no tests” looks like for your framework.
8. Create the production file: `src/inventory/item.py`,
   `Inventory.Domain/InventoryItem.cs`, or `src/inventory-item.ts`.
9. At the top of the production file, type a comment describing an inventory
   item with SKU, name, quantity, and reorder level. Pause for an inline
   suggestion.
10. Inspect the suggestion without accepting it. Check mutability, types,
    naming, and whether it added unrequested dependencies.
11. Accept only a useful portion of the suggestion. Reject or edit anything
    outside this initial contract:

    ```text
    SKU and name are required text. Quantity and reorder level are non-negative
    integers. Quantity may change; the other values do not change.
    ```

12. Add a low-stock property by typing a track-appropriate name:
    `is_low_stock`, `IsLowStock`, or `isLowStock`. Let inline completion propose
    the body.
13. Review the boundary operator before accepting it. Low stock means quantity
    is **less than or equal to** reorder level.
14. Select the new property, open inline chat with `Ctrl+I`, and send:

    ```text
    Add a concise documentation comment for this member. Do not change its
    signature or behavior.
    ```

15. Review the inline diff and keep it only if it documents the equality
    boundary accurately.
16. Open Chat view with `Ctrl+Alt+I`, attach the production file, and ask:

    ```text
    Explain the low-stock boundary behavior with two concrete examples. Use the
    attached file as evidence. Do not edit files.
    ```

17. Verify that one example is below the reorder level and one is exactly equal.
    Ask a correction if the explanation contradicts the code.
18. Open the test file and type the name of a test for equality at the reorder
    level. Pause and inspect Copilot's inline test suggestion.
19. Accept or edit the test so it constructs an item with quantity `5` and
    reorder level `5`, then asserts that it is low stock.
20. Add a second test proving quantity `6` with reorder level `5` is not low
    stock. Try partial acceptance instead of accepting the entire suggestion.
21. Export or import `InventoryItem` as required by your track. Keep the public
    API minimal and do not add a web framework or database.
22. Run the focused test file, then run the full test suite. Resolve only errors
    needed for these two behaviors.
23. Ask Chat to review the production and test files with this prompt:

    ```text
    Check only the stated inventory contract, the equality boundary, and test
    coverage. Lead with concrete findings. Do not edit files.
    ```

24. Inspect `git diff` and `git status`. Remove generated artifacts that belong
    in `.gitignore`, but retain your source and configuration.
25. Commit the passing baseline:

    ```powershell
    git add .
    git commit -m "chore: establish inventory baseline"
    ```

## Checkpoint

The repository contains language-native project configuration, one production
type, and at least two low-stock boundary tests. The full suite passes, the Git
working tree is clean, and no generated build output is committed.

Explain why inline completion suited a small implementation, inline chat suited
a selected edit, and Chat view suited explanation and review.

## Recovery

If scaffolding fails, run the version check from environment setup and correct
the command before asking Copilot to change project files. If a completion adds
extra architecture, reject it and restate the four-field contract.

## Navigation

[Previous: Environment setup](../../docs/environment-setup.md) |
[Course contents](../../README.md) |
[Next: Lab 2 - Prompting and core scenarios](../02-prompting-and-core-scenarios/README.md)
