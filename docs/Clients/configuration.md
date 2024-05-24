---
title: Configuration
description: Mandatory values, settings and settings.
---

## Mandatory Values for Validator and Beacon clients

**LocalBlockValueBoost** is the value boost for local block construction. This
is used to prioritize local block construction over relay/builder block
construction.

```toml
LocalBlockValueBoost = 0
```

The equation is as follows:

#### Prysm[^1]

$$
builder_bid_value _ 100 > local_block_value _ (local-block-value-boost + 100)
$$

#### Teku[^2]

$$
exec_node_payload_value >= builder_boost_factor \* (builder_payload_value // 100)
$$

### Example: Prysm

```golang
EthBurnAddressHex                string           // EthBurnAddressHex is the constant eth address written in hex format to burn fees in that network. the default is 0x0
DefaultBuilderGasLimit           uint64           // DefaultBuilderGasLimit is the default used to set the gaslimit for the Builder APIs, typically at around 30M wei.

// Mev-boost circuit breaker
MaxBuilderConsecutiveMissedSlots primitives.Slot // MaxBuilderConsecutiveMissedSlots defines the number of consecutive skip slot to fallback from using relay/builder to local execution engine for block construction.
MaxBuilderEpochMissedSlots       primitives.Slot // MaxBuilderEpochMissedSlots is defines the number of total skip slot (per epoch rolling windows) to fallback from using relay/builder to local execution engine for block construction.
LocalBlockValueBoost             uint64          // LocalBlockValueBoost is the value boost for local block construction. This is used to prioritize local block construction over relay/builder block construction.

// Execution engine timeout value
```

### Example: Teku

```java
  private void logPayloadValueComparisonDetails(
      final boolean localPayloadValueWon,
      final UInt256 builderBidValue,
      final UInt256 localPayloadValue,
      final boolean isRequestedBuilderBoostFactor,
      final UInt64 actualBuilderBoostFactor) {
    final String actualComparisonFactorString;
    final String comparisonFactorSource = isRequestedBuilderBoostFactor ? "VC" : "BN";

    if (actualBuilderBoostFactor.equals(BUILDER_BOOST_FACTOR_MAX_PROFIT)) {
      actualComparisonFactorString = "MAX_PROFIT";
    } else if (actualBuilderBoostFactor.equals(BUILDER_BOOST_FACTOR_PREFER_EXECUTION)) {
      actualComparisonFactorString = "PREFER_EXECUTION";
    } else if (actualBuilderBoostFactor.equals(BUILDER_BOOST_FACTOR_PREFER_BUILDER)) {
      actualComparisonFactorString = "PREFER_BUILDER";
    } else {
      actualComparisonFactorString = actualBuilderBoostFactor + "%";
    }
```

### Footnotes

[^1]: Prysm
[^2]: Teku
