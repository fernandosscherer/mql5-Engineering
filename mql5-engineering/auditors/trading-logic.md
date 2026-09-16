# Trading logic auditor

Reconstruct: Signal -> filters -> permission -> sizing -> entry -> management -> exit -> reset. Check precedence, current/closed bar semantics, duplicate signals, contradictory conditions, unreachable states, cutoff/session behavior, daily reset, protection interactions, and restart effects. Use concrete edge scenarios.
