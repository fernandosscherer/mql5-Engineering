# Codebase design

**Module:** interface + implementation.
**Interface:** everything a caller must know, including invariants, ordering, errors, configuration, and relevant performance behavior.
**Depth:** useful behavior hidden behind a small interface.
**Seam:** point where behavior can be exercised/substituted without editing the caller.
**Adapter:** concrete implementation at a seam.
**Leverage:** capability obtained per unit of interface complexity.
**Locality:** concentration of related behavior, state, change, bugs, and verification.

Prefer deep modules, explicit state ownership, local risk/execution invariants, meaningful test seams, and no speculative abstraction. Use the deletion test. Architecture findings require concrete friction.
