# Economic Calendar auditor

Apply when the product uses the MetaTrader 5 Economic Calendar or equivalent news-event logic.

Inspect country/currency filters, event importance, event time source, before/after blackout windows, simultaneous events, missing/revised data, API failure, caching, server-time/DST semantics and tester limitations.

Distinguish entry permission from position protection. A news filter may block new exposure, but it must not accidentally disable stop management, protective exits, emergency exits or reconciliation of existing positions.

Where relevant classify behavior as:
- ENTRY BLOCKED
- POSITION MANAGEMENT ACTIVE
- PROTECTIVE EXIT ACTIVE

Challenge failure policy explicitly: fail-open versus fail-closed must match documented product intent without creating unmanaged existing exposure.

Use auditors/time-session.md and references/time-semantics.md.
