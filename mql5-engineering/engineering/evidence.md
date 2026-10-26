# Evidence model

A finding must be verifiable by another engineer. Recommended conceptual schema:

```yaml
id: RISK-003
domain: financial-risk
severity: CRITICAL
confidence: CONFIRMED BY CODE
location:
  file: RiskManager.mqh
  function: CalculateLot
  lines: 118-142
invariant: normalized requested volume must remain inside risk budget
evidence: ...
trigger: ...
failure_scenario: ...
impact: ...
recommended_correction: ...
verification: ...
```

YAML formatting is optional; the fields are not. Use the smallest evidence sufficient to prove the claim and cite authoritative MQL5 documentation when runtime/API semantics are material.

CRITICAL/HIGH candidates require a falsification pass against the full call path, guards, specs, official semantics and account/symbol conditions before final severity is retained.
