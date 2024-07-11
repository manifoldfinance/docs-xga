---
description: Auctioneer Contract
---

# Auctioneer.sol

> [Read code on GitHub](https://github.com/manifoldfinance/xga-auctioneer-v1/blob/master/src/Auctioneer.sol)

!!! note 

  Implements an auction mechanism for selling block space.

## Methods

### IdMap

```solidity title="Solidity"
function IdMap(address bidder) external view returns (uint8 id)
```

#### Parameters

| Name   | Type    | Description |
| ------ | ------- | ----------- |
| bidder | address | undefined   |

#### Returns

| Name | Type  | Description |
| ---- | ----- | ----------- |
| id   | uint8 | undefined   |

### WETH9

```solidity title="Solidity"
function WETH9() external view returns (contract WETH)
```

#### Returns

| Name | Type          | Description |
| ---- | ------------- | ----------- |
| \_0  | contract WETH | undefined   |

### acceptOwnership

```solidity title="Solidity"
function acceptOwnership() external nonpayable
```

!!! info The new owner accepts the ownership transfer.

### accountant

```solidity title="Solidity"
function accountant() external view returns (address)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |

### allowance

```solidity title="Solidity"
function allowance(address, address, uint256) external view returns (uint256)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |
| \_1  | address | undefined   |
| \_2  | uint256 | undefined   |

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | uint256 | undefined   |

### approve

```solidity title="Solidity"
function approve(address spender, uint256 id, uint256 amount) external nonpayable returns (bool)
```

#### Parameters

| Name    | Type    | Description |
| ------- | ------- | ----------- |
| spender | address | undefined   |
| id      | uint256 | undefined   |
| amount  | uint256 | undefined   |

#### Returns

| Name | Type | Description |
| ---- | ---- | ----------- |
| \_0  | bool | undefined   |

### auctions

```solidity title="Solidity"
function auctions(uint256 slot) external view returns (uint120 itemsForSale, bool isOpen, bool isSettled, bool isPaidOut, bool isRefunded)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

#### Returns

| Name         | Type    | Description |
| ------------ | ------- | ----------- |
| itemsForSale | uint120 | undefined   |
| isOpen       | bool    | undefined   |
| isSettled    | bool    | undefined   |
| isPaidOut    | bool    | undefined   |
| isRefunded   | bool    | undefined   |

### balanceOf

```solidity title="Solidity"
function balanceOf(address, uint256) external view returns (uint256)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |
| \_1  | uint256 | undefined   |

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | uint256 | undefined   |

### bid

```solidity title="Solidity"
function bid(uint256 slot, uint256[] packedBids) external nonpayable
```

!!! info Bid function for bidders to submit manual bids.

#### Parameters

| Name       | Type      | Description          |
| ---------- | --------- | -------------------- |
| slot       | uint256   | The auction slot.    |
| packedBids | uint256[] | Array of packed bids |

### bidCount

```solidity title="Solidity"
function bidCount(uint256 slot) external view returns (uint256 count)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

#### Returns

| Name  | Type    | Description |
| ----- | ------- | ----------- |
| count | uint256 | undefined   |

### bidderMap

```solidity title="Solidity"
function bidderMap(uint8 id) external view returns (address bidder)
```

#### Parameters

| Name | Type  | Description |
| ---- | ----- | ----------- |
| id   | uint8 | undefined   |

#### Returns

| Name   | Type    | Description |
| ------ | ------- | ----------- |
| bidder | address | undefined   |

### calcAverageBid

```solidity title="Solidity"
function calcAverageBid(uint256 numAuctions) external view returns (uint128 avBidPrice)
```

!!! info Calculate average bid price for the last n auctions

#### Parameters

| Name        | Type    | Description                       |
| ----------- | ------- | --------------------------------- |
| numAuctions | uint256 | Number of auctions to average for |

#### Returns

| Name       | Type    | Description         |
| ---------- | ------- | ------------------- |
| avBidPrice | uint128 | for last n auctions |

### changeOperator

```solidity title="Solidity"
function changeOperator(address newOperator) external nonpayable
```

!!! info Change operator of the auction.

#### Parameters

| Name        | Type    | Description                     |
| ----------- | ------- | ------------------------------- |
| newOperator | address | The address of the new operator |

### getBidderInfo

```solidity title="Solidity"
function getBidderInfo(uint256 slot, address bidder) external view returns (uint120 itemsBought, uint128 amountOwed)
```

!!! info Retrieve information about a bidder after auction settlement.

#### Parameters

| Name   | Type    | Description                                                  |
| ------ | ------- | ------------------------------------------------------------ |
| slot   | uint256 | The slot identifier of the auction.                          |
| bidder | address | The address of the bidder for whom information is requested. |

#### Returns

| Name        | Type    | Description                                                                                                                                                                                                          |
| ----------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| itemsBought | uint120 | The number of items bought by the bidder in the specified auction.                                                                                                                                                   |
| amountOwed  | uint128 | The amount owed by the bidder for the items bought in the specified auction. Requirements: - The auction must have been settled. - The provided `bidder` address must be valid and have participated in the auction. |

### isOperator

```solidity title="Solidity"
function isOperator(address, address) external view returns (bool)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |
| \_1  | address | undefined   |

#### Returns

| Name | Type | Description |
| ---- | ---- | ----------- |
| \_0  | bool | undefined   |

### maxBidder

```solidity title="Solidity"
function maxBidder() external view returns (uint8)
```

#### Returns

| Name | Type  | Description |
| ---- | ----- | ----------- |
| \_0  | uint8 | undefined   |

### maxBids

```solidity title="Solidity"
function maxBids() external view returns (uint256)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | uint256 | undefined   |

### minGasAmount

```solidity title="Solidity"
function minGasAmount() external view returns (uint120)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | uint120 | undefined   |

### newBidder

```solidity title="Solidity"
function newBidder(address additionalBidder) external nonpayable returns (uint8 newId)
```

!!! info Add a new bidder to the auction.

#### Parameters

| Name             | Type    | Description                           |
| ---------------- | ------- | ------------------------------------- |
| additionalBidder | address | The address of the additional bidder. |

#### Returns

| Name  | Type  | Description |
| ----- | ----- | ----------- |
| newId | uint8 | undefined   |

### openAuction

```solidity title="Solidity"
function openAuction(uint256 slot, uint120 itemsForSale) external nonpayable
```

!!! info Open a new auction for a specific slot.

#### Parameters

| Name         | Type    | Description                                            |
| ------------ | ------- | ------------------------------------------------------ |
| slot         | uint256 | The auction slot.                                      |
| itemsForSale | uint120 | The number of items available for sale in the auction. |

### operator

```solidity title="Solidity"
function operator() external view returns (address)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |

### owner

```solidity title="Solidity"
function owner() external view returns (address)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |

### packBid

```solidity title="Solidity"
function packBid(uint128 bidPrice, uint120 itemsToBuy, uint8 bidderId) external pure returns (uint256 packedBid)
```

!!! info Packed Bid details into a uint256 for submission.

#### Parameters

| Name       | Type    | Description                  |
| ---------- | ------- | ---------------------------- |
| bidPrice   | uint128 | Price per item.              |
| itemsToBuy | uint120 | Items to buy in the auction. |
| bidderId   | uint8   | Id for bidder                |

#### Returns

| Name      | Type    | Description            |
| --------- | ------- | ---------------------- |
| packedBid | uint256 | for auction submission |

### payout

```solidity title="Solidity"
function payout(uint256 slot) external nonpayable
```

!!! info Payout revenue from auction to validators

#### Parameters

| Name | Type    | Description       |
| ---- | ------- | ----------------- |
| slot | uint256 | The auction slot. |

### pendingOwner

```solidity title="Solidity"
function pendingOwner() external view returns (address)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | address | undefined   |

### refund

```solidity title="Solidity"
function refund(uint256 slot) external nonpayable
```

!!! info Refund revenue from auction to bidders

#### Parameters

| Name | Type    | Description       |
| ---- | ------- | ----------------- |
| slot | uint256 | The auction slot. |

### removeBidder

```solidity title="Solidity"
function removeBidder(uint8 bidderId) external nonpayable
```

!!! info Remove a bidder from the auction.

#### Parameters

| Name     | Type  | Description                            |
| -------- | ----- | -------------------------------------- |
| bidderId | uint8 | The index of the bidder to be removed. |

### runAndSettle

```solidity title="Solidity"
function runAndSettle(uint256 slot) external nonpayable
```

!!! info Execute the auction for a specific slot.

#### Parameters

| Name | Type    | Description       |
| ---- | ------- | ----------------- |
| slot | uint256 | The auction slot. |

### setOperator

```solidity title="Solidity"
function setOperator(address operator, bool approved) external nonpayable returns (bool)
```

#### Parameters

| Name     | Type    | Description |
| -------- | ------- | ----------- |
| operator | address | undefined   |
| approved | bool    | undefined   |

#### Returns

| Name | Type | Description |
| ---- | ---- | ----------- |
| \_0  | bool | undefined   |

### slotsAuctioned

```solidity title="Solidity"
function slotsAuctioned(uint256 index) external view returns (uint256 slot)
```

#### Parameters

| Name  | Type    | Description |
| ----- | ------- | ----------- |
| index | uint256 | undefined   |

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

### slotsCount

```solidity title="Solidity"
function slotsCount() external view returns (uint256)
```

#### Returns

| Name | Type    | Description |
| ---- | ------- | ----------- |
| \_0  | uint256 | undefined   |

### supportsInterface

```solidity title="Solidity"
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```

#### Parameters

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| interfaceId | bytes4 | undefined   |

#### Returns

| Name | Type | Description |
| ---- | ---- | ----------- |
| \_0  | bool | undefined   |

### transfer

```solidity title="Solidity"
function transfer(address receiver, uint256 id, uint256 amount) external nonpayable returns (bool)
```

#### Parameters

| Name     | Type    | Description |
| -------- | ------- | ----------- |
| receiver | address | undefined   |
| id       | uint256 | undefined   |
| amount   | uint256 | undefined   |

#### Returns

| Name | Type | Description |
| ---- | ---- | ----------- |
| \_0  | bool | undefined   |

### transferFrom

```solidity title="Solidity"
function transferFrom(address sender, address receiver, uint256 id, uint256 amount) external nonpayable returns (bool)
```

#### Parameters

| Name     | Type    | Description |
| -------- | ------- | ----------- |
| sender   | address | undefined   |
| receiver | address | undefined   |
| id       | uint256 | undefined   |
| amount   | uint256 | undefined   |

#### Returns

| Name | Type | Description |
| ---- | ---- | ----------- |
| \_0  | bool | undefined   |

### transferOwnership

```solidity title="Solidity"
function transferOwnership(address newOwner) external nonpayable
```

!!! info Starts the ownership transfer of the contract to a new account. Replaces the pending transfer if there is one.
Can only be called by the current owner.

#### Parameters

| Name     | Type    | Description |
| -------- | ------- | ----------- |
| newOwner | address | undefined   |

### updateAccountant

```solidity title="Solidity"
function updateAccountant(address newAccountant) external nonpayable
```

!!! info update accountant address

#### Parameters

| Name          | Type    | Description |
| ------------- | ------- | ----------- |
| newAccountant | address | undefined   |

### updateMaxBids

```solidity title="Solidity"
function updateMaxBids(uint256 newMaxBids) external nonpayable
```

!!! info update max num of bids per bidder

#### Parameters

| Name       | Type    | Description |
| ---------- | ------- | ----------- |
| newMaxBids | uint256 | undefined   |

### updateMinGasAmount

```solidity title="Solidity"
function updateMinGasAmount(uint120 newAmount) external nonpayable
```

!!! info update minGasAmount

#### Parameters

| Name      | Type    | Description |
| --------- | ------- | ----------- |
| newAmount | uint120 | undefined   |

## Events

### Approval

```solidity title="Solidity"
event Approval(address indexed owner, address indexed spender, uint256 indexed id, uint256 amount)
```

#### Parameters

| Name              | Type    | Description |
| ----------------- | ------- | ----------- |
| owner `indexed`   | address | undefined   |
| spender `indexed` | address | undefined   |
| id `indexed`      | uint256 | undefined   |
| amount            | uint256 | undefined   |

### AuctionOpened

```solidity title="Solidity"
event AuctionOpened(uint256 indexed slot, uint120 itemsForSale)
```

#### Parameters

| Name           | Type    | Description |
| -------------- | ------- | ----------- |
| slot `indexed` | uint256 | undefined   |
| itemsForSale   | uint120 | undefined   |

### AuctionPaidOut

```solidity title="Solidity"
event AuctionPaidOut(uint256 indexed slot)
```

#### Parameters

| Name           | Type    | Description |
| -------------- | ------- | ----------- |
| slot `indexed` | uint256 | undefined   |

### AuctionRefund

```solidity title="Solidity"
event AuctionRefund(uint256 indexed slot)
```

#### Parameters

| Name           | Type    | Description |
| -------------- | ------- | ----------- |
| slot `indexed` | uint256 | undefined   |

### AuctionSettled

```solidity title="Solidity"
event AuctionSettled(uint256 indexed slot)
```

#### Parameters

| Name           | Type    | Description |
| -------------- | ------- | ----------- |
| slot `indexed` | uint256 | undefined   |

### BidderAdded

```solidity title="Solidity"
event BidderAdded(address indexed bidder, uint8 indexed bidderId)
```

#### Parameters

| Name               | Type    | Description |
| ------------------ | ------- | ----------- |
| bidder `indexed`   | address | undefined   |
| bidderId `indexed` | uint8   | undefined   |

### BidderRemoved

```solidity title="Solidity"
event BidderRemoved(address indexed bidder, uint8 indexed bidderId)
```

#### Parameters

| Name               | Type    | Description |
| ------------------ | ------- | ----------- |
| bidder `indexed`   | address | undefined   |
| bidderId `indexed` | uint8   | undefined   |

### OperatorSet

```solidity title="Solidity"
event OperatorSet(address indexed owner, address indexed operator, bool approved)
```

#### Parameters

| Name               | Type    | Description |
| ------------------ | ------- | ----------- |
| owner `indexed`    | address | undefined   |
| operator `indexed` | address | undefined   |
| approved           | bool    | undefined   |

### OperatorUpdated

```solidity title="Solidity"
event OperatorUpdated(address indexed oldOperator, address indexed newOperator)
```

#### Parameters

| Name                  | Type    | Description |
| --------------------- | ------- | ----------- |
| oldOperator `indexed` | address | undefined   |
| newOperator `indexed` | address | undefined   |

### OwnershipTransferStarted

```solidity title="Solidity"
event OwnershipTransferStarted(address indexed previousOwner, address indexed newOwner)
```

#### Parameters

| Name                    | Type    | Description |
| ----------------------- | ------- | ----------- |
| previousOwner `indexed` | address | undefined   |
| newOwner `indexed`      | address | undefined   |

### OwnershipTransferred

```solidity title="Solidity"
event OwnershipTransferred(address indexed user, address indexed newOwner)
```

#### Parameters

| Name               | Type    | Description |
| ------------------ | ------- | ----------- |
| user `indexed`     | address | undefined   |
| newOwner `indexed` | address | undefined   |

### Transfer

```solidity title="Solidity"
event Transfer(address caller, address indexed from, address indexed to, uint256 indexed id, uint256 amount)
```

#### Parameters

| Name           | Type    | Description |
| -------------- | ------- | ----------- |
| caller         | address | undefined   |
| from `indexed` | address | undefined   |
| to `indexed`   | address | undefined   |
| id `indexed`   | uint256 | undefined   |
| amount         | uint256 | undefined   |

## Errors

### AuctionAlreadyOpen

```solidity title="Solidity"
error AuctionAlreadyOpen(uint256 slot)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

### AuctionAlreadySettled

```solidity title="Solidity"
error AuctionAlreadySettled(uint256 slot)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

### AuctionNotClosed

```solidity title="Solidity"
error AuctionNotClosed(uint256 slot)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

### AuctionNotOpen

```solidity title="Solidity"
error AuctionNotOpen(uint256 slot)
```

#### Parameters

| Name | Type    | Description |
| ---- | ------- | ----------- |
| slot | uint256 | undefined   |

### BidderAlreadyExists

```solidity title="Solidity"
error BidderAlreadyExists(address bidder)
```

#### Parameters

| Name   | Type    | Description |
| ------ | ------- | ----------- |
| bidder | address | undefined   |

### BidderNotRegistered

```solidity title="Solidity"
error BidderNotRegistered(address bidder)
```

#### Parameters

| Name   | Type    | Description |
| ------ | ------- | ----------- |
| bidder | address | undefined   |

### InsufficientFunds

```solidity title="Solidity"
error InsufficientFunds()
```

### InvalidBidItems

```solidity title="Solidity"
error InvalidBidItems()
```

### InvalidId

```solidity title="Solidity"
error InvalidId()
```

### Unauthorized

```solidity title="Solidity"
error Unauthorized()
```
