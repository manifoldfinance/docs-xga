---
title: Captive Insurance
---

## Captive Market Infrastructure Insurance

The proposed forward contract market for captive insurance is designed to provide a platform for the efficient transfer
of risk between participating validators and other market participants with the operation of the platform by the Relay.

The Relay manages validator connectivity and provides the validator with block proposals for the validator to use when
creating a block. The captive insurance is used to provide a service level agreement between the relay and the
validators connecting to the relay.

## Relay Insurance

XGA establishes the necessary infrastructure for trading, including contract execution, record-keeping, and dispute
resolution mechanisms. Additionally it will implement systems for monitoring contract performance and ensuring
compliance with the terms.

## Coverage Scope

In addition to traditional sorts of slashing protection mechanisms, the captive insurance model covers:

-   **Service Downtime**: Compensation for periods when the relay is not operational or accessible.
-   **Incorrect or Malicious Proposals**: Protection against losses due to incorrect or malicious block proposals
    provided by the relay.
-   **Performance Degradation**: Coverage for scenarios where the relay's performance significantly degrades, impacting
    validator operations.

### Premium Calculation

Based on the validator's stake size and the level of dependency on the relay service. Adjusted for the historical
performance and reliability metrics of the relay.

### Claim Process

Validators submit claims with evidence of the relay service issue (e.g., logs, performance metrics). Claims are verified
against relay service logs and performance data. Payouts are made based on the validated impact and the terms of the
insurance policy.

### Understanding Validator Slashing

Validator slashing occurs when a validator on the Ethereum network acts maliciously or fails to comply with network
consensus rules. This can result in the validator's stake being "slashed" or reduced as a penalty. Insurance against
slashing would compensate the validator for a portion of their lost stake.

### Captive Insurance Smart Contract Design

This contract would act as the "captive insurer," managing the insurance pool and claims.

**Stake Pooling**: Validators would contribute to an insurance pool, held in the smart contract. This pool would collect
premiums from validators who wish to insure their stake against slashing.

**Premium Calculation**: The smart contract would calculate premiums based on the risk of slashing, which could be
determined by past behavior, the amount of stake, and other risk factors.

**Claim Conditions**: The smart contract would define the conditions under which a claim can be made, such as the type
of slashing event and the evidence required to prove the slashing occurred.

**Claim Process**: In the event of slashing, the affected validator would submit a claim to the smart contract along
with evidence of the slashing event.

**Verification**: The smart contract would include or interact with an oracle or a set of oracles to verify the slashing event. This requires manual verification by Manifold Finance as the underwriter.

**Payouts**: Upon successful claim verification, the smart contract would automatically execute a payout to the slashed
validator from the insurance pool, according to the terms of the policy.

## API

This specification includes endpoints for retrieving the total accumulated premiums and claims, which would be useful
for reporting and auditing purposes. The claims queue endpoint allows for managing and viewing the list of claims that
are pending action. Lastly, the health check endpoint provides a simple way to monitor the API's status, which is
crucial for maintenance and uptime monitoring.

```yaml
/premiums/accumulated:
    get:
        summary: Get total accumulated premiums
        operationId: getAccumulatedPremiums
        tags:
            - Premiums
        responses:
            "200":
                description: Total accumulated premiums retrieved successfully
                content:
                    application/json:
                        schema:
                            $ref: "#/components/schemas/AccumulatedPremiums"

/claims/accumulated:
    get:
        summary: Get total accumulated claims
        operationId: getAccumulatedClaims
        tags:
            - Claims
        responses:
            "200":
                description: Total accumulated claims retrieved successfully
                content:
                    application/json:
                        schema:
                            $ref: "#/components/schemas/AccumulatedClaims"

/claims/queue:
    get:
        summary: Get the queue of claims awaiting processing
        operationId: getClaimsQueue
        tags:
            - Claims
        responses:
            "200":
                description: Claims queue retrieved successfully
                content:
                    application/json:
                        schema:
                            $ref: "#/components/schemas/ClaimsQueue"
```
