---
title: Accounting and Rewards
---

## Payment processing and finalization

Builder payments are processed during the epoch finalization process (a
two-epoch lag).

-   The builder `ExecutionPayloadHeader` is part of the canonical chain (i.e.,
    the CL block for that slot is not missing). This includes two cases: The
    corresponding `ExecutionPayload` MUST also part of the canonical chain.

-   The builder `ExecutionPayloadHeader` is part of the canonical chain even if
    the corresponding `ExecutionPayload` is not.

This means that there is consensus that the builder was not on time by virtue of
having an empty block. However, this may be intentional in the mutli-block
auction scenario so is subject to change

### Proposer equivocation

There is no evidence of proposer equivocation.

-   A builder who sees an equivocation can get the validator slashed. Any
    slashed validator will not receive the unconditional builder payment.

## Builder Payment Methods

Builder payment patterns in the context of MEV payments to the validators

> Read more at [Learning: Payment Methods](../Developers/payment-methods.md)

### Indirect Address Payment (IAP) Method

This method involves the builder using a different address to pay the proposer
through an end-of-block transaction. In this pattern, the builder first sets its
own address to receive the block’s transaction fees and then employs a different
address to remunerate the proposer in the end-of-block transaction.

### Intermediate Transfer Payment (ITP) Method

In this method, the builder pays the proposer through an end-of-block
transaction, initially transferring the amount to an alternate address, which
then initiates an internal transaction to send the funds to the proposer. This
involves a two-step process where the payment is first sent to an intermediary
address (like a smart contract) before reaching the proposer.

## Proposer Payments Value (PPV)

The `feeReceipent` address is configured in the consensus layer client and is
provided by the NO at the time of the block proposal. Because the eth1 address
that is provided for the feeReceipent is under the complete control of the NO,
there is an opportunity for a NO to steal all the PPV for themselves.
