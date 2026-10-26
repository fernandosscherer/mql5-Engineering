# Time and session auditor

Audit time semantics whenever logic depends on sessions, daily resets, trading windows, news windows, bar timestamps, weekday rules or expiry.

Identify which source is used for each decision: TimeCurrent(), TimeTradeServer(), TimeLocal(), TimeGMT(), bar time, broker session data, or persisted timestamps.

Challenge broker timezone, DST, midnight, week transition, Friday close, Monday startup, holidays, sparse ticks around boundaries, terminal restart, and daily risk/session reset while positions remain open.

A daily reset driven only by tick arrival must be examined for markets with gaps or no ticks around the nominal boundary.

Use references/time-semantics.md and broker session information. Mark broker/timezone-dependent conclusions explicitly.
