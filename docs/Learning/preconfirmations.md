---
title: Guaranteeing Blockchain Transactions
description: Understanding Inclusion and Execution Preconfirmations
tags: ["preconfirmations", "inclusion lists", "gas auction", "mechanism design"]
status: new
---

Inclusion and execution preconfirmations are essential mechanisms in blockchain transaction management, each serving
distinct roles to enhance transaction reliability and trust. Inclusion preconfirmations ensure that a transaction will
be incorporated into the blockchain, offering a preliminary guarantee that the transaction will occupy a block. This
mechanism primarily focuses on the transaction's entry into the block and may involve conditions such as block space
availability, transaction fees, or ordering.

In contrast, execution preconfirmations provide assurances that a transaction will not only be included but also
guarantee the settlement outcome once executed and included on chain.

Both preconfirmation types leverage various economic incentives and penalties, such as collateral, insurance or
slashing, to uphold their guarantees and mitigate associated risks.

## Inclusion Pre-confirmations

-   **Definition:** Pre-confirmation that a transaction will be included in a block.
-   **Focus:** Ensuring that a transaction makes it into the blockchain.
-   **Guarantees:** Guarantees inclusion in the blockchain.
-   **Verification:** Typically requires less intensive verification.
-   **Examples of Mechanisms:** Optimistic Pre-confirmations, Pessimistic Pre-confirmations.
-   **Conditions:** May involve conditions related to block space, fees, or order.
-   **Economic Incentives:** May involve collateral or slashing for not including transactions.

## Execution Pre-confirmations

-   **Definition:** Pre-confirmation that a transaction will be executed once included.
-   **Focus:** Ensuring that a transaction is executed correctly and without issues.
-   **Guarantees:** Guarantees settlement of execution of the transaction.
-   **Verification:** May require more intensive verification to ensure execution correctness.
-   **Examples of Mechanisms:** Validity-based Pre-confirmations, Unconditional Pre-confirmations.
-   **Conditions:** May involve conditions related to the state, computational resources, or correctness.
-   **Economic Incentives:** May involve economic penalties for failed execution.

## Exotic Preconfirmations and Where NOT to find them

-   **Optimistic Pre-confirmations:**

    -   Assumes trust by default
    -   May involve collateral or slashing conditions if not honored

-   **Pessimistic Pre-confirmations:**

    -   Requires explicit verification and guarantees
    -   Involves intensive computational checks or multi-party agreements

-   **Execution Tickets:**

    -   Validators' roles are separated
    -   L1 proposers can opt into pre-confirmations and sequencing through a side protocol
    -   Could be implemented as an AVS (Eigen layer)

-   **Collateral-based Pre-confirmations:**

    -   Relies on economic incentives and penalties (e.g., slashing of collateral)

-   **Validity-based Pre-confirmations:**

    -   Requires real-time verification and validation mechanisms

-   **Conditional Pre-confirmations:**

    -   Tied to specific conditions or outcomes
    -   Transaction inclusion depends on particular state or circumstances

-   **Unconditional Pre-confirmations:**
    -   Promises execution regardless of future states or conditions
    -   Requires strong guarantees

## Pre-confirmation Mechanism Matrix

| Mechanism                              | Description                                                                                     | Verification Method                                    | Conditions/Incentives                  | Roles/Implementation                                        |
| -------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------ | -------------------------------------- | ----------------------------------------------------------- |
| **Optimistic Pre-confirmations**       | Assumes transaction will be included based on trust by default                                  | Based on trust, may involve collateral/slashing        | Trust, collateral, slashing penalties  | Validators, possible AVS implementation                     |
| **Pessimistic Pre-confirmations**      | Involves explicit verification and guarantees before pre-confirmation is valid                  | Intensive computational checks, multi-party agreements | Verification and validation            | Validators, requires multi-party agreement                  |
| **Execution Tickets**                  | Separates validators' roles, allowing L1 proposers to opt into pre-confirmations and sequencing | Side protocol implementation, AVS (Eigen layer)        | Opt-in mechanisms for L1 proposers     | L1 proposers, AVS implementation, decoupled from validators |
| **Collateral-based Pre-confirmations** | Relies on economic incentives and penalties (slashing of collateral)                            | Economic incentives and penalties                      | Slashing of collateral                 | Validators, economic penalties                              |
| **Validity-based Pre-confirmations**   | Relies on real-time verification and validation mechanisms                                      | Real-time verification and validation                  | Inherent transaction validity          | Validators, real-time validation                            |
| **Conditional Pre-confirmations**      | Tied to specific conditions or outcomes for transaction inclusion                               | Condition-specific verification                        | Specific state or set of circumstances | Validators, conditional mechanisms                          |
| **Unconditional Pre-confirmations**    | Guarantees transaction execution regardless of future states or conditions                      | Strong guarantees                                      | None (unconditional promise)           | Validators, strong guarantee mechanisms                     |

This table summarizes the key aspects of each pre-confirmation mechanism, highlighting their descriptions, verification
methods, conditions or incentives, and roles or implementations involved.
