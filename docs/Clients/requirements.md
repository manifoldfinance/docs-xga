---
title: Requirements
description: Forward Contracts in the Primary market
tags: ["Forward Contracts", "gas auction", "mechanism design"]
---

## Required Validator Endpoints

-   /eth/v1/validator/attestation_data
-   /eth/v1/beacon/headers/{block_id}
-   /eth/v1/beacon/states/{state_id}/finality_checkpoints
-   /eth/v1/beacon/states/{state_id}/fork
-   /eth/v1/beacon/headers
-   /eth/v1/validator/liveness
-   /eth/v1/node/syncing
-   /eth/v1/config/deposit_contract
-   /eth/v1/beacon/states/{state_id}/committees
-   /eth/v1/validator/duties/attester/{epoch}
-   /eth/v1/validator/duties/proposer/{epoch}
-   /eth/v1/validator/duties/sync/{epoch}
-   /eth/v1/beacon/genesis
-   /eth/v1/validator/prepare_beacon_proposer
-   /eth/v1/beacon/pool/attestations
-   /eth/v1/beacon/blinded_blocks
-   /eth/v1/beacon/blocks
-   /eth/v1/beacon/pool/voluntary_exits
-   /eth/v1/validator/register_validator
-   /eth/v1/beacon/states/{state_id}/validators
-   /eth/v1/validator/aggregate_attestation
-   /eth/v1/validator/aggregate_and_proofs
-   /eth/v1/validator/contribution_and_proofs
-   /eth/v1/validator/beacon_committee_subscriptions
-   /eth/v1/beacon/pool/sync_committees
-   /eth/v1/beacon/blocks/{block_id}/root
-   /eth/v1/validator/sync_committee_contribution
