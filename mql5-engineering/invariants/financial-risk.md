# Financial-risk invariants

- Final requested volume after broker normalization must remain within the configured risk policy or the trade must be rejected/adjusted explicitly.
- Minimum lot must not silently force risk above the allowed ceiling.
- Invalid or unavailable tick/contract/volume economics must fail safely rather than fabricate sizing precision.
- Aggregate exposure must include relevant existing positions, pending exposure and scaling legs defined by the product.
- Adding exposure must not bypass campaign/portfolio limits through timing or state races.
- Restart/reconnect must not reset risk accounting while broker exposure remains.
- Loss of licensing/backend/news data may block new exposure but must not disable protective management of existing positions.
