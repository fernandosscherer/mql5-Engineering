# Audit report template

Recommended target when the repository does not define another path: `docs/code-review.md`.

```markdown
# Code Review — <Project>

## Executive Summary

**Production readiness:** READY | CONDITIONAL | BLOCKED

## Scope

## Source-of-Truth Documents

## System / Behavior Map

## Risk Summary

| ID | Severity | Nature | Area | Summary |
|---|---|---|---|---|

## Findings

### CR-001 — <title>

- Severity:
- Confidence:
- Nature:
- File/function/lines:
- Technical reference:
- Problem:
- Evidence:
- Failure scenario:
- Operational/financial impact:
- Recommended correction:
- Side effects / decision needed:

## Trading Logic Review

## Financial Risk Review

## Trade Execution / State Review

## Indicator Correctness

## Market / Instrument Portability

## Tester / Backtest Reliability

## Licensing / Security

## Performance

## UI / UX

## Documentation Consistency

## Regulatory Flags

## Compilation

## Test Matrix

## Open Decisions

## Remediation Roadmap

### P0 — before real-money/production use
### P1 — high priority
### P2 — important improvement
### P3 — future improvement

## Final Scores

- Code reliability: /10
- Operational robustness: /10
- Financial risk controls: /10
- Trading logic clarity: /10
- Architecture: /10
- Performance: /10
- UI/UX: /10
- Documentation: /10

## Top 5 Issues
```

## Nature labels

Use as applicable:

- `CODE-INTERNAL DEFECT`
- `CODE VS SPEC DEFECT`
- `SPEC AMBIGUITY`
- `ROBUSTNESS IMPROVEMENT`
- `BUSINESS / STRATEGY DECISION`
- `REGULATORY REVIEW REQUIRED`
- `BROKER / ENVIRONMENT DEPENDENT`
