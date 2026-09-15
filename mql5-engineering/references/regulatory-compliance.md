# Regulatory and user-facing compliance review

This is an engineering flagging layer, not legal advice.

## Jurisdiction

Determine the product's market/customer context before applying a regulator. For Brazil, use current official CVM sources where the feature relates to regulated investment activity. Do not assume CVM rules are sufficient for international distribution.

## Flag for specialist review

Use `REGULATORY REVIEW REQUIRED` when code/UI/product behavior may involve issues such as:

- guaranteed or fixed return claims;
- misleading risk claims;
- individualized recommendation/advice features;
- functionality whose legal classification depends on business model;
- marketing text inconsistent with actual risk/execution.

Do not make a definitive legal conclusion from code alone.

## Engineering separation

Financial safety controls must not be weakened by marketing, plan, or licensing logic.
