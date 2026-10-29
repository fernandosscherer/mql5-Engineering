# Roadmap

This roadmap describes likely directions, not guaranteed delivery dates.

## Near term — Open-source foundation

- community contribution templates;
- project governance and security policy;
- clearer core-versus-extension boundaries;
- examples for common skill usage;
- benchmark structure for reproducible evaluation;
- documentation checks that protect English-only repository docs and internal links.

## v3.2 — Verification and Benchmarking

Primary goal: make skill quality measurable rather than relying only on architecture and prompt design.

Planned areas:

- benchmark EAs and synthetic failure cases;
- golden audit reports;
- regression cases for execution, state, financial risk, indicators, and Strategy Tester behavior;
- false-positive tracking;
- benchmark metadata for model/runtime comparisons;
- self-audit checks for broken references, orphaned scenarios, duplicate rules, and structural drift;
- stronger deterministic helpers for critical formulas and broker constraints.

## Future directions

Potential future work includes:

- additional domain auditors;
- community-maintained scenario packs;
- broker/environment compatibility fixtures;
- telemetry and logging review guidance;
- property-based validation patterns for risk and execution logic;
- machine-readable report formats;
- reusable release manifests;
- compatibility testing across Agent Skills runtimes.

## Non-goals

MQL5 Engineering is not intended to become:

- a signal-selling system;
- a profitability predictor;
- a substitute for broker/exchange specifications;
- a substitute for official MQL5 documentation;
- a vendor-locked prompt library;
- an autonomous live-money trading operator.

## Proposing roadmap work

Open a feature request or pull request describing the problem, why it belongs in the project, expected users, compatibility impact, and how the improvement can be validated.
