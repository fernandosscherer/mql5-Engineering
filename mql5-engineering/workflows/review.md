# REVIEW workflow

Use REVIEW for a branch, PR, commit range, staged change, or other bounded change set.

REVIEW is about the change. AUDIT is about the product.

## 1. Establish the fixed point

Prefer the user's explicit base.

If the user says "review this branch" without a base and the repository has an unambiguous default branch, determine the merge-base automatically.

Ask only when multiple plausible bases would materially change the reviewed diff.

Record:
- base/fixed point;
- head;
- commit list;
- actual diff scope.

Do not silently exclude uncommitted work if the user's request clearly includes it.

## 2. Find intended behavior

Look for the change's source of truth:
- issue or ticket;
- spec;
- project docs;
- commit/PR description;
- explicit user request.

If no spec exists, say so. Do not invent one.

## 3. Run separate review axes

### Spec axis
Does the change implement the intended behavior?

Find:
- missing or partial requirements;
- behavior that contradicts the spec;
- scope creep with operational consequences;
- documented defaults or semantics not reflected in code.

### Engineering axis
Is the change built safely and consistently?

Check:
- MQL5/API correctness;
- error handling;
- state transitions;
- financial/execution implications;
- architecture/locality;
- regression risk.

### Bug/risk axis
Try to break the changed behavior with concrete scenarios.

For trading changes, include adjacent state/risk/execution paths required to understand the diff safely.

## 4. Evidence

Every finding must cite the changed location or the unchanged dependency required to demonstrate the changed behavior.

Do not report general pre-existing problems unrelated to the change; route those to AUDIT.

## 5. Output

Keep Spec, Engineering, and Bug/Risk findings distinguishable in the report.

State coverage limitations and validations actually run.
