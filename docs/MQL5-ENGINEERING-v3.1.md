# MQL5 Engineering v3.1

**Production-oriented engineering system for MetaTrader 5 / MQL5**

**Author:** Fernando Scherer  
**Repository:** https://github.com/fernandosscherer/mql5-Engineering  
**Version:** 3.1.0

---

## 1. Overview

MQL5 Engineering is an AI-assisted engineering system for building, improving, debugging, reviewing, auditing, and releasing MQL5 products.

Version 3.1 extends the discovery-first engineering router introduced in v3.0 with stronger production-readiness mechanisms:

- independent specialized auditors;
- cross-cutting engineering invariants;
- stable adversarial scenario packs;
- explicit broker/account compatibility reasoning;
- structured validation levels;
- MQL5 Market readiness checks;
- RELEASE readiness assessment.

> **Facts are the agent's job. Decisions are the user's job.**

If a fact can be discovered from source code, documentation, presets, logs, tester artifacts, configuration, repository history, or authoritative MQL5 documentation, the skill should discover it before asking the user.

Operating modes:

- **BUILD**
- **IMPROVE**
- **DEBUG**
- **REVIEW**
- **AUDIT**
- **RELEASE**

---

## 2. Core principles

### Inspect first, ask second

Discover code, documentation, presets, logs, tester assets, Git history, broker assumptions, and configuration before asking for information that may already exist.

### Questions are exceptional

Ask only when a material decision, inaccessible external fact, unresolved ambiguity, or user-only artifact is required to proceed safely.

### Evidence before conclusions

A finding without evidence is a hypothesis. CRITICAL and HIGH findings require re-verification and an attempt to falsify them before final reporting.

### Adversarial engineering

The skill should not merely confirm that code looks reasonable. It should actively search for ways the implementation can fail under realistic execution, broker, account, data, timing, state, and risk conditions.

### Compilation is not behavioral proof

Successful compilation proves build/syntax validity only. It does not prove trading correctness, release readiness, operational safety, or profitability.

### Release readiness is not profitability

A product may be technically ready for release and still have no demonstrated trading edge. RELEASE must never be presented as a profitability verdict.

---

## 3. Architecture

```text
mql5-engineering/
├── SKILL.md
├── README.md
├── workflows/
│   ├── build.md
│   ├── improve.md
│   ├── debug.md
│   ├── review.md
│   ├── audit.md
│   └── release.md
├── auditors/
│   ├── architecture.md
│   ├── code.md
│   ├── documentation.md
│   ├── economic-calendar.md
│   ├── indicator.md
│   ├── licensing.md
│   ├── mql5-market.md
│   ├── performance.md
│   ├── regulatory.md
│   ├── risk.md
│   ├── spec-compliance.md
│   ├── state.md
│   ├── tester.md
│   ├── time-session.md
│   ├── trade-execution.md
│   ├── trading-logic.md
│   └── ui.md
├── invariants/
│   ├── execution.md
│   ├── financial-risk.md
│   ├── indicators.md
│   ├── position-ownership.md
│   └── state-lifecycle.md
├── scenarios/
│   ├── execution.md
│   ├── market-validation.md
│   ├── risk.md
│   ├── state.md
│   ├── tester.md
│   └── xauusd.md
├── engineering/
│   ├── codebase-design.md
│   ├── debugging.md
│   ├── domain-modeling.md
│   ├── evidence.md
│   └── testing.md
├── references/
├── templates/
└── scripts/
```

`SKILL.md` is the operating constitution and router. Workflows define process. Auditors define independent review missions. Invariants define cross-cutting truths. Scenarios define repeatable failure conditions. References provide MQL5-specific technical guidance. Engineering modules provide general software-engineering methodology.

---

## 4. Activation behavior

When explicitly activated for an interactive task, activation should remain minimal and avoid narrating internal loading or hidden reasoning.

```text
MQL5 ENGINEERING v3.1.0
[ BUILD ] [ IMPROVE ] [ DEBUG ] [ REVIEW ] [ AUDIT ] [ RELEASE ]

Discover → Route → Engineer → Validate → Audit → Release
Facts → Agent | Decisions → User
```

If the task is already clear, route immediately. Do not force a questionnaire.

---

## 5. Router

```text
"Create a new EA"                → BUILD
"Add trailing stop"              → IMPROVE
"It sometimes opens twice"       → DEBUG
"Review this branch"             → REVIEW
"Audit this EA"                  → AUDIT
"Audit only financial risk"      → AUDIT / focused
"Is this ready for MQL5 Market?" → RELEASE
```

The modes are intentionally distinct:

- **REVIEW** asks whether a bounded change is correct.
- **AUDIT** asks what is defective, fragile, contradictory, risky, or unsafe in the current system.
- **RELEASE** asks whether a fixed product version is sufficiently validated and documented to ship under stated conditions.

---

## 6. BUILD

Typical flow:

```text
Intent
→ Discovery
→ Missing decisions
→ Architecture
→ Plan
→ Approve
→ Build
→ Validate
→ Review
→ Document
```

A BUILD plan should define, as applicable:

- modules and interfaces;
- state ownership;
- trade lifecycle;
- risk ownership;
- invariants;
- test seams;
- broker assumptions;
- persistence/restart behavior;
- documentation impact.

---

## 7. IMPROVE

IMPROVE covers PATCH, FEATURE, and REFACTOR work.

```text
Request
→ Current behavior
→ Change surface
→ Plan
→ Approve
→ Implement
→ Regression validation
→ Focused review
→ Document
```

Unrelated behavior should remain unchanged unless explicitly included in the approved scope.

---

## 8. DEBUG

DEBUG starts from a reproducible symptom whenever practical.

```text
Symptom
→ Feedback loop
→ Reproduce
→ Minimize
→ Falsifiable hypotheses
→ Instrument
→ Root cause
→ Plan
→ Approve
→ Fix
→ Regression validation
→ Review
```

Possible feedback loops include Strategy Tester scenarios, logs, deterministic harnesses, replayable inputs, or differential runs.

Root-cause confidence should be explicit:

- CONFIRMED ROOT CAUSE
- PROBABLE ROOT CAUSE
- HYPOTHESIS - TEST REQUIRED

---

## 9. REVIEW

REVIEW is bounded by a branch, commit, PR, diff, or explicit change set.

Primary axes:

- **Spec** — does the change match the intended requirement?
- **Engineering** — is the implementation structurally sound and maintainable?
- **Bug/Risk** — does the change introduce a concrete correctness, operational, or financial risk?

Pre-existing issues outside the diff should not be blamed on the reviewed change unless they are required to explain a regression caused by it.

---

## 10. AUDIT

AUDIT is read-only by default.

```text
Intent
→ Silent discovery
→ Applicability matrix
→ Behavior map
→ Independent auditors
→ Invariants
→ Adversarial scenarios
→ Verification
→ Aggregate findings
→ Coverage gate
→ Readiness
→ Report
```

Default domains:

1. code correctness and MQL5 semantics;
2. specification/documentation compliance;
3. trading correctness and robustness;
4. trade execution;
5. position/order/deal state and ownership;
6. financial risk and exposure;
7. indicator/data correctness when present;
8. Strategy Tester/live fidelity;
9. time/session semantics when present;
10. Economic Calendar behavior when present;
11. architecture and maintainability;
12. performance/resource lifecycle;
13. UI/operational controls when present;
14. licensing/backend/security when present;
15. documentation consistency;
16. regulatory/user-claim flags when materially relevant;
17. MQL5 Market validation risk when release/publication is relevant.

A domain that does not exist is **N/A**, not a question for the user.

---

## 11. RELEASE

RELEASE is also read-only unless the user separately requests fixes.

It evaluates whether the current fixed point is ready to deliver, distribute, tag, or submit to MQL5 Market.

Recommended flow:

```text
Discovery
→ Product topology
→ Compile/build evidence
→ Critical-path audit
→ Broker/account compatibility
→ Netting/hedging behavior
→ Strategy Tester behavior
→ Market-validation scenarios
→ Risk validation
→ Operational resilience
→ Documentation consistency
→ Release verdict
```

Verdicts:

- `READY`
- `CONDITIONAL`
- `BLOCKED`
- `LIMITED COVERAGE`

`READY` means no known release blocker inside adequately reviewed scope. It does not mean profitable.

---

## 12. Behavior maps

### Expert Advisor

```text
Signal/data
→ Filters
→ Risk permission
→ Sizing
→ Request construction
→ OrderCheck
→ OrderSend / OrderSendAsync
→ Server response / retcode
→ Order
→ Deal(s)
→ Position
→ Protection
→ Management
→ Exit
→ Accounting/reset
→ Restart/recovery
```

### Indicator

```text
Source data
→ Dependency handles
→ Calculation lifecycle
→ Buffers/plots
→ Current/closed bar semantics
→ EA-consumed signal
```

---

## 13. Engineering invariants

Invariants are cross-cutting correctness/safety properties. They do not replace product requirements.

Examples:

### Execution

- accepted trade request is not equivalent to completed execution;
- rejected or incomplete execution must not be recorded as a completed position;
- duplicate callbacks or signals must not create unintended duplicate exposure;
- asynchronous lifecycle events must be reconciled explicitly.

### Financial risk

- normalized requested volume must remain inside the configured risk budget;
- minimum lot constraints must not silently increase risk above allowed limits;
- invalid symbol economics must fail safely;
- aggregate exposure must include already-open risk;
- protective exits must remain available during external-service failures.

### Position ownership

- an EA must not modify or close positions it cannot prove it owns;
- ownership logic must account for symbol, magic, ticket/identifier, strategy context, and account model as applicable;
- netting must not be treated as hedging;
- manual and foreign-EA positions must not be captured accidentally.

### State lifecycle

- restart/reconnect must reconcile broker state before new decisions;
- stale internal state must not override current broker truth;
- delayed transactions must not create impossible state transitions.

### Indicators

- indicator handles must be validated and released;
- `CopyBuffer()` results must be checked;
- insufficient history/data must fail safely;
- forming-bar versus closed-bar semantics must be explicit.

---

## 14. Independent auditors

### Code

MQL5 semantics, event handlers, arrays, indexing, resource ownership, error handling, object lifecycle, and API misuse.

### Spec compliance

Implementation versus documented requirements. Never invent a specification from the implementation and then claim non-compliance.

### Trading logic

Separates:

- **strategy correctness** — does implementation match the documented strategy?
- **strategy robustness** — does intended behavior survive realistic timing, state, data, and execution conditions?

### Trade execution

Inspect `OrderCheck()`, `MqlTradeRequest`, `MqlTradeResult`, `OrderSend()`, `OrderSendAsync()`, `OnTradeTransaction()`, retcodes, filling modes, stop/freeze constraints, partial/rejected execution, retries, cancellation, modification, close, and restart during the lifecycle.

`OrderSend() == true` must never be treated as proof that the trade fully executed.

### State and ownership

Infer the actual state machine and inspect request/order/deal/position transitions, stale selection, persistence, restart, reconnect, netting, hedging, manual trades, and foreign EA interference.

### Financial risk

Reconstruct the full path:

```text
Account state
→ Risk configuration
→ Entry / stop
→ Stop distance
→ Symbol economics
→ Monetary loss per lot
→ Raw volume
→ Broker normalization
→ Final requested volume
→ Existing exposure
→ Aggregate exposure
→ Margin
→ Worst plausible loss
```

### Indicator

Inspect `OnCalculate`, `prev_calculated`, buffer/plot contracts, indexing, repaint, `CopyBuffer`, `BarsCalculated`, synchronization, handle lifecycle, and multi-symbol/timeframe behavior.

### Tester

Inspect modeling mode, spread, delay, gaps, sessions, persistence, timing assumptions, tick availability, and differences between tester and live execution.

### Time/session

Inspect `TimeCurrent()`, `TimeTradeServer()`, `TimeLocal()`, `TimeGMT()`, broker timezone, DST, session boundaries, daily reset logic, week transitions, and sparse-tick behavior.

### Economic Calendar

Inspect country/currency filters, event importance, blackout windows, server-time semantics, simultaneous events, missing calendar data, tester limitations, and failure behavior.

A news filter may block **new exposure**, but must not disable protective management of existing positions.

### Architecture

Assess module boundaries, interfaces, state ownership, execution ownership, testability, locality, duplication, and change cost.

### Performance

Inspect work per tick, loops, history scans, repeated handle creation, chart updates, synchronous external calls, timers, and long-running handlers.

### UI

Compare displayed state, configured state, and actual runtime state. Inspect chart-object lifecycle and operational-control semantics.

### Licensing/backend

Inspect activation, entitlement, expiry, revocation, retries, offline behavior, failure-safe position management, API boundaries, and secret handling.

### Documentation

Compare code with documented defaults, strategy rules, schedules, risk behavior, buffer contracts, UI, API, release assumptions, and known limitations.

### Regulatory

Flag areas requiring specialist review without pretending to provide final legal conclusions.

### MQL5 Market

Inspect automated-validation risks including unexpected symbols/timeframes, netting/hedging, minimum volume/deposit, missing data, unavailable indicators, `INIT_FAILED`, file/DLL/WebRequest dependencies, tester behavior, and product-documentation consistency.

---

## 15. Adversarial scenarios

Scenario packs provide stable IDs for repeatable failure-mode checks.

Examples include:

```text
EXE-001 duplicate signal on same tick
EXE-003 accepted request but execution not completed
EXE-004 partial execution
EXE-006 delayed OnTradeTransaction
EXE-008 restart after order request
RISK-001 minimum lot exceeds configured risk
RISK-003 tick value unavailable/zero
RISK-007 scaling exceeds campaign budget
STATE-001 restart while position is open
STATE-004 manual trade on same symbol
STATE-006 netting account merges exposure
MARKET-001 validation on non-target symbol
XAU-003 different XAUUSD tick value
XAU-009 minimum lot changes intended risk
```

Scenarios are evidence-generation tools, not proof by themselves.

---

## 16. Evidence Gate

A material finding should contain enough information for another engineer to verify it.

Recommended fields:

```yaml
id: RISK-003
domain: financial-risk
severity: CRITICAL
confidence: CONFIRMED BY CODE
nature: DEFECT
location:
  file: RiskManager.mqh
  function: CalculateLot
  lines: 118-142
invariant: normalized requested volume must remain inside risk budget
evidence: ...
trigger: ...
failure_scenario: ...
impact: ...
recommended_correction: ...
verification: ...
```

YAML is not mandatory; the fields are the important part.

CRITICAL and HIGH findings must be re-read against the complete call path and challenged for falsification before final reporting.

---

## 17. Confidence labels

- `CONFIRMED BY CODE`
- `CONFIRMED BY OFFICIAL DOCUMENTATION`
- `PROBABLE RISK`
- `HYPOTHESIS - TEST REQUIRED`
- `BROKER / ENVIRONMENT DEPENDENT`

When tests were actually performed, the report should state that separately under validation evidence instead of inventing unperformed results.

---

## 18. Finding nature

Useful categories include:

- `DEFECT`
- `DESIGN RISK`
- `HARDENING`
- `TEST GAP`
- `ENVIRONMENT DEPENDENT`
- `CODE VS SPEC DEFECT`
- `SPEC AMBIGUITY`
- `ARCHITECTURE DEFECT`
- `BUSINESS / STRATEGY DECISION`
- `REGULATORY REVIEW REQUIRED`

---

## 19. Severity

**CRITICAL** — plausible path to uncontrolled financial exposure, wrong-position action, protection failure, destructive state corruption, or behavior unsafe for production.

**HIGH** — serious correctness or operational failure that can materially alter trading behavior, execution, state, or customer operation.

**MEDIUM** — real defect or robustness gap with bounded impact.

**LOW** — maintainability, clarity, local resilience, or minor UX issue.

**INFO** — observation without a defect claim.

---

## 20. Coverage Gate

Before claiming there are no CRITICAL/HIGH findings, report coverage of:

- runtime entry points;
- trade lifecycle;
- risk/exposure path;
- state/ownership path;
- source-of-truth specifications;
- applicable indicator/tester/time/licensing/UI/release paths.

An uninspected material path results in `LIMITED COVERAGE`, not a clean `READY` result.

---

## 21. Validation levels

`engineering/testing.md` defines a common vocabulary:

- **LEVEL 0** — static inspection
- **LEVEL 1** — compilation/build
- **LEVEL 2** — deterministic logic validation
- **LEVEL 3** — Strategy Tester scenario
- **LEVEL 4** — cross-symbol/account-model validation
- **LEVEL 5** — stress/adversarial validation
- **LEVEL 6** — demo forward validation

Reports must distinguish validation performed from validation not performed.

Example:

```text
Validation performed
[PASS] compilation
[PASS] Strategy Tester XAUUSD
[PASS] netting

Validation not performed
[NOT TESTED] reconnect
[NOT TESTED] demo forward validation
```

---

## 22. Broker compatibility

Do not assume fixed behavior for:

- execution mode;
- filling mode;
- netting/hedging;
- stops level;
- freeze level;
- volume min/max/step;
- tick size/value;
- contract size;
- profit/margin/account currency;
- session schedule;
- symbol suffix/prefix;
- margin model;
- market status.

Classify conclusions as appropriate:

- `CODE DEFECT`
- `BROKER DEPENDENT`
- `SYMBOL DEPENDENT`
- `ACCOUNT MODEL DEPENDENT`
- `TEST REQUIRED`

---

## 23. Time semantics

Time-related logic must distinguish, as applicable:

- terminal/local machine time;
- trade server time;
- GMT;
- bar time;
- broker session time;
- Economic Calendar event time;
- daily-reset boundaries;
- DST transitions.

Never assume these are interchangeable.

---

## 24. Trade execution baseline

```text
Signal
→ Market/account/risk validation
→ OrderCheck
→ Request
→ Server acceptance
→ Retcode
→ Order(s)
→ Deal(s)
→ Trade transactions
→ Confirmed position
→ Protection
```

Execution logic should account for asynchronous and partial outcomes.

---

## 25. State and ownership

Magic number alone may be insufficient.

Use relevant identifiers and context such as:

- symbol;
- magic;
- `POSITION_IDENTIFIER`;
- `POSITION_TICKET`;
- `ORDER_POSITION_ID`;
- `DEAL_POSITION_ID`;
- reason properties;
- strategy metadata;
- account model.

Broker state should be treated as authoritative when rebuilding internal state after restart/reconnect.

---

## 26. Market portability

Never assume:

- point equals pip;
- tick value is fixed;
- contract size is fixed;
- volume step is fixed;
- filling mode is fixed;
- stops level is fixed;
- XAUUSD has identical economics across brokers.

Prefer live symbol/account metadata and fail safely when required properties are invalid or unavailable.

---

## 27. Multi-symbol systems

Inspect:

- symbol readiness;
- `SymbolIsSynchronized()`;
- timestamps;
- `CopyRates()` / `CopyBuffer()`;
- `BarsCalculated()`;
- session availability;
- bar detection per symbol/timeframe;
- asynchronous data readiness.

---

## 28. Strategy Tester fidelity

Distinguish modeling modes and choose validation according to strategy sensitivity:

- Open Prices;
- 1 Minute OHLC;
- Every Tick;
- Every Tick based on real ticks.

A strategy that depends on intrabar sequencing, spread, stop execution, or timing usually requires stronger modeling than Open Prices.

---

## 29. Optimization

Do not approve parameters merely because they maximize profit.

When optimization is relevant, inspect robustness using metrics and structure such as:

- trade count;
- drawdown;
- recovery;
- expected payoff;
- Sharpe-like metrics when meaningful;
- neighboring parameter stability;
- forward/out-of-sample behavior;
- regime sensitivity.

Optimization evidence is not proof of future profitability.

---

## 30. Architecture vocabulary

**Module** — interface plus implementation.  
**Interface** — what callers need to know.  
**Depth** — useful behavior hidden behind a small interface.  
**Seam** — testable or replaceable boundary.  
**Adapter** — concrete implementation behind a seam.  
**Leverage** — value delivered relative to interface complexity.  
**Locality** — keeping behavior, state, and verification close together.

A useful deletion test: if removing a module spreads complexity across many callers, the module is probably providing architectural value.

---

## 31. Testing

Prefer tests that can actually fail for the requirement or defect being investigated.

Avoid:

- tests that merely mirror implementation details;
- tests that only prove the EA does not crash;
- treating compilation as behavioral validation;
- claiming live behavior from tester evidence alone.

For bugs, establish a red-capable feedback loop before fixing when practical.

---

## 32. Documentation policy

Repository documentation is maintained in English.

This applies to:

- README files;
- `SKILL.md`;
- workflows;
- auditors;
- invariants;
- scenarios;
- engineering references;
- templates;
- docs;
- changelog entries;
- contributor-facing documentation.

A code-changing task is incomplete while relevant documentation is inconsistent with the implementation.

---

## 33. Licensing and backend safety

Typical architecture:

```text
MQL5 client → HTTPS API → Backend / database
```

Never distribute administrative credentials, service-role keys, database master credentials, or equivalent secrets inside MQL5 clients.

Licensing/backend failures may block **new exposure** according to product policy, but must not disable protective management or safe closure of already-open positions.

---

## 34. Approval boundary

Read-only discovery, diagnosis, REVIEW, AUDIT, and RELEASE assessment do not require additional approval once explicitly requested.

Source-code changes follow:

```text
Discover → Decisions → Plan → Approve → Execute
```

If the user already provided an approved, complete plan and explicitly asked for execution, do not force redundant approval.

---

## 35. Re-audit and re-validation

Useful outcome labels:

- `RESOLVED`
- `PARTIALLY RESOLVED`
- `NOT RESOLVED`
- `REGRESSION`
- `NO LONGER APPLICABLE`

Validate behavior and invariants, not merely whether a line changed.

---

## 36. Safety

Never:

- validate with real money merely to test code;
- place live trades for engineering verification;
- modify production broker or licensing systems just to test;
- expose secrets;
- invent compilation/tester/broker results;
- claim profitability from source review, compilation, backtests, or optimization.

---

## 37. Completion criteria

### BUILD / IMPROVE / DEBUG

- implementation completed;
- applicable validation performed;
- focused post-change review performed;
- documentation updated;
- unperformed validation listed explicitly.

### REVIEW

- fixed point and reviewed diff explicit;
- findings evidence-backed;
- unchanged code outside the diff not blamed unless causally relevant.

### AUDIT

- scope derived from the actual project;
- applicable independent passes completed;
- coverage limitations stated;
- duplicate findings merged by root cause;
- CRITICAL/HIGH findings re-verified;
- readiness reported as READY, CONDITIONAL, BLOCKED, or LIMITED COVERAGE.

### RELEASE

- release fixed point explicit;
- validation and compatibility checks enumerated;
- broker/environment assumptions explicit;
- MQL5 Market risks assessed when relevant;
- residual gaps listed;
- verdict reported as READY, CONDITIONAL, BLOCKED, or LIMITED COVERAGE.

---

## 38. Migration from v3.0 to v3.1

Added in v3.1:

- RELEASE workflow;
- engineering invariants;
- adversarial scenario packs with stable IDs;
- MQL5 Market auditor;
- Economic Calendar auditor;
- time/session auditor;
- deeper risk, execution, state, tester, and trading-logic auditing;
- Broker Compatibility Matrix;
- time-semantics reference;
- structured evidence schema;
- validation levels 0–6;
- release report template;
- risk/volume verification helpers;
- static triage scanners;
- English-only repository documentation policy.

The central v3.0 principles remain unchanged:

- discovery first;
- Facts vs Decisions;
- REVIEW separated from AUDIT;
- evidence-backed findings;
- CRITICAL/HIGH verification;
- Coverage Gate;
- no artificial `/10` quality scores.

---

## 39. Source authority

For MQL5 language, API, runtime, event, trading, symbol/account, indicator, Economic Calendar, and Strategy Tester semantics, the current official MQL5 documentation is the primary authority:

https://www.mql5.com/en/docs

Repository documentation defines intended product behavior.

Broker/exchange specifications define instrument- and environment-specific behavior when applicable.

---

## 40. Final rule

> **The skill should not prove that the code looks correct. It should try to discover how it can fail.**

> **Without evidence, it is a hypothesis. Without validation, it is not confirmation.**
