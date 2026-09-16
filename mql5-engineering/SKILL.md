---
name: mql5-engineering
description: Engineering router for production-grade MQL5 work. Routes explicit requests to BUILD, IMPROVE, DEBUG, REVIEW, or AUDIT, discovers repository facts before asking questions, and coordinates specialized MQL5 review passes for code correctness, strategy logic, execution, state, financial risk, indicators, tester fidelity, architecture, performance, UI, licensing, documentation, and spec compliance.
license: MIT
compatibility: "OpenCode and compatible Agent Skills runtimes"
metadata:
  audience: mql5-developers
  workflow: engineering-router
  version: "3.0"
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
F. Other

## Core operating principle

Facts are the agent's job. Decisions are the user's job.

Therefore:

- inspect the repository before asking the user for facts that can be discovered;
- read applicable source-of-truth documentation before asking how the system works;
- infer product topology, dependencies, market assumptions, UI presence, licensing presence, tester assets, and architecture from the project;
- ask the user only for a material decision, missing external fact, inaccessible artifact, or unresolved ambiguity that blocks safe progress;
- ask one blocking question at a time;
- never dump a prewritten questionnaire merely because a mode was selected.

## Router

Choose the narrowest workflow that matches the request.

- BUILD: create a new EA, indicator, library, panel, licensing client, or related component.
- IMPROVE: add a feature, change behavior, refactor, or improve an existing project.
- DEBUG: diagnose a concrete defect, regression, intermittent failure, unexpected behavior, or performance problem.
- REVIEW: inspect a change set, branch, commit range, PR, or diff and determine whether the change is correct.
- AUDIT: inspect a product or substantial subsystem as it exists now for defects, operational hazards, architecture problems, risk failures, spec mismatches, and production-readiness concerns.

Read workflows/<mode>.md after routing.

Do not collapse REVIEW and AUDIT:
- REVIEW asks whether a change is correct.
- AUDIT asks what is wrong, fragile, missing, contradictory, or unsafe in the current system.

## Discovery before questions

For every mode except a purely greenfield BUILD with no repository, perform silent discovery first.

Discovery should establish as much as possible from code and docs:

1. product type: EA, indicator, library, panel, backend integration, or mixed project;
2. primary entry points and critical runtime paths;
3. relevant mq5, mqh, presets, tester files, logs, docs, and configs;
4. documented strategy and operational requirements;
5. account model assumptions, symbol/market assumptions, time/session rules, and risk controls;
6. whether UI, licensing, backend, multi-symbol, optimization, or persistence are actually present;
7. available compile/test/tester feedback loops;
8. recent change context when REVIEW or IMPROVE applies.

scripts/inspect-mql5.sh is a triage aid only. Never treat grep output as a complete audit, and never conclude that a project is clean because the scanner found nothing.

## Questions

Questions are exceptional, not ceremonial.

Ask only when:
- two plausible interpretations lead to materially different behavior;
- a trading/risk decision cannot be inferred from authoritative project material;
- a required external artifact is unavailable;
- a debug symptom cannot be reproduced without user-only information;
- a REVIEW fixed point cannot be inferred safely;
- implementation would change a user-facing, financial, regulatory, security, or licensing decision that has not been approved.

Do not ask:
- whether to audit code, logic, design, architecture, risk, and so on when the user asked for a full product audit;
- whether the project has licensing when the code can answer;
- which docs are authoritative before searching the repository;
- what account mode or symbol assumptions exist before reading the code;
- for success criteria that are already implicit in a concrete task.

## Default meaning of "audit"

If the user says only "audit this EA/project/product", interpret it as a full production-oriented audit.

Automatically detect applicable audit domains and mark non-applicable domains N/A. Do not ask the user to choose every domain.

Default audit domains:

1. Code correctness and MQL5 semantics
2. Spec/documentation compliance
3. Trading and operational logic
4. Trade execution
5. Position/order/deal state and ownership
6. Financial risk and exposure
7. Indicator/data correctness when present
8. Strategy Tester/live fidelity
9. Architecture and maintainability
10. Performance/resource lifecycle
11. UI/operational controls when present
12. Licensing/backend/security when present
13. Documentation consistency
14. Regulatory/user-claim flags when materially relevant

If the user names a narrower target, audit that target plus any adjacent domain required to reason about it safely.

Example: "audit lot sizing" includes financial risk, symbol economics, margin, cumulative exposure, and execution constraints, but does not automatically expand into UI styling.

## Independent audit passes

A full audit must not be one giant checklist pass.

Use the applicable files in auditors/ as independent review briefs.

When the harness supports sub-agents, run materially independent auditors in separate contexts, preferably in parallel. Prevent auditors from delegating recursively.

When sub-agents are unavailable, emulate independence with separate passes: finish one domain's evidence collection before beginning the next, and do not let one domain's conclusion become evidence for another.

For each full EA audit, the minimum independent passes are:

- code;
- trading logic;
- trade execution;
- state/ownership;
- financial risk;
- architecture;
- spec compliance.

Add indicator, tester, performance, UI, licensing, and regulatory passes when applicable.

## Adversarial review

Auditors do not merely ask whether code looks reasonable. They try to break assumptions.

Build scenarios such as:

- duplicate ticks or repeated same-bar signals;
- partial fills and rejected requests;
- delayed or reordered trade transactions;
- reconnect or terminal restart;
- stale selected position/order data;
- netting versus hedging;
- manual trades or another EA on the same symbol;
- insufficient margin;
- invalid volume/stops/filling mode;
- spread or gap stress;
- session transition and daily reset;
- history arriving late;
- invalid indicator handles;
- multi-symbol bars that are not synchronized;
- Strategy Tester behavior differing from live behavior.

Only apply scenarios relevant to the discovered product.

## Evidence gate

Every reported finding must contain enough evidence for another engineer to verify it:

- severity;
- confidence;
- nature;
- file and function/scope, with lines or a short excerpt when available;
- the exact assumption or invariant that fails;
- a concrete failure scenario;
- operational/financial/user impact;
- recommended correction or decision;
- authoritative technical reference when MQL5 semantics materially matter.

Confidence labels:

- CONFIRMED BY CODE
- CONFIRMED BY OFFICIAL DOCUMENTATION
- PROBABLE RISK
- HYPOTHESIS - TEST REQUIRED
- BROKER / ENVIRONMENT DEPENDENT

Severity:

- CRITICAL: plausible path to uncontrolled financial exposure, wrong-position action, protection failure, destructive state corruption, or product behavior unsafe for production.
- HIGH: serious correctness or operational failure that can materially alter trading behavior, execution, state, or customer operation.
- MEDIUM: real defect or robustness gap with bounded impact.
- LOW: maintainability, clarity, local resilience, or minor UX problem.
- INFO: observation without a defect claim.

CRITICAL and HIGH findings require a verification pass before the final report. Re-read the relevant code path and try to falsify the finding. If the evidence does not survive, downgrade or remove it.

Do not inflate findings. Do not suppress findings merely because the project compiles.

## Coverage gate

A clean report is not valid unless critical paths were actually inspected.

Before saying there are no CRITICAL/HIGH findings, report audit coverage:

- runtime entry points traced;
- trade lifecycle traced;
- risk/exposure path traced;
- state/ownership path traced;
- spec sources checked;
- applicable tester/indicator/licensing/UI paths checked.

If a material path could not be inspected, report LIMITED COVERAGE rather than implying the project is clean.

## Source authority

For MQL5 language, API, runtime, event, trade, symbol, indicator, and Strategy Tester semantics, current official MQL5 documentation is the primary authority.

Read references/source-policy.md when a conclusion depends on external semantics.

Repository docs are the primary authority for intended product behavior unless code and docs explicitly establish a newer source of truth.

Never invent requirements from the implementation and then claim the implementation violates them.

## Architecture vocabulary

Use engineering/codebase-design.md when assessing or designing architecture.

Prefer:
- coherent modules;
- small, explicit interfaces;
- complexity hidden behind stable seams;
- locality of state, risk, execution, and persistence behavior;
- testability through meaningful interfaces.

Look especially for:
- God OnTick / God OnCalculate handlers;
- trade logic duplicated across event handlers;
- state scattered across unrelated globals;
- wrappers that add no useful abstraction;
- architecture that makes critical behavior impossible to test in isolation;
- execution and risk decisions spread across many call sites.

Architecture findings are not automatically defects. Tie them to observed friction, risk, duplication, change cost, or inability to verify behavior.

## Domain vocabulary

Use engineering/domain-modeling.md when project terminology is ambiguous or inconsistent.

Prefer the project's existing canonical terms. Distinguish signal, setup, order, deal, position, exposure, protection, session, license, activation, entitlement, and other concepts when the distinction matters.

## Testing

Use engineering/testing.md for validation design.

Tests and tester scenarios should validate behavior through meaningful seams, not merely mirror implementation details.

Compilation proves syntax/build correctness only. It does not prove trading correctness, safety, or profitability.

## Documentation

Documentation is part of done for code-changing tasks.

After approved changes:
- update existing relevant docs by default;
- prefer existing source-of-truth documents over creating duplicates;
- update changelog when the project already uses one and the change is material;
- keep code, documented defaults, strategy rules, timing, risk, UI, licensing, and API behavior consistent.

AUDIT and REVIEW are read-only with respect to source code. They may produce a report when the user's request implies a deliverable.

## Approval boundary

Read-only discovery, diagnosis, review, and audit do not require a planning approval.

Source-code modification does.

Before BUILD, IMPROVE, or a DEBUG fix:
1. discover;
2. resolve only blocking decisions;
3. present a concise implementation plan;
4. request approval;
5. execute only after approval.

If the user explicitly provided a complete approved plan and asked for execution, do not force a redundant questionnaire.

## Safety

- Never place live trades or use real money for validation.
- Never claim profitability from code review, compilation, backtests, or optimization.
- Never modify a live broker account or production licensing system merely to test.
- Licensing failure may block new exposure but must not disable protective management of existing positions.
- Never put administrative secrets, service-role keys, database credentials, or master licensing secrets in distributed MQL5 clients.

## Completion

BUILD / IMPROVE / DEBUG:
- implementation performed;
- applicable validation performed;
- focused post-change review performed;
- docs updated;
- unperformed validation explicitly listed.

REVIEW:
- fixed point and reviewed diff are explicit;
- standards/spec/bug-risk findings are evidence-backed;
- unchanged code outside the diff is not blamed unless required to explain a changed behavior.

AUDIT:
- scope was derived from the actual project;
- applicable auditor passes completed;
- coverage limitations stated;
- findings de-duplicated by root cause;
- CRITICAL/HIGH findings re-verified;
- production readiness reported as READY, CONDITIONAL, BLOCKED, or LIMITED COVERAGE.

Do not produce numeric /10 quality scores.
