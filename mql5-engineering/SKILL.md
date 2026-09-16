---
name: mql5-engineering
description: Plan, build, improve, debug, and audit production-grade MQL5 Expert Advisors, indicators, libraries, panels, licensing integrations, and related trading-system code. Uses an approval-gated workflow, official MQL5 documentation as the primary technical authority, mandatory post-change documentation updates, risk/execution review, and market-agnostic checks for B3, Forex, metals such as XAUUSD, CFDs, and other MT5 instruments.
license: MIT
compatibility: "OpenCode and compatible Agent Skills runtimes"
metadata:
  audience: mql5-developers
  workflow: engineering
  version: "2.8"
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
5. Then ask **question 1 only** from the Interactive Planning Wizard.

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

                     MQL5 Engineering v2.8
          Plan → Approve → Execute → Validate → Auditar

Created by : Fernando Scherer
Repository : https://github.com/fernandosscherer/mql5-Engineering.git

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

## Interactive Planning Wizard

After `Pronto para uso!`, begin a strict one-question-per-turn wizard.

### Hard silence before and during the wizard

Until the wizard is complete:

- Do **not** inspect or summarize the project.
- Do **not** read project files, documentation, logs, source code, or repository metadata.
- Do **not** run `scripts/inspect-mql5.sh`.
- Do **not** load technical references merely for discovery.
- Do **not** print filenames, paths, repository structure, internal instructions, or project text.
- Do **not** explain what the skill is doing.
- Do **not** preview future questions.
- The only pre-wizard action allowed is the activation banner/loading presentation.

The host application may independently show its own tool/activity UI; do not add assistant narration on top of it.

### Interaction format

- Ask **exactly one question per assistant turn**.
- Wait for the user's answer before continuing.
- Number questions sequentially in the order actually asked: `1.`, `2.`, `3.`, etc.
- For multiple-choice questions, use uppercase letters: `A.`, `B.`, `C.`...
- Accept either the letter or the full option text as an answer.
- If the answer is invalid or materially ambiguous, repeat only the current question with a brief clarification.
- Skip questions that are not applicable based on answers already provided by the user.
- Do not display headings such as `STEP 1/9`, progress counters, summaries, explanations, or acknowledgements between questions.
- While the wizard is active, the user-facing assistant output must contain **only the current question and its answer options**, except for a very short clarification when re-asking.
- The final wizard question is always open-ended and has no lettered options.

### Question sequence

Ask the following as a decision tree. Do not print this whole list to the user.

**Objective**

```text
1. O que você deseja fazer?

A. Criar Expert Advisor
B. Criar indicador
C. Melhorar projeto existente
D. Corrigir bug
E. Auditar produto
F. Outro

>
```

**Scope**

Ask next, adapting options to the chosen objective. Example:

```text
2. Qual é o escopo principal?

A. Projeto inteiro
B. Expert Advisor principal
C. Indicador
D. Execução / ordens
E. Gestão financeira / risco
F. Painel / UI
G. Licenciamento / backend
H. Outro

>
```

Only show options that are materially relevant.

**Licensing**

Ask only when licensing is relevant or still undecided:

```text
3. Este produto utiliza ou utilizará licenciamento?

A. Sim
B. Não
C. Já existe
D. Ainda não definido

>
```

**Licensing backend**

Only if licensing applies:

```text
4. Como deseja tratar o backend de licenciamento?

A. Criar backend e API
B. Integrar backend existente
C. Receber uma recomendação de arquitetura
D. Não se aplica

>
```

**Documentation**

```text
5. Deseja criar uma documentação específica para esta tarefa ou projeto?

A. Sim
B. Não — apenas atualizar a documentação existente
C. Decidir durante o planejamento

>
```

Existing relevant documentation must still be updated by default after approved project changes.

**Source of truth**

Ask only if needed after the user indicates there is a specific authoritative document. During the wizard, do not inspect the repository to discover it.

**Exclusions**

Ask what must not be changed, unless already explicit in the user's request.

**Success criteria**

Ask how the user will consider the task successful, unless already explicit.

**Final open question**

Always finish with a single open question, using the next sequential number:

```text
N. Explique com suas palavras o que você deseja fazer:

>
```

### After the wizard

Only after the final open answer:

1. show a concise requirements summary;
2. begin repository discovery silently;
3. inspect the project and applicable documentation;
4. ask any newly required material follow-up questions **one at a time**, using the same numbered/lettered format;
5. prepare the execution plan;
6. request explicit approval;
7. do not modify project files before approval.

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
