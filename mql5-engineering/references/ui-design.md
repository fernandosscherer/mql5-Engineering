# UI / panel design review

## Source of truth

Before judging aesthetics or layout, identify the repository design source of truth, for example:

- `docs/master.md`
- `docs/prompt master.md`
- `docs/design-system.md`

Treat deviations as design defects only when a documented requirement exists.

## Review

Check:

- hierarchy;
- alignment/spacing;
- typography;
- contrast/colors;
- numeric formatting;
- resizing/scaling;
- status visibility;
- information density;
- consistency with product theme.

## Safety-critical UX

Pay extra attention to controls such as:

- Start;
- Pause;
- Stop;
- Close/Exit;
- emergency close;
- auto-trade enable;
- lot/risk inputs;
- daily limits;
- session controls.

Labels and states must not create ambiguity about whether new entries, existing-position management, or emergency exits remain active.
