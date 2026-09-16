# IMPROVE workflow

Use IMPROVE for feature additions, refactors, UI changes, risk changes, licensing additions, or behavior changes to an existing project.

## 1. Discover current behavior

Read the relevant implementation and source-of-truth docs before asking questions.

Establish:
- current behavior;
- requested behavior;
- affected seams/state;
- execution/risk implications;
- likely regression surfaces.

## 2. Classify the change

- PATCH: small local correction or adjustment.
- FEATURE: new externally meaningful behavior.
- REFACTOR: structural change with no intended behavioral change.

Do not turn a PATCH into a rewrite.

## 3. Resolve only decisions

If the repository already answers a question, do not ask it.

Ask only when a material product, trading, risk, architecture, UI, licensing, or compatibility decision remains unresolved.

## 4. Plan and approval

State:
- what will change;
- what must remain unchanged;
- files/modules/seams affected;
- regression risks;
- validation plan;
- docs to update.

Request approval before source modification.

## 5. Execute

Preserve unrelated behavior.

Prefer changes that improve locality rather than scattering new branches across event handlers.

## 6. Regression and review

Validate:
- intended new behavior;
- unchanged adjacent behavior;
- execution/state/risk implications;
- tester behavior when applicable;
- documentation consistency.

Run a focused REVIEW on the resulting diff before completion.
