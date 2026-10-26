# Trading logic auditor

Audit two separate dimensions.

## Strategy correctness

Does the implementation behave according to the documented strategy specification? Trace setup, signal, filters, entry permission, sizing, management, exit and reset rules against repository sources of truth.

## Strategy robustness

Does the intended behavior survive realistic platform/data/state conditions? Challenge duplicate ticks, same-bar re-entry, forming-bar versus closed-bar semantics, repaint/look-ahead, restart, delayed data, multi-timeframe synchronization, missing history, partial execution and state races.

Do not infer undocumented trading requirements from implementation details and then call them violations.

Use applicable invariants and scenario packs. Distinguish strategy-spec defects from execution/state defects even when they interact.

References: references/source-policy.md, engineering/domain-modeling.md.
