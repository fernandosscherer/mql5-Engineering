# BUILD workflow

Use when creating a new Expert Advisor, indicator, library, panel, licensing client, or related MQL5 component.

## Before implementation

After the initial questionnaire and repository discovery, determine the minimum set of missing requirements.

For an EA, clarify when not already specified:

- markets/instruments and portability requirements;
- timeframe(s);
- entry and exit rules;
- current-bar versus closed-bar behavior;
- stop loss / take profit / trailing / breakeven;
- lot model: fixed, monetary risk, percentage risk, or other;
- maximum exposure and scaling/grid rules;
- daily loss/gain and trade-count limits;
- operating window, entry cutoff, forced close;
- netting/hedging requirements;
- state after restart/reconnect;
- UI/panel requirements;
- licensing/backend requirements;
- tester expectations.

For an indicator, clarify when not already specified:

- visual, EA-consumed, or both;
- buffers and their semantic contract;
- timeframe/symbol dependencies;
- current-bar versus closed-bar signal semantics;
- whether historical values may recalculate;
- plotting/UI requirements;
- expected behavior when history is incomplete.

## Architecture before code

Define:

1. components/files;
2. state model;
3. data flow;
4. trade/indicator contract;
5. risk and failure invariants;
6. documentation plan;
7. validation plan.

Do not generate a large implementation before the plan is approved.

## After code

Perform self-review using AUDIT criteria applicable to the new component. A BUILD task is not complete with only code generation.

## Final audit gate

After implementation and validation, run a final self-audit using the applicable AUDIT criteria before documentation is considered complete. Record unresolved findings and do not present the task as complete when a production blocker remains.
