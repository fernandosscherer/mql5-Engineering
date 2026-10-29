# Benchmarks

Benchmarks are the planned verification layer for measuring whether MQL5 Engineering detects known defects consistently and avoids unsupported findings.

The benchmark suite should evolve around reproducible cases rather than subjective quality scores.

## Goals

- verify that known defects are detected;
- track false positives and missed findings;
- compare behavior across skill versions and compatible runtimes;
- protect stable engineering semantics from prompt or documentation regressions;
- provide evidence for changes to auditors, invariants, scenarios, and validation rules.

## Benchmark case structure

A future benchmark case should include:

```text
case-id/
├── README.md
├── fixture/
├── expected-findings.md
└── validation-notes.md
```

Each case should define:

- objective;
- known defect or expected behavior;
- relevant files and fixed point;
- expected minimum findings;
- findings that would be false positives;
- required evidence level;
- validation limitations.

## Candidate benchmark domains

- duplicate same-bar entries;
- accepted request mistaken for completed execution;
- partial/rejected fills;
- netting versus hedging ownership errors;
- restart with broker exposure still open;
- risk sizing above the configured ceiling;
- broker volume normalization errors;
- stale or unsynchronized indicator data;
- Strategy Tester/live divergence;
- MQL5 Market validation under unexpected symbol/timeframe/account conditions.

## Golden reports

Golden reports should define the minimum defensible result, not force exact wording. A benchmark should reward correct evidence and classification rather than stylistic similarity.

No benchmark result should be presented as proof of profitability or live-trading safety.
