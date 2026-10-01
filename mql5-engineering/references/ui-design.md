# UI / panel design review

## Source of truth

Before judging aesthetics or layout, identify the repository design source of truth, for example:

- `docs/master.md`
- `docs/prompt master.md`
- `docs/design-system.md`

Treat deviations as design defects only when a documented requirement exists.

## Visual review

Check:

- hierarchy and reading order;
- alignment and spacing consistency;
- typography: font size and weight hierarchy;
- contrast and color usage (accessibility);
- numeric formatting: decimal places, separators, currency symbols;
- resizing and scaling behavior when the chart panel is resized;
- status visibility: active, paused, disabled states must be visually distinct;
- information density: critical data must not be buried or truncated;
- consistency with the product's documented design theme.

## Safety-critical controls

Pay extra attention to controls that affect trading behavior:

- Start / Resume;
- Pause / Suspend;
- Stop trading;
- Close all positions / emergency exit;
- Auto-trade enable/disable;
- Lot size and risk inputs;
- Daily loss/gain limits;
- Session schedule controls.

Labels and states must not create ambiguity about whether new entries, existing-position management, or emergency exits are currently active. An EA that appears stopped but is still managing positions is a user-safety defect.

## Chart object management

For panels built with `ObjectCreate` / chart primitives:

- Object names must be unique and prefixed with the EA's identifier (e.g. `"MyEA_"` + suffix) to avoid collisions with manual objects, other EAs, or indicators.
- Every object created in `OnInit` or on-the-fly must be deleted in `OnDeinit` with `ObjectsDeleteAll(0, prefix)` or individual `ObjectDelete` calls.
- Avoid creating new objects on every tick or timer call. Create once, then update properties with `ObjectSetString` / `ObjectSetDouble` / `ObjectSetInteger`.
- Check `ObjectCreate()` return value; failure means the object was not created and subsequent `ObjectSet*` calls will silently do nothing.

## `OnChartEvent` handling

When the panel responds to user interaction:

- Filter events by `id` (`CHARTEVENT_OBJECT_CLICK`, `CHARTEVENT_CLICK`, `CHARTEVENT_KEYDOWN`, etc.) before acting.
- Validate `sparam` (object name) against known panel object names before taking trading action.
- Do not trigger new orders from chart events without validating current EA state (e.g., already have a position, licensing invalid, outside session).
- Keep event handlers fast; do not perform blocking operations (e.g., `WebRequest`, heavy history scans) inside `OnChartEvent`.

## Panel classes (CDialog / CPanel / CWnd)

When using the standard MT5 dialog library (`Include\Controls\`):

- Call `Create()` with explicit coordinates; do not rely on default placement.
- Register and destroy controls in the correct order (parent before children on destroy).
- Attach `OnChartEvent` forwarding (`m_dialog.ChartEvent(id, lparam, dparam, sparam)`) to ensure controls receive events.
- Ensure `ChartRedraw()` is called after bulk updates, but not on every tick unnecessarily.

## `ChartRedraw` discipline

Excessive `ChartRedraw()` calls on every tick or every timer event degrade terminal performance. Redraw only when the displayed data has actually changed. Use a dirty flag or compare previous values.

## String and numeric display

- Format prices with `DoubleToString(price, _Digits)` or symbol-appropriate digits, not a hardcoded decimal count.
- Format lot sizes with `DoubleToString(volume, 2)` unless the symbol requires more precision.
- Format monetary values with the account currency symbol and locale-appropriate separator.
- Never display raw floating-point representation (e.g., `0.10000000001`).

## Indicator buffer visualization (custom indicators)

- Validate that plot indexes and buffer indexes are correctly mapped — they are not always one-to-one.
- Use `DRAW_NONE` for internal calculation buffers that should not be rendered.
- Set `INDICATOR_MINIMUM` / `INDICATOR_MAXIMUM` when the scale should be fixed (e.g., 0–100 oscillators).
- Confirm that color changes, line style, and arrow codes are applied to the correct buffer index.
