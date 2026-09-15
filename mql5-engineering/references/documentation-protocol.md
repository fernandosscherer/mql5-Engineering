# Documentation protocol

Documentation is part of the definition of done.

## Planning question

The start questionnaire asks whether the user wants:

- a dedicated task/project document;
- only existing documentation updated;
- to decide during planning.

Suggested names depend on the task:

- `docs/documentation.md`
- `docs/architecture.md`
- `docs/strategy.md`
- `docs/risk-management.md`
- `docs/licensing.md`
- `docs/backend-api.md`
- `docs/debug-<topic>.md`
- `docs/code-review.md`

Prefer existing source-of-truth docs and avoid duplicate documents.

## Mandatory post-change review

Whenever approved work changes project behavior, review documentation affected by:

- inputs/defaults;
- strategy rules;
- entry/exit;
- risk management;
- schedules;
- state transitions;
- symbol/market support;
- buffers/indicator contract;
- UI behavior;
- architecture;
- licensing;
- backend/API;
- tester assumptions;
- known limitations.

Update existing relevant docs by default.

If the project uses `CHANGELOG.md`, record material changes such as new features, operational bug fixes, behavior changes, new inputs, licensing changes, supported-market changes, breaking changes, or meaningful UI changes.

## Consistency gate

Before completion ask:

- does documentation still describe removed/old behavior?
- do documented defaults match code?
- do documented times/limits match code?
- do buffer indexes/contracts match implementation?
- does licensing/API documentation match current endpoints/states?
- does UI documentation match the actual control semantics?

A code-changing task is incomplete while relevant documentation is inconsistent with the implementation.
