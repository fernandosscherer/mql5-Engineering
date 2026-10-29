# Contributing to MQL5 Engineering

Thank you for contributing to MQL5 Engineering.

This project is an open-source Agent Skill for production-oriented MetaTrader 5 / MQL5 engineering. Contributions should improve correctness, evidence quality, robustness, portability, or maintainability without turning the project into a vendor-specific prompt collection or a trading-signal product.

## Before contributing

Please read:

- `README.md`
- `GOVERNANCE.md`
- `CODE_OF_CONDUCT.md`
- `SECURITY.md`
- `ROADMAP.md`

For sensitive vulnerabilities, follow `SECURITY.md` instead of opening a public issue.

## What you can contribute

Useful contributions include:

- engineering workflows;
- specialized auditors;
- invariants;
- adversarial scenarios;
- technical references;
- benchmark fixtures and expected findings;
- examples;
- installer and helper tooling;
- documentation;
- runtime compatibility improvements;
- release-readiness improvements.

## Core versus extensions

The project separates a stable core from extensible domain knowledge.

### Core

The core includes:

- routing and operating-mode semantics;
- evidence requirements;
- validation levels;
- approval and safety boundaries;
- release-readiness semantics.

Core changes require stronger compatibility justification and validation.

### Extensions

Extensions include:

- `auditors/`;
- `invariants/`;
- `scenarios/`;
- `references/`;
- `templates/`;
- `examples/`;
- `benchmarks/`;
- helper tooling.

Prefer extending the project through these seams instead of expanding `SKILL.md` unless the rule is genuinely cross-cutting.

## Repository structure

```text
mql5-engineering/
├── SKILL.md                  # Main skill entry point
├── workflows/                # Operating modes
├── auditors/                 # Independent audit-domain briefs
├── invariants/               # Cross-cutting correctness/safety properties
├── scenarios/                # Stable adversarial scenario packs
├── references/               # Technical references
├── engineering/              # Engineering methodology
├── templates/                # Output templates
└── scripts/                  # Read-only inspection/validation helpers

examples/                     # Focused usage examples
benchmarks/                   # Reproducible verification cases
```

## Documentation language

All repository documentation must be written in **English**.

This applies to README files, `SKILL.md`, contributor/release documentation, and Markdown under `docs/`, `workflows/`, `auditors/`, `invariants/`, `scenarios/`, `engineering/`, `references/`, `templates/`, `examples/`, and `benchmarks/`.

User-facing product text may intentionally use another language when required by that product. The repository documentation that explains the behavior must still be in English.

## Engineering contribution standards

A good contribution should:

- solve a specific engineering problem;
- avoid duplicating an existing source of truth;
- distinguish defects from risks, hardening, test gaps, and environment-dependent behavior;
- preserve stable scenario identifiers where applicable;
- avoid unsupported profitability claims;
- avoid requiring live-money validation;
- avoid introducing vendor lock-in without a strong reason;
- document compatibility impact;
- include validation proportional to risk.

## Auditors

A new auditor should exist because a meaningful domain cannot be adequately reviewed by an existing auditor.

Auditor proposals should define:

- domain boundary;
- failure modes;
- evidence expected;
- adjacent modules;
- authoritative references when external semantics matter;
- what is explicitly out of scope.

Use the auditor/scenario proposal issue template when useful.

## Invariants

Invariants must describe properties that can be verified or falsified.

Good invariants are cross-cutting truths such as execution, ownership, risk, or lifecycle constraints. Do not use invariants to encode arbitrary strategy preferences.

## Scenarios

Scenario packs should exercise concrete failure modes rather than repeat auditor checklists.

Published scenario IDs are treated as stable interfaces. Do not rename, reuse, or silently reinterpret an existing ID without a documented compatibility reason.

## Benchmarks

Benchmarks should make skill quality measurable.

A benchmark should define:

- a reproducible fixture or source snapshot;
- the known defect or expected behavior;
- expected minimum findings;
- findings that would be false positives;
- required evidence level;
- validation limitations.

Golden reports should constrain engineering meaning, not exact wording.

See `benchmarks/README.md`.

## Examples

Examples should be small and educational. Do not contribute proprietary strategy code, customer code without permission, account data, credentials, or examples whose primary purpose is to advertise profitability.

See `examples/README.md`.

## Versioning

The project uses semantic versioning.

For a release, these canonical sources must agree:

| Source | Location |
|---|---|
| `VERSION` | root file |
| `SKILL.md` | YAML `version:` metadata |
| `scripts/banner.sh` | `VERSION="x.y.z"` |
| `install.sh` | `INSTALLER_VERSION="x.y.z"` |
| Git tag | `vX.Y.Z` |

Stable IDs, report semantics, install paths, and core workflow behavior should be considered when evaluating whether a change is breaking.

## Making a change

1. Search existing issues and documentation.
2. Create a focused branch.
3. Inspect the relevant source-of-truth files before editing.
4. Make the smallest coherent change that solves the problem.
5. Keep documentation in English.
6. Update `CHANGELOG.md` under `## Unreleased` for material changes.
7. Run applicable syntax and consistency checks.
8. Validate behavior at the highest practical level.
9. Review the final diff for duplication, stale references, secrets, and unintended behavior changes.
10. Open a pull request using the repository template.

## Pull request expectations

A pull request should explain:

- the problem;
- the change;
- validation actually performed;
- validation not performed;
- compatibility impact;
- safety/risk impact when relevant.

Do not claim compilation, Strategy Tester, broker, runtime, or market validation unless it was actually performed.

## Shell scripts

- Use `set -euo pipefail` unless there is a documented reason not to.
- Scripts should pass `bash -n`.
- Honor `NO_COLOR` and `MQL5_ENGINEERING_NO_ANIMATION=1` where applicable.
- Inspection helpers must not silently modify target projects.

## Security and secrets

Never commit:

- broker credentials;
- API tokens;
- service-role keys;
- private licensing secrets;
- database credentials;
- customer source code without permission;
- private account or trade data.

If a contribution exposes a vulnerability, follow `SECURITY.md`.

## Releases

Maintainer release flow:

1. choose the version;
2. synchronize version metadata;
3. move applicable changelog entries from `Unreleased`;
4. run release validation;
5. review compatibility and documentation;
6. commit and tag;
7. confirm the release workflow completes successfully.

## Questions

Open a GitHub issue for normal questions, bugs, feature proposals, auditor/scenario proposals, or contribution discussions.
