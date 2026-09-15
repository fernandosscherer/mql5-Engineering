---
name: mql5-engineering
description: Plan, build, improve, debug, and audit production-grade MQL5 Expert Advisors, indicators, libraries, panels, licensing integrations, and related trading-system code. Uses an approval-gated workflow, official MQL5 documentation as the primary technical authority, mandatory post-change documentation updates, risk/execution review, and market-agnostic checks for B3, Forex, metals such as XAUUSD, CFDs, and other MT5 instruments.
license: MIT
compatibility: "OpenCode and compatible Agent Skills runtimes"
metadata:
  audience: mql5-developers
  workflow: engineering
  version: "2.6"
  author: "Fernando Scherer"
  repository: "https://github.com/fernandosscherer/mql5-Engineering.git"
---

# MQL5 Engineering

## Activation experience

When this skill is explicitly activated for a new interactive task, use a **silent activation protocol**. The activation phase must be visually clean and must not expose internal reference loading, file contents, file paths, discovery narration, or tool-by-tool commentary in assistant text.

Preferred behavior in an interactive terminal:

1. Run `scripts/banner.sh` once.
2. Show only the branded MQL5 ASCII activation banner and credits.
3. Show the ANSI loading animation with the user-facing message `Carregando...`.
4. When the activation presentation finishes, show exactly `Pronto para uso!`.
5. Then present the mandatory start questionnaire.

Do **not** print boot-component lists such as project discovery, MQL5 reference, safeguards, documentation protocol, quality gates, filenames, or the contents of files opened by the skill during activation.

If shell execution is unavailable, the environment is non-interactive, or running the script would be inappropriate, render this static fallback instead:

```text
╔══════════════════════════════════════════════════════════════════════╗
║                                                                      ║
║   ███╗   ███╗ ██████╗ ██╗     ███████╗                             ║
║   ████╗ ████║██╔═══██╗██║     ██╔════╝                             ║
║   ██╔████╔██║██║   ██║██║     ███████╗                             ║
║   ██║╚██╔╝██║██║▄▄ ██║██║     ╚════██║                             ║
║   ██║ ╚═╝ ██║╚██████╔╝███████╗███████║                             ║
║   ╚═╝     ╚═╝ ╚══▀▀═╝ ╚══════╝╚══════╝                             ║
║                                                                      ║
║                 E N G I N E E R I N G                               ║
║                                                                      ║
║          [ BUILD ] [ IMPROVE ] [ DEBUG ] [ AUDIT ]                  ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝

                     MQL5 Engineering v2.6
          Plan → Approve → Execute → Validate → Auditar

Author : Fernando Scherer
GitHub : https://github.com/fernandosscherer/mql5-Engineering.git

Carregando...
Pronto para uso!
```

Rules:

- Do not repeat the banner during the same task.
- The animation is presentation-only and must not change project files or state.
- If `NO_COLOR` is set, honor it.
- If `MQL5_ENGINEERING_NO_ANIMATION=1` is set, use static output.
- `Carregando...` means the engineering workflow is being initialized; do not claim that every technical source has already been read or verified.
- Never echo the contents of `SKILL.md`, `references/`, `workflows/`, or other internal files merely because they were loaded.
- Do not narrate routine internal reads with phrases such as `opening...`, `reading...`, `loading reference...`, or lists of files.
- During normal work, surface file names and evidence only when they are materially relevant to the plan, a finding, a change, or the final report.
- Use a monochrome retro terminal palette when ANSI color is available: green only on the terminal background. Use bright, normal, and dim green for hierarchy; do not use cyan, magenta, yellow, or red.
- Host applications may still render their own tool-call/activity UI. This skill controls its own assistant-facing output, not the host application's internal tool visualization.

Use this skill as a controlled engineering workflow for MQL5 products. It supports four operating modes:

- **BUILD** — create a new Expert Advisor, indicator, library, panel, or related component.
- **IMPROVE** — add features or improve an existing project while preserving unrelated behavior.
- **DEBUG** — investigate a defect, establish root cause, implement the smallest safe correction, and check regressions.
- **AUDIT** — perform a read-only production audit and report findings without changing source code unless a later remediation plan is explicitly approved.

## Mandatory start questionnaire

At the beginning of every new task in which this skill is activated, do not edit files immediately. First present one grouped questionnaire. Pre-fill answers that are already explicit in the user's message, but still show the group so the user can confirm or complete it.

Use this structure:

```text
MQL5 ENGINEERING — INÍCIO

Antes de executar qualquer tarefa, responda ou confirme:

1. O que deseja fazer?
   [1] Criar novo Expert Advisor
   [2] Criar novo indicador
   [3] Melhorar projeto existente
   [4] Corrigir bug
   [5] Auditar produto
   [6] Outro

2. Qual é o escopo?
   [1] Projeto inteiro
   [2] EA principal
   [3] Indicador
   [4] Execução / ordens
   [5] Gestão financeira / risco
   [6] Painel / UI
   [7] Licenciamento / backend
   [8] Outro

3. Este produto utiliza ou utilizará licenciamento?
   [1] Sim
   [2] Não
   [3] Já existe
   [4] Ainda não definido

4. Se houver licenciamento, qual é a situação?
   [1] Criar backend e API
   [2] Integrar backend existente
   [3] Recomendar arquitetura
   [4] Não se aplica

5. Deseja criar uma documentação específica para esta tarefa/projeto?
   [1] Sim
   [2] Não — apenas atualizar a documentação existente
   [3] Decidir durante o planejamento

6. Há documentação que deve ser tratada como fonte de verdade?
   Ex.: docs/master.md, docs/spec*.md, README.md
   Responda "detectar automaticamente" se preferir.

7. Há algo que NÃO deve ser alterado?

8. Qual é o critério de sucesso desta tarefa?

9. Explique com suas palavras o que você deseja fazer:
   >
```

Do not ask the user to repeat information already clearly supplied. The open-ended item 9 is always present.

## Mandatory lifecycle

After the questionnaire is answered, follow this state machine:

```text
DISCOVERY
  -> REQUIREMENTS
  -> DOCUMENTATION DECISION
  -> PLAN
  -> AWAITING_APPROVAL
  -> EXECUTION
  -> VALIDATION
  -> DOCUMENTATION UPDATE
  -> CONSISTENCY CHECK
  -> COMPLETE
```

### DISCOVERY

Inspect the repository before proposing implementation details.

- Inventory relevant `.mq5`, `.mqh`, `.set`, config, tests, logs, presets, and documentation.
- Identify the main EA/indicator and its dependencies.
- Search for `docs/master.md`, `docs/prompt master.md`, `docs/design-system.md`, `docs/spec*.md`, `README*`, `CHANGELOG*`, architecture docs, licensing docs, and tester reports.
- Use `scripts/inspect-mql5.sh` when useful. It is read-only.
- Do not ask questions whose answers can be reliably determined from the repository.

### REQUIREMENTS

Determine the operating mode and resolve only material ambiguities.

Read `workflows/<mode>.md` for the active mode. Load only the technical references needed for the task.

### PLAN

Before any source modification, present an execution plan containing:

- mode;
- objective;
- files/components in scope;
- explicit exclusions;
- current behavior when relevant;
- intended behavior;
- implementation steps;
- validation steps;
- documentation files to create/update;
- material risks;
- success criteria;
- open decisions requiring the user's choice.

End with an explicit approval request such as `Posso executar este plano?`

### AWAITING_APPROVAL

Do not modify project source files while waiting for approval.

A user response such as `sim`, `execute`, `pode executar`, or an equivalent explicit approval authorizes the approved plan.

### EXECUTION

After approval, execute the full approved plan autonomously. Do not interrupt for routine implementation details.

Stop and request new approval only if a newly discovered fact materially changes one or more of:

- scope;
- trading strategy behavior;
- financial risk;
- architecture;
- licensing/security model;
- regulatory exposure;
- user-facing behavior;
- destructive or live-account actions.

### VALIDATION

Every code-changing task must end with the applicable quality gates:

1. **Compilation gate** — compile when a compiler is available. Never claim compilation occurred if it did not. If not run, report `COMPILATION NOT EXECUTED`.
2. **Static correctness gate** — MQL5 API use, arrays, handles, state, errors, ownership, event logic.
3. **Trading execution gate** — request validation, retcodes, transactions, fill/execution modes, position state.
4. **Financial/risk gate** — lot sizing, stops, margin, cumulative exposure, daily limits, costs.
5. **Regression gate** — mandatory for IMPROVE and DEBUG.
6. **Tester fidelity gate** — when strategy behavior depends on tester assumptions.
7. **Documentation consistency gate** — mandatory whenever project behavior or architecture changes.

### DOCUMENTATION UPDATE

Read `references/documentation-protocol.md`.

Any approved change to project behavior, architecture, parameters, risk, execution, buffers, UI, licensing, API, or operational assumptions must update the relevant documentation by default. This documentation update is part of the approved task and does not require a second approval.

### COMPLETE

Report:

- what changed;
- files changed;
- validation actually performed;
- validation not performed;
- documentation created/updated;
- remaining risks/open decisions;
- recommended next tests.

## Source authority

Read `references/source-policy.md` whenever a conclusion depends on MQL5 semantics or an external technical claim.

Core rule:

> Current official MQL5 documentation is the primary authority for language, API, event, trading, symbol, indicator, and Strategy Tester behavior.

If a current official source cannot confirm a high-impact behavior, do not invent it. Use one of:

- `CONFIRMED BY CODE`
- `CONFIRMED BY OFFICIAL DOCUMENTATION`
- `PROBABLE RISK`
- `HYPOTHESIS — TEST REQUIRED`
- `BROKER / ENVIRONMENT DEPENDENT`

## Reference loading

Load only what is relevant:

- Core MQL5 correctness: `references/mql5-engineering.md`
- Expert Advisors: `references/expert-advisor.md`
- Indicators: `references/indicator.md`
- Trade requests/execution: `references/trade-execution.md`
- Trade state/transactions: `references/trade-state.md`
- Financial risk: `references/trading-risk.md`
- Symbol/market portability: `references/market-instrument.md`
- Grid/scaling/pyramiding: `references/position-scaling.md`
- Strategy Tester: `references/tester-validation.md`
- Optimization robustness: `references/optimization.md`
- Multi-symbol/timeframe: `references/multi-symbol.md`
- Debugging method: `references/debugging.md`
- Performance: `references/performance.md`
- UI/design: `references/ui-design.md`
- Licensing/security: `references/licensing-security.md`
- Backend options: `references/licensing-backend.md`
- API design: `references/api-contract.md`
- Regulatory review: `references/regulatory-compliance.md`
- Documentation: `references/documentation-protocol.md`
- Audit output: `references/report-template.md`

## Safety contract

- Never send live trades or use real money to test code.
- Never alter a broker account, live position, or production license system merely to validate behavior.
- Never claim that source review proves profitability.
- Never claim a backtest, compile, broker behavior, or market result that was not actually observed.
- Treat uncontrolled exposure, incorrect lot sizing, wrong-position actions, missing protection, duplicate entries, and cross-EA interference as potential production blockers.
- A licensing failure may block **new exposure**, but must not disable protective management of already-open positions.
- Do not place administrative secrets, database credentials, service-role keys, or master licensing secrets in distributed `.mq5`/`.ex5` clients.

## Project naming neutrality

This skill is generic. Do not hardcode company names, commercial robot names, design theme names, B3 symbols, Forex symbols, or product-specific rules into the skill. Discover them from the repository and user requirements.

B3 can be a primary target market while the architecture remains portable to Forex, metals such as XAUUSD, CFDs, indices, and other instruments supported by MetaTrader 5.
