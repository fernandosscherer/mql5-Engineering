# Risk scenarios

- RISK-001 minimum lot exceeds configured monetary risk: reject or explicitly handle according to policy.
- RISK-002 volume normalization increases exposure: final risk remains within ceiling.
- RISK-003 tick value unavailable/zero: sizing fails safely.
- RISK-004 unusual contract size: sizing derives from actual symbol economics.
- RISK-005 account currency differs from symbol profit currency: conversion/economics are handled correctly.
- RISK-006 multiple simultaneous positions: aggregate risk includes concurrent exposure.
- RISK-007 scaling exceeds campaign budget: additional leg is blocked/reduced.
- RISK-008 gap beyond stop: worst-case discussion acknowledges non-guaranteed stop price.
- RISK-009 spread expansion before entry: actual entry/risk policy remains valid.
- RISK-010 insufficient margin after sizing: request fails without false position state.
- RISK-011 restart with existing exposure: risk accounting reconciles existing positions.
- RISK-012 daily limit near session/day transition: reset cannot erase still-relevant loss/exposure state.
