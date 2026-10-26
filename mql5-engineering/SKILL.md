---
name: mql5-engineering
description: Plan, build, improve, debug, review, audit, and release production-grade MQL5 Expert Advisors, indicators, libraries, and trading systems on MetaTrader 5. Uses discovery-first routing, approval-gated execution, official MQL5 documentation as primary authority, engineering invariants, adversarial scenarios, independent specialized audit passes, broker-compatibility reasoning, and explicit validation coverage. Market-agnostic: B3, Forex, metals (XAUUSD), CFDs, indices, and other MT5 instruments.
license: MIT
compatibility: "OpenCode and compatible Agent Skills runtimes"
metadata:
  audience: mql5-developers
  workflow: engineering-router
  version: "3.1.0"
  author: "Fernando Scherer"
  repository: "https://github.com/fernandosscherer/mql5-Engineering.git"
---

# MQL5 Engineering

## Activation

When explicitly activated for a new interactive task, run scripts/banner.sh once when shell execution is appropriate. Keep activation output minimal: banner, Carregando..., Pronto para uso!.

Do not narrate internal file loading, reference loading, tool calls, repository scans, or hidden reasoning.

If the user's request already states the task, route immediately after activation. Do not force a generic questionnaire.

If the user activates the skill without saying what they want, ask only:

What do you want to do?
A. Build
B. Improve
C. Debug
D. Review a change
E. Audit a product
F. Release readiness
G. Other

## Core operating principle

Facts are the agent's job. Decisions are the user's job.

Therefore:
- inspect the repository before asking for discoverable facts;
- read applicable source-of-truth documentation before asking how the system works;
- infer topology, dependencies, market assumptions, UI/licensing/tester presence and architecture from the project;
- ask only for a material decision, missing external fact, inaccessible artifact, or unresolved ambiguity that blocks safe progress;
- ask one blocking question at a time;
- never dump a ceremonial questionnaire.

## Router

Choose the narrowest workflow that matches the request.

- BUILD: create a new EA, indicator, library, panel, licensing client, or related component.
- IMPROVE: add a feature, change behavior, refactor, or improve an existing project.
- DEBUG: diagnose a concrete defect, regression, intermittent failure, unexpected behavior, or performance problem.
- REVIEW: inspect a change set, branch, commit range, PR, or diff and determine whether the change is correct.
- AUDIT: inspect a product or substantial subsystem as it exists now for defects, hazards, architecture problems, risk failures, spec mismatches, and production-readiness concerns.
- RELEASE: determine whether a product is sufficiently validated, documented, compatible, and operationally robust for delivery, distribution, or MQL5 Market submission.

Read workflows/<mode>.md after routing.

Do not collapse REVIEW, AUDIT, and RELEASE:
- REVIEW asks whether a change is correct.
- AUDIT asks what is wrong, fragile, missing, contradictory, or unsafe in the current system.
- RELEASE asks whether the current fixed point is ready to ship under stated conditions.

## Discovery before questions

For every mode except a purely greenfield BUILD with no repository, perform silent discovery first.

Establish as much as possible from code and docs:
1. product type and topology;
2. primary entry points and critical runtime paths;
3. relevant mq5, mqh, presets, tester files, logs, docs and configs;
4. documented strategy and operational requirements;
5. account model, symbol/market, time/session and risk assumptions;
6. UI, licensing, backend, multi-symbol, optimization and persistence presence;
7. available compile/test/tester feedback loops;
8. recent change context when REVIEW or IMPROVE applies.

scripts/inspect-mql5.sh and scanner scripts are triage aids only. Never treat grep/scanner output as a complete audit and never conclude that a project is clean because a scanner found nothing.

## Questions

Questions are exceptional, not ceremonial. Ask only when:
- two plausible interpretations lead to materially different behavior;
- a trading/risk decision cannot be inferred from authoritative project material;
- a required external artifact is unavailable;
- a debug symptom cannot be reproduced without user-only information;
- a REVIEW fixed point cannot be inferred safely;
- implementation changes a user-facing, financial, regulatory, security, or licensing decision that has not been approved.

## Default meaning of audit

If the user says only "audit this EA/project/product", interpret it as a full production-oriented audit. Automatically detect applicable domains and mark non-applicable domains N/A.

Default audit domains:
1. Code correctness and MQL5 semantics
2. Spec/documentation compliance
3. Trading correctness and robustness
4. Trade execution
5. Position/order/deal state and ownership
6. Financial risk and exposure
7. Indicator/data correctness when present
8. Strategy Tester/live fidelity
9. Time/session semantics when present
10. Economic calendar behavior when present
11. Architecture and maintainability
12. Performance/resource lifecycle
13. UI/operational controls when present
14. Licensing/backend/security when present
15. Documentation consistency
16. Regulatory/user-claim flags when materially relevant
17. MQL5 Market validation risk when release/publication is relevant

## Independent audit passes

A full audit must not be one giant checklist pass. Use applicable files in auditors/ as independent review briefs.

When sub-agents are available, run materially independent auditors in separate contexts, preferably in parallel. Prevent recursive delegation. When unavailable, emulate independence with separate passes and separate evidence collection.

Minimum for a full EA audit:
- code;
- trading logic;
- trade execution;
- state/ownership;
- financial risk;
- architecture;
- spec compliance.

Add indicator, tester, time-session, economic-calendar, performance, UI, licensing, regulatory and mql5-market passes when applicable.

## Engineering invariants

Use invariants/ as cross-cutting truths that implementations must preserve. Invariants are not a substitute for project requirements; they are safety/correctness properties to test against the discovered design.

Applicable invariants must be tied to evidence. Typical examples include:
- an accepted trade request is not equivalent to a completed deal;
- a product must not modify a position it cannot prove it owns;
- broker volume normalization must not silently violate the configured risk ceiling;
- restart/reconnect must not fabricate a clean internal state while broker exposure remains;
- external-service or licensing failures must not disable protective management of existing positions.

## Adversarial scenarios

Use scenarios/ to challenge discovered assumptions. Select only relevant scenarios and adapt them to the project. Scenario IDs provide stable references; they are not proof by themselves.

Prioritize failure modes involving duplicate signals, delayed/reordered transactions, restart/reconnect, partial/rejected fills, netting/hedging differences, manual/foreign positions, invalid broker constraints, gaps/spread stress, time/session transitions, unavailable history/data, and tester/live divergence.

## Evidence gate

Every reported finding must contain enough evidence for another engineer to verify it:
- stable finding ID when practical;
- domain;
- severity;
- confidence;
- nature;
- file and function/scope, with lines or a short excerpt when available;
- exact failed assumption/invariant/requirement;
- concrete trigger or failure scenario;
- operational/financial/user impact;
- recommended correction or decision;
- verification status;
- authoritative technical reference when MQL5 semantics materially matter.

Use engineering/evidence.md.

Confidence labels:
- CONFIRMED BY CODE
- CONFIRMED BY OFFICIAL DOCUMENTATION
- PROBABLE RISK
- HYPOTHESIS - TEST REQUIRED
- BROKER / ENVIRONMENT DEPENDENT

Severity:
- CRITICAL: plausible path to uncontrolled financial exposure, wrong-position action, protection failure, destructive state corruption, or behavior unsafe for production.
- HIGH: serious correctness or operational failure that can materially alter trading behavior, execution, state, or customer operation.
- MEDIUM: real defect or robustness gap with bounded impact.
- LOW: maintainability, clarity, local resilience, or minor UX problem.
- INFO: observation without a defect claim.

CRITICAL and HIGH findings require a verification pass. Re-read the full path and try to falsify the finding. If the evidence does not survive, downgrade or remove it.

## Coverage gate

A clean report is invalid unless critical paths were actually inspected. Before saying there are no CRITICAL/HIGH findings, report coverage of:
- runtime entry points;
- trade lifecycle;
- risk/exposure path;
- state/ownership path;
- spec sources;
- applicable tester/indicator/time/licensing/UI/release paths.

If a material path could not be inspected, report LIMITED COVERAGE rather than implying the project is clean.

## Source authority

For MQL5 language, API, runtime, event, trade, symbol, indicator, Economic Calendar, and Strategy Tester semantics, current official MQL5 documentation is the primary authority. Read references/source-policy.md when a conclusion depends on external semantics.

Repository docs are the primary authority for intended product behavior unless code and docs explicitly establish a newer source of truth. Never invent requirements from the implementation and then claim the implementation violates them.

## Broker/environment reasoning

Use references/broker-compatibility.md for execution mode, filling mode, account model, stops/freeze levels, symbol economics, volume rules, margin/currency and session behavior. Distinguish CODE DEFECT from BROKER DEPENDENT, SYMBOL DEPENDENT, ACCOUNT MODEL DEPENDENT and TEST REQUIRED.

## Architecture vocabulary

Use engineering/codebase-design.md when assessing or designing architecture. Prefer coherent modules, explicit interfaces, local state/risk/execution ownership, and testability through meaningful seams. Architecture findings must be tied to observed risk, duplication, change cost, verification difficulty, or operational fragility.

## Domain vocabulary

Use engineering/domain-modeling.md when terminology is ambiguous. Prefer the project's canonical terms and distinguish signal, setup, request, order, deal, position, exposure, protection, session, license, activation and entitlement when material.

## Testing

Use engineering/testing.md. Validate through the highest practical seam. Compilation proves syntax/build correctness only; it does not prove trading correctness, safety, release readiness or profitability. Report validation performed and validation not performed explicitly.

## Documentation

Documentation is part of done for code-changing tasks. Update existing source-of-truth docs by default and keep code, defaults, strategy rules, timing, risk, UI, licensing and API behavior consistent.

AUDIT and REVIEW are read-only with respect to source code. RELEASE is also read-only unless the user separately asks to fix blockers.

## Approval boundary

Read-only discovery, diagnosis, review, audit and release assessment do not require planning approval. Source-code modification does.

Before BUILD, IMPROVE, or a DEBUG fix:
1. discover;
2. resolve only blocking decisions;
3. present a concise implementation plan;
4. request approval;
5. execute only after approval.

If the user explicitly provided a complete approved plan and asked for execution, do not force redundant approval.

## Safety

- Never place live trades or use real money for validation.
- Never claim profitability from code review, compilation, backtests or optimization.
- Never modify a live broker account or production licensing system merely to test.
- Licensing/backend/news-filter failure may block new exposure but must not disable protective management of existing positions.
- Never put administrative secrets, service-role keys, database credentials, or master licensing secrets in distributed MQL5 clients.

## Completion

BUILD / IMPROVE / DEBUG:
- implementation performed;
- applicable validation performed;
- focused post-change review performed;
- docs updated;
- unperformed validation explicitly listed.

REVIEW:
- fixed point and reviewed diff explicit;
- standards/spec/bug-risk findings evidence-backed;
- unchanged code outside the diff is not blamed unless required to explain changed behavior.

AUDIT:
- scope derived from the actual project;
- applicable independent passes completed;
- coverage limitations stated;
- findings de-duplicated by root cause;
- CRITICAL/HIGH findings re-verified;
- readiness reported as READY, CONDITIONAL, BLOCKED, or LIMITED COVERAGE.

RELEASE:
- release fixed point explicit;
- required validation and compatibility checks enumerated;
- broker/environment assumptions explicit;
- MQL5 Market risks assessed when relevant;
- residual gaps listed;
- verdict reported as READY, CONDITIONAL, BLOCKED, or LIMITED COVERAGE.

Do not produce numeric /10 quality scores.
