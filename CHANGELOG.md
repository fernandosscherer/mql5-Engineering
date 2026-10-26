# Changelog

## 3.1.0 — 2026-10-26

- Added the **RELEASE** workflow for delivery, distribution, tagging, and MQL5 Market readiness assessments.
- Added engineering invariants for execution, financial risk, position ownership, state lifecycle, and indicator/data correctness.
- Added stable adversarial scenario packs for execution, risk, state, Strategy Tester behavior, MQL5 Market validation, and XAUUSD broker variation.
- Expanded financial-risk auditing to reconstruct symbol economics, broker volume normalization, aggregate exposure, margin, and worst plausible structure loss.
- Expanded trade-execution auditing around request/result semantics, retcodes, `OnTradeTransaction`, partial/rejected execution, retries, idempotency, broker constraints, and restart during lifecycle.
- Expanded state/ownership auditing around inferred state machines, broker reconciliation, netting/hedging, manual/foreign trades, persistence, delayed transactions, restart, and reconnect.
- Split trading-logic review into strategy correctness and strategy robustness.
- Added time/session auditing for broker time, local/GMT semantics, DST, daily resets, week/session boundaries, and sparse-tick behavior.
- Added Economic Calendar auditing with explicit separation between entry blocking and protective management of existing positions.
- Added MQL5 Market readiness auditing and release-risk classification.
- Added `references/broker-compatibility.md` and `references/time-semantics.md`.
- Added structured evidence-schema guidance and validation levels 0–6.
- Added helper scripts for risk formulas, volume normalization, trading-call triage, position-ownership triage, and indicator-handle triage.
- Added `templates/release-report.md`.
- Updated release CI to validate the new v3.1 structure and Python helper syntax.
- Synchronized `VERSION`, `SKILL.md`, activation banner, and installer to `3.1.0`.

## 3.0.1 — 2026-10-01

- Synchronized version string across all documentation and scripts (`install.sh`, `README.md`, `mql5-engineering/README.md`, `docs/MQL5-ENGINEERING-v3.0.md`, `CONTRIBUTING.md`).
- Made `install.sh` usage help dynamically display `INSTALLER_VERSION`.
- Added automatic backup pruning in `install.sh` to retain the 3 most recent backups.
- Updated `.github/workflows/release.yml` to validate `INSTALLER_VERSION` and `references/error-handling.md`.
- Removed residual v2 terminology ("questionnaire", "wizard") in `documentation-protocol.md` and `licensing-backend.md`.
- Added explicit reference citations across all auditor briefs in `mql5-engineering/auditors/`.
- Fixed `scripts/banner.sh`: replaced `set -u` with `set -euo pipefail`, matching `inspect-mql5.sh` and preventing silent errors.
- Added `.gitattributes` to enforce LF line endings across all text and shell files.
- Added `CONTRIBUTING.md` with file structure, naming conventions, release process, and shell script standards.
- Added `references/error-handling.md` covering terminal errors vs. trade-server retcodes, `GetLastError`/`ResetLastError` discipline, `OrderSend` retcode handling, retry logic, indicator handles, file I/O, `WebRequest`, and logging standards.
- Expanded `references/ui-design.md` with chart object management (naming, create/delete lifecycle), `OnChartEvent` safety, `CDialog`/`CPanel` usage, `ChartRedraw` discipline, and indicator buffer visualization.
- Updated `auditors/code.md` to reference `references/error-handling.md` explicitly.
- Updated `auditors/ui.md` to reference `references/ui-design.md` and list chart-object and `OnChartEvent` checks.

## 3.0 — 2026-09-16

- Rebuilt MQL5 Engineering around an intelligent engineering router.
- Added distinct BUILD, IMPROVE, DEBUG, REVIEW, and AUDIT workflows.
- Removed mandatory questionnaire-first behavior.
- Added discovery-first behavior and the rule: facts are the agent's job; decisions are the user's job.
- Added automatic audit applicability detection.
- Added independent specialized audit briefs for code, spec compliance, trading logic, execution, state, financial risk, indicators, tester fidelity, architecture, performance, UI, licensing, documentation, and regulatory concerns.
- Added adversarial failure-scenario review, Evidence Gate, Coverage Gate, and mandatory re-verification of CRITICAL/HIGH findings.
- Added LIMITED COVERAGE as a production-readiness state.
- Added REVIEW as a separate mode for bounded changes.
- Reworked DEBUG around feedback loops, reproduction, minimization, falsifiable hypotheses, root cause, regression checks, and post-fix review.
- Added engineering references for deep-module design, domain modeling, testing, debugging, and evidence quality.
- Removed numeric /10 quality scores.
- Added complete v3.0 architecture documentation.
- Refined public README, installer UX, and terminal activation identity for v3.0.
- Added installer `--version`, cleaner silent downloads, detected package-version display, and a final `SYSTEM READY` summary.
- Added a candlestick market panel beside the large MQL5 ASCII logo in the installer terminal.
- Finalized the installer hero as two aligned fixed-width panels with `GLOBAL FINANCIAL MARKET` and `TREND / STRUCTURE`.
- Added a dedicated aligned author block highlighting `FERNANDO SCHERER` and the GitHub repository.
- Restored the retro green + white terminal palette across installer and activation output.

## 2.8 — 2026-09-15

- Enforced a strict one-question-per-turn Interactive Planning Wizard.
- Added hard pre-wizard silence and sequential questions.

## 2.7 — 2026-09-15

- Added Interactive Planning Wizard and dynamic question skipping.

## 2.6 — 2026-09-15

- Added silent activation protocol with retro green banner.

## 2.5 — 2026-09-15

- Added GitHub installer, update/uninstall, backups, refs, and release workflow.

## 2.4

- Replaced website credit with the official GitHub repository URL.
