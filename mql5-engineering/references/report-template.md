# Audit report template

Recommended default target: `docs/code-review.md`.

```markdown
# MQL5 Engineering Audit — <Project>

## Executive Summary
**Production readiness:** READY | CONDITIONAL | BLOCKED | LIMITED COVERAGE

- CRITICAL:
- HIGH:
- MEDIUM:
- LOW:
- INFO:

## Scope
## Audit Coverage
## Project Profile
## Source-of-Truth Documents
## System / Behavior Map

## Findings

### AUD-001 — <title>
- Severity:
- Confidence:
- Nature:
- File/function/lines:
- Technical reference:
- Invariant/assumption:
- Evidence:
- Failure scenario:
- Impact:
- Recommended correction:
- Verification performed:

## Code Correctness
## Spec Compliance
## Trading / Operational Logic
## Trade Execution
## State / Ownership
## Financial Risk
## Indicator Correctness
## Tester / Live Fidelity
## Architecture
## Performance
## UI / Operational Controls
## Licensing / Security
## Documentation Consistency
## Regulatory / User-Claim Flags
## Compilation
## Validation / Test Matrix
## Open Decisions
## Remediation Roadmap
### P0
### P1
### P2
### P3
```

Do not produce numeric /10 scores.

A clean result with an uninspected critical path is `LIMITED COVERAGE`, not `READY`.
