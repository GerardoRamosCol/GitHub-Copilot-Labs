# Repository instructions

- Keep Python, .NET, and TypeScript track behavior equivalent.
- Make changes only in the learner's selected track unless explicitly asked to
  update shared documentation or infrastructure.
- Preserve public APIs unless the request explicitly changes the contract.
- Prefer the smallest implementation that satisfies stated acceptance criteria.
- Add focused tests for behavior changes and run the selected track's full suite.
- Do not add databases, web frameworks, cloud services, or dependencies unless
  the task requires them.
- Report changed files, commands run, results, and remaining risks.
- Never commit secrets, tokens, tenant identifiers, or learner-specific values.

## Track conventions

- Python: use type hints, pytest, and `ValueError` for invalid domain input.
- .NET: use nullable reference types, xUnit, and standard argument exceptions.
- TypeScript: keep strict type checking enabled, use Vitest, and avoid `any`.
