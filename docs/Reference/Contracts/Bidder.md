---
description: Bidder
---

# Bidder.sol
> [Read code on GitHub](https://github.com/manifoldfinance/xga-auctioneer-v1/blob/maaster/src/Bidder.sol)





## Methods

### getBid



```solidity title="Solidity"
function getBid(uint256 slot) external view returns (uint256[] packedBids)
```


!!! info
	
	Get the bid from a bidder for a specific slot and round.


#### Parameters

| Name | Type | Description |
|---|---|---|
| slot | uint256 | The auction slot. |

#### Returns

| Name | Type | Description |
|---|---|---|
| packedBids | uint256[] | Array of bids (in a packed format). uint256(uint128(bidPrice),uint120(itemsToBuy),uint8(bidderId)) |




