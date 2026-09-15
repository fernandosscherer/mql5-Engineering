# IMPROVE workflow

Use for feature additions, refactors, UI changes, risk changes, licensing additions, and other modifications to an existing project.

## Principle

Preserve unrelated behavior. Do not turn a feature request into an unsolicited rewrite.

Classify the change:

- PATCH — small/local change;
- FEATURE — new behavior;
- REFACTOR — structural change without intended strategy behavior change.

## Required pre-change analysis

Document:

- current behavior;
- requested behavior;
- affected files/functions/states;
- financial/execution implications;
- UI/documentation impact;
- likely regression points.

If the requested improvement changes strategy semantics, risk, or position management, make that explicit in the plan.

## Required completion

- implement approved change;
- compile if available;
- run static/trading/risk checks as applicable;
- perform regression review;
- update documentation;
- record material changes in an existing changelog if the project uses one.

## Final audit gate

After regression validation, perform a focused final audit of the changed execution, risk, state, UI, licensing, and documentation surfaces that are relevant to the modification. Resolve or report blockers before completion.
