# MQL5 Engineering v3.0

**Production-grade engineering system for MetaTrader 5 / MQL5**

**Autor:** Fernando Scherer  
**Repositório:** https://github.com/fernandosscherer/mql5-Engineering  
**Versão:** 3.0

---

## 1. Visão geral

MQL5 Engineering é um sistema de engenharia assistida por IA para criar, evoluir, depurar, revisar e auditar projetos MQL5.

A v3.0 substitui checklist/questionário genérico por **router + workflows + auditors especializados**.

> **Fatos são responsabilidade do agente. Decisões são responsabilidade do usuário.**

Se a resposta existe no código, documentação, configuração, logs, presets, tester ou histórico, a Skill deve descobrir antes de perguntar.

Modos: **BUILD, IMPROVE, DEBUG, REVIEW, AUDIT**.

---

## 2. Princípios

### Inspect first, ask second

Descobrir primeiro: código, docs, presets, logs, tester, Git e configuração.

### Questions are exceptional

Perguntar somente decisões materiais que não possam ser inferidas com segurança.

### Evidence before conclusion

Sem evidência, finding é hipótese. CRITICAL/HIGH exigem verificação.

### Adversarial review

A Skill não tenta provar que o código parece correto. Tenta descobrir como ele pode falhar.

---

## 3. Arquitetura

```text
mql5-engineering/
├── SKILL.md
├── workflows/
│   ├── build.md
│   ├── improve.md
│   ├── debug.md
│   ├── review.md
│   └── audit.md
├── auditors/
│   ├── code.md
│   ├── spec-compliance.md
│   ├── trading-logic.md
│   ├── trade-execution.md
│   ├── state.md
│   ├── risk.md
│   ├── indicator.md
│   ├── tester.md
│   ├── architecture.md
│   ├── performance.md
│   ├── ui.md
│   ├── licensing.md
│   ├── documentation.md
│   └── regulatory.md
├── engineering/
│   ├── codebase-design.md
│   ├── domain-modeling.md
│   ├── testing.md
│   ├── debugging.md
│   └── evidence.md
├── references/
├── templates/
└── scripts/
```

SKILL.md é o router. Workflows definem processo. Auditors definem missões independentes. References concentram conhecimento MQL5. Engineering fornece princípios gerais.

---

## 4. Ativação

```text
ASCII Banner
→ Carregando...
→ Pronto para uso!
```

Não mostrar file loading, referências internas, discovery narration ou raciocínio.

Se o pedido já é claro, rotear direto. Sem questionário obrigatório.

---

## 5. Router

```text
"crie um EA"             → BUILD
"adicione trailing"      → IMPROVE
"duplica ordens"         → DEBUG
"revise esta branch"     → REVIEW
"audite este EA"         → AUDIT
"audite somente risco"   → AUDIT focado
```

REVIEW pergunta se uma **mudança** está correta. AUDIT pergunta o que está errado ou inseguro no **sistema atual**.

---

## 6. BUILD

```text
Intent → Discovery → Missing decisions → Architecture → Plan → Approve → Build → Validate → Review → Document
```

Perguntar somente requisitos ausentes depois do discovery.

Design deve definir módulos, interfaces, estado, fluxo, invariantes, seams de teste, riscos e documentação.

---

## 7. IMPROVE

PATCH, FEATURE ou REFACTOR.

Preservar comportamento não relacionado.

```text
Request → Current behavior → Change surface → Plan → Approve → Implement → Regression → Review → Document
```

---

## 8. DEBUG

DEBUG começa por reprodução.

```text
Symptom → Feedback loop → Reproduce → Minimize → Hypotheses → Instrument → Root cause → Plan → Approve → Fix → Regression → Review
```

Feedback loop pode ser tester, logs, replay, harness ou differential run.

Root cause:
- CONFIRMED ROOT CAUSE
- PROBABLE ROOT CAUSE
- HYPOTHESIS - TEST REQUIRED

---

## 9. REVIEW

Delimitado por base/head/diff.

Eixos:
- **Spec**
- **Engineering**
- **Bug/Risk**

Não transformar problemas preexistentes fora do diff em findings de REVIEW sem relação causal.

---

## 10. AUDIT

Read-only por padrão.

```text
Intent → Silent discovery → Applicability → Behavior map → Independent auditors → Adversarial scenarios → Verification → Aggregate → Readiness → Report
```

Domínios:
1. Code
2. Spec
3. Trading logic
4. Execution
5. State/ownership
6. Financial risk
7. Indicators
8. Tester/live
9. Architecture
10. Performance
11. UI
12. Licensing/security
13. Documentation
14. Regulatory flags

Domínio ausente = N/A, não pergunta.

---

## 11. Behavior map

EA:

```text
Signal/data → Filters → Risk permission → Sizing → Request → OrderCheck → Send → Retcode → Order → Deal(s) → Position → Protection → Management → Exit → Accounting/reset → Recovery
```

Indicator:

```text
Source data → handles → calculation → buffers/plots → bar semantics → EA signal
```

---

## 12. Auditors

### Code
MQL5 semantics, handlers, arrays, indexing, handles, resources, errors, lifecycle.

### Spec
Implementação versus requisitos. Nunca inventar spec.

### Trading Logic
Sinal, filtros, entry, management, exit, reset, sessions, current/closed bar.

### Execution
OrderCheck, request, send, retcode, filling, stops, volumes, partial fills.

`OrderSend() == true` não prova execução final.

### State
OnTradeTransaction, request_id, tickets, identifiers, Magic, stale selection, netting/hedging, restart/reconnect, idempotência.

### Risk
Lot sizing, stop, tick/contract economics, exposure, grid/scaling, margin, daily limits, costs, gaps.

### Indicator
OnCalculate, prev_calculated, buffers/plots, indexing, repaint, CopyBuffer, BarsCalculated, synchronization.

### Tester
Open Prices, 1 Minute OHLC, Every Tick, Real Ticks, spread, delay, gaps, sessions, margin e persistence.

### Architecture
Module, Interface, Depth, Seam, Adapter, Leverage, Locality.

### Performance
Work per tick, loops, history scans, handles, chart updates, WebRequest, timers e long handlers.

### UI
Displayed state versus configured state versus actual state.

### Licensing
Activation, expiry, revocation, entitlement, grace, retries, offline behavior, secrets e failure-safe management.

### Documentation
Código versus defaults, strategy, schedules, risk, buffers, UI, API e limitations.

### Regulatory
Sinalizar necessidade de revisão específica sem conclusão jurídica definitiva.

---

## 13. Cenários adversariais

Aplicar somente quando relevantes:

```text
duplicate tick
same-bar duplicate signal
partial fill
rejected order
delayed/reordered transaction
market closed
invalid stops/volume
insufficient margin
spread spike
gap
restart/reconnect
history reload
prev_calculated reset
missing ticks
session transition
daily reset
manual position
another EA same symbol
Magic conflict
netting/hedging
multi-deal fill
API timeout
license server offline
```

---

## 14. Evidence Gate

Finding material inclui:
- severity;
- confidence;
- nature;
- location;
- invariant;
- evidence;
- scenario;
- impact;
- recommendation;
- reference;
- verification.

CRITICAL/HIGH são re-lidos contra o caminho completo e tentados falsificar.

---

## 15. Confidence

- CONFIRMED BY CODE
- CONFIRMED BY OFFICIAL DOCUMENTATION
- CONFIRMED BY TEST
- PROBABLE RISK
- HYPOTHESIS - TEST REQUIRED
- BROKER / ENVIRONMENT DEPENDENT

---

## 16. Nature

- CODE-INTERNAL DEFECT
- CODE VS SPEC DEFECT
- SPEC AMBIGUITY
- ARCHITECTURE DEFECT
- ROBUSTNESS IMPROVEMENT
- BUSINESS / STRATEGY DECISION
- REGULATORY REVIEW REQUIRED
- BROKER / ENVIRONMENT DEPENDENT

---

## 17. Severity

**CRITICAL:** uncontrolled exposure, wrong-position action, protection failure, destructive state corruption, severe lot error ou secret exposure.

**HIGH:** serious correctness/operational failure.

**MEDIUM:** real defect with bounded impact.

**LOW:** maintainability/clarity/minor resilience.

**INFO:** observation.

---

## 18. Coverage Gate

Antes de dizer "sem CRITICAL/HIGH", cobrir:
- runtime entry points;
- trade lifecycle;
- risk/exposure;
- state/ownership;
- source-of-truth docs;
- applicable indicator/tester/UI/licensing paths.

Critical path não inspecionado = **LIMITED COVERAGE**.

---

## 19. Production Readiness

- READY
- CONDITIONAL
- BLOCKED
- LIMITED COVERAGE

READY não significa lucrativo.

Sem scores /10.

---

## 20. Source authority

Primária: https://www.mql5.com/en/docs

Usar documentação oficial atual para event handlers, trading APIs, positions/orders/deals, netting/hedging, Copy*, symbol/account properties, filling/execution, indicators, timers, tester e chart/object APIs.

Docs do projeto definem comportamento desejado.

Broker/exchange specs definem particularidades de instrumento/ambiente.

---

## 21. Trade execution baseline

```text
Signal → Market/account/risk validation → OrderCheck → Request → Server acceptance → Retcode → Order(s) → Deal(s) → Transactions → Confirmed position → Protection
```

---

## 22. State and ownership

Magic sozinho pode ser insuficiente.

Avaliar conforme necessidade:
- symbol;
- Magic;
- POSITION_IDENTIFIER;
- POSITION_TICKET;
- ORDER_POSITION_ID;
- DEAL_POSITION_ID;
- reason properties;
- strategy metadata.

---

## 23. Market portability

Não assumir point=pip, tick value fixo, contract fixo, volume step fixo, filling fixo ou stops fixos.

Preferir metadata dinâmica.

---

## 24. Multi-symbol

Verificar readiness, SymbolIsSynchronized, timestamps, CopyRates/CopyBuffer, BarsCalculated, sessions e bar detection por símbolo.

---

## 25. Tester fidelity

Distinguir Open Prices, 1 Minute OHLC, Every Tick e Real Ticks.

Escolher modo conforme estratégia.

---

## 26. Optimization

Não aprovar parâmetro apenas por max profit.

Avaliar trades, drawdown, recovery, expected payoff, Sharpe, neighbors, stability, forward, out-of-sample e regimes quando aplicável.

---

## 27. Architecture vocabulary

**Module:** interface + implementation.  
**Interface:** o que caller precisa saber.  
**Depth:** comportamento atrás de interface pequena.  
**Seam:** ponto testável/substituível.  
**Adapter:** implementação no seam.  
**Leverage:** valor por complexidade da interface.  
**Locality:** concentração de comportamento, estado e verificação.

Deletion test: se remover módulo espalha complexidade, provavelmente ele entrega valor.

---

## 28. Testing

Testar comportamento em seams significativos.

Compilação é gate de build, não prova de trading correctness.

---

## 29. Documentation

Depois de mudança aprovada, atualizar inputs/defaults, strategy, entry/exit, risk, schedules, state, markets, buffers, UI, architecture, licensing/backend, tester assumptions e limitations.

---

## 30. Licensing

```text
MQL5 client → HTTPS API → Database
```

Nunca distribuir admin credentials, service-role key ou master secret.

Falha de licença pode bloquear nova exposição conforme policy, mas não proteção/close de posições existentes.

---

## 31. Approval boundary

Read-only discovery/DEBUG investigation/REVIEW/AUDIT não precisam approval extra quando já solicitados.

Mudança de código:

```text
Discover → Decisions → Plan → Approve → Execute
```

---

## 32. Re-audit

- RESOLVED
- PARTIALLY RESOLVED
- NOT RESOLVED
- REGRESSION
- NO LONGER APPLICABLE

Validar comportamento, não apenas linha alterada.

---

## 33. Safety

Nunca validar com dinheiro real, trades live, alteração de broker/prod licensing, secrets expostos, compile/backtest inventado ou claims de lucratividade.

---

## 34. Completion

BUILD/IMPROVE/DEBUG: implementação, validação, post-change review, docs e limitações.

REVIEW: base/head/diff, eixos separados, evidence e coverage.

AUDIT: applicability, independent passes, verification, coverage, de-duplication e readiness.

---

## 35. Migração v2.x → v3.0

Removido:
- wizard obrigatório;
- checklist única;
- perguntas irrelevantes;
- scores /10;
- REVIEW misturado com AUDIT.

Adicionado:
- router;
- discovery-first;
- Facts vs Decisions;
- REVIEW;
- auditors especializados;
- Evidence Gate;
- Coverage Gate;
- adversarial review;
- feedback-loop DEBUG;
- architecture vocabulary;
- re-audit formal.

---

## 36. Regra final

> **A Skill não deve provar que o código parece correto. Ela deve tentar descobrir como ele pode falhar.**

> **Sem evidência, é hipótese. Sem validação, não é confirmação.**
