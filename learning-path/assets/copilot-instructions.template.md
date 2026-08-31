# Inventory Project Guidelines

- Work only in the selected Python, .NET, or TypeScript track.
- Preserve public APIs unless the request explicitly changes the contract.
- Prefer the smallest implementation that satisfies the acceptance criteria.
- Add focused tests for behavior changes and run the full track suite.
- Keep domain logic independent of databases, web frameworks, and cloud services.
- Do not add a dependency unless the task requires it and approval is explicit.
- Report changed files, commands run, results, and remaining risks.
- Never commit secrets, tokens, tenant identifiers, or learner-specific values.

## Selected Track

Replace this section with exactly one track:

- Python: use type hints, pytest, and `ValueError` for invalid domain input.
- .NET: enable nullable reference types, use xUnit, and use standard argument
  exceptions.
- TypeScript: keep strict checking enabled, use Vitest, and avoid `any`.
