---
description: SettlementHouse
---

# SettlementHouse.sol

> [Read code on GitHub](https://github.com/manifoldfinance/xga-auctioneer-v1/blob/master/src/SettlementHouse.sol)

!!! note 

    A contract for managing bundles of transactions for a futures token.

## Methods

### futuresToken

```solidity title="Solidity"
function futuresToken() external view returns (contract IERC6909)
```

#### Returns

| Name | Type              | Description |
| ---- | ----------------- | ----------- |
| \_0  | contract IERC6909 | undefined   |

### queryBundles

```solidity title="Solidity"
function queryBundles(uint256 slot) external view returns (struct SettlementHouse.Bundle[] slotBundles)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

#### Returns

| Name        | Type                     | Description |
| ----------- | ------------------------ | ----------- |
| slotBundles | SettlementHouse.Bundle[] | undefined   |

### submitBundle

```solidity title="Solidity"
function submitBundle(uint256 slot, uint256 amountOfGas, bytes32[] bundleHashes) external nonpayable
```

#### Parameters

| Name         | Type      | Description |
| ------------ | --------- | ----------- |
| slot         | uint256   | undefined   |
| amountOfGas  | uint256   | undefined   |
| bundleHashes | bytes32[] | undefined   |

## Events

### BundleSubmitted

```solidity title="Solidity"
event BundleSubmitted(address indexed sender, uint256 indexed slot, uint256 indexed index, uint256 amountOfGas)
```

#### Parameters

| Name             | Type    | Description |
| ---------------- | ------- | ----------- |
| sender `indexed` | address | undefined   |
| slot `indexed`   | uint256 | undefined   |
| index `indexed`  | uint256 | undefined   |
| amountOfGas      | uint256 | undefined   |

## Errors

### Unauthorized

```solidity title="Solidity"
error Unauthorized()
```
