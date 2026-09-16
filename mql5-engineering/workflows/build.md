# BUILD workflow

Use BUILD for a new EA, indicator, library, panel, licensing client, or related component.

## 1. Discover before interviewing

If the repository exists, inspect its conventions, reusable modules, docs, architecture, testing style, and market assumptions first.

Do not ask for facts that can be learned from the repository.

For greenfield work, infer nothing that changes strategy or risk.

## 2. Define the behavioral contract

Identify the minimum unresolved product decisions.

For an EA, decisions may include:
- signal and entry semantics;
- exit/protection semantics;
- lot/risk model;
- exposure/scaling rules;
- session and forced-close behavior;
- account-mode requirements;
- restart/reconnect behavior;
- user-facing controls;
- licensing requirements.

For an indicator:
- visual versus machine-consumed purpose;
- buffer contract;
- current-bar versus closed-bar semantics;
- repaint/recalculation policy;
- symbol/timeframe dependencies.

Ask only decisions that remain unknown after discovery, one at a time.

## 3. Design

Use engineering/codebase-design.md.

Define:
- modules and responsibilities;
- public seams/interfaces;
- state ownership;
- data flow;
- execution/risk invariants;
- failure behavior;
- validation seams;
- documentation updates.

Prefer a small number of meaningful seams over many shallow wrappers.

## 4. Plan and approval

Present a concise implementation plan:
- intended behavior;
- files/modules;
- invariants;
- validation;
- docs;
- risks.

Request approval before source modification.

## 5. Implement in vertical slices

Build one coherent behavior path at a time.

Validate each slice through the highest practical seam rather than writing a large unverified implementation first.

## 6. Validate and self-review

Apply:
- compile gate when compiler is available;
- code correctness;
- execution/state/risk checks when relevant;
- tester fidelity when relevant;
- focused post-change REVIEW;
- documentation consistency.

BUILD is not complete at "code generated".
