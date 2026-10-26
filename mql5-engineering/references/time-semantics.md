# Time semantics

Use this guide to reason about time-dependent behavior; consult official MQL5 documentation for exact API semantics.

For every material time rule identify the source of time and why it is appropriate: terminal/server time, local machine time, GMT, bar timestamp, broker session data, Economic Calendar timestamp, or persisted timestamp.

Do not treat these sources as interchangeable. Audit timezone assumptions, daylight-saving transitions, sparse/no-tick boundaries, restart/reconnect, day/week changes and session calendars.

Daily/session risk resets deserve special scrutiny when positions survive the boundary or when reset code executes only on the next tick.

When a conclusion depends on broker timezone/session configuration, classify it as environment dependent and request/derive the missing deployment fact rather than guessing.
