# Governance

## Project model

MQL5 Engineering is an open-source project maintained by **Fernando Scherer** and developed through public GitHub collaboration.

The project is intentionally lightweight: governance should protect technical quality and compatibility without creating unnecessary process.

## Roles

### Maintainer

The maintainer is responsible for:

- project direction and release decisions;
- review and merge authority;
- versioning and compatibility policy;
- security response;
- resolving conflicts between competing design proposals;
- protecting the core engineering principles of the project.

### Contributors

Anyone may contribute through issues, pull requests, reviews, documentation, benchmark cases, auditors, invariants, scenarios, references, or tooling.

Contributors do not need prior approval to propose changes.

## Decision principles

Technical decisions should prefer, in order:

1. safety and correctness;
2. evidence and reproducibility;
3. compatibility with documented project behavior;
4. simplicity and maintainability;
5. portability across Agent Skills runtimes;
6. contributor ergonomics.

Popularity, model preference, or vendor-specific behavior should not override stronger engineering evidence.

## Core and extensions

The project distinguishes between a stable core and extensible engineering knowledge.

### Core

- router and operating modes;
- evidence model;
- validation model;
- approval and safety boundaries;
- release-readiness semantics.

Changes to the core require stronger compatibility review.

### Extensions

- auditors;
- invariants;
- adversarial scenarios;
- references;
- templates;
- benchmarks;
- examples and helper tooling.

Extensions should remain independently understandable and avoid unnecessary coupling to a single AI vendor or harness.

## Stable identifiers

Published scenario IDs and other identifiers referenced by reports or external automation should remain stable. Renaming or reusing an existing ID requires a clear compatibility reason and migration note.

## Breaking changes

A change is considered breaking when it materially changes public workflow behavior, report semantics, stable IDs, installation paths, compatibility guarantees, or documented interfaces.

Breaking changes should:

- be called out explicitly in `CHANGELOG.md`;
- include migration guidance when practical;
- use an appropriate version change;
- avoid silent behavioral reinterpretation.

## Pull requests

Maintainers may request changes when a contribution:

- duplicates an existing source of truth;
- weakens evidence requirements;
- introduces vendor lock-in without a compelling reason;
- makes unsupported profitability or safety claims;
- breaks stable scenario identifiers;
- expands the core with complexity that belongs in an extension;
- lacks enough validation for its risk level.

## Releases

A release should have synchronized version metadata, updated changelog, passing repository checks, coherent documentation, and no known release blocker in the maintained scope.

A GitHub release is a project distribution milestone; it is not a claim that any trading system built with the skill is profitable or safe for live-money use.
