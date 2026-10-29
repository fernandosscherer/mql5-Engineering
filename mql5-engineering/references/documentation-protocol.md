# Documentation protocol

Documentation is part of the definition of done.

## Repository language policy

All repository documentation must be written in **English**.

This includes README files, `SKILL.md`, contributor/release documentation, and Markdown under `docs/`, `workflows/`, `auditors/`, `invariants/`, `scenarios/`, `engineering/`, `references/`, and `templates/`.

Do not introduce mixed-language repository documentation. A target product may intentionally expose UI text or messages in another language, but the repository documentation that explains that behavior must remain in English.

When reviewing or updating documentation, treat accidental non-English prose as a documentation defect and correct it before completion.

## Planning

During planning, determine whether the task requires:

- a dedicated task or project document;
- updates to existing source-of-truth documentation only;
- no documentation change because behavior is unaffected.

Suggested names depend on the task:

- `docs/documentation.md`
- `docs/architecture.md`
- `docs/strategy.md`
- `docs/risk-management.md`
- `docs/licensing.md`
- `docs/backend-api.md`
- `docs/debug-<topic>.md`
- `docs/code-review.md`

Prefer existing source-of-truth documents and avoid duplicate documentation.

## Mandatory post-change review

Whenever approved work changes project behavior, review documentation affected by:

- inputs and defaults;
- strategy rules;
- entry and exit behavior;
- risk management;
- schedules and time semantics;
- state transitions;
- symbol or market support;
- broker and account-model assumptions;
- buffers and indicator contracts;
- UI behavior;
- architecture;
- licensing;
- backend or API behavior;
- Strategy Tester assumptions;
- MQL5 Market or release constraints;
- known limitations.

Update existing relevant documentation by default.

If the project uses `CHANGELOG.md`, record material changes such as new features, operational bug fixes, behavior changes, new inputs, licensing changes, supported-market changes, breaking changes, or meaningful UI changes.

## Consistency gate

Before completion, verify:

- all repository documentation added or modified by the task is in English;
- documentation does not describe removed or superseded behavior;
- documented defaults match code;
- documented times and limits match code;
- buffer indexes and contracts match implementation;
- broker/account assumptions match the implementation;
- licensing and API documentation match current endpoints and states;
- UI documentation matches actual control semantics;
- release documentation matches current validation requirements;
- references point to files and concepts that still exist.

A code-changing task is incomplete while relevant documentation is inconsistent with the implementation.
