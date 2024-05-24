---
title: Primary Market Interface
description: Primary Market Auction and Settlement contract interface
---

# Summary Interfaces

-   [Auctioneer](#auctioneer-interface)
-   [Settlement](#settlementhouse-interface)
-   [Bidder](#bidder-interface)

# Auctioneer Interface

[Git Source](https://github.com/manifoldfinance/open-bidder-contracts/blob/main/src/interfaces/IAuctioneer.sol)

**Inherits:** ERC6909, Ownable2Step

_Implements an auction mechanism for selling block space._

## Structs

### Auction

```solidity
struct Auction {
    uint120 itemsForSale;
    bool isOpen;
    bool isSettled;
    bool isPaidOut;
    bool isRefunded;
    mapping(address => BidderInfo) biddersInfo;
}
```

### BidderInfo

```solidity
struct BidderInfo {
    uint120 itemsBought;
    uint128 amountOwed;
}
```

## State Variables

### maxBidder

```solidity
uint8 public maxBidder;
```

### WETH9

```solidity
WETH public immutable WETH9;
```

### accountant

```solidity
address public accountant;
```

### maxBids

```solidity
uint256 public maxBids = 50;
```

### minGasAmount

```solidity
uint120 public minGasAmount = 20000;
```

### operator

```solidity
address public operator;
```

### IdMap

```solidity
mapping(address bidder => uint8 id) public IdMap;
```

### bidderMap

```solidity
mapping(uint8 id => address bidder) public bidderMap;
```

### auctions

```solidity
mapping(uint256 slot => Auction) public auctions;
```

### slotsCount

```solidity
uint256 public slotsCount;
```

### slotsAuctioned

```solidity
mapping(uint256 index => uint256 slot) public slotsAuctioned;
```

### bidCount

```solidity
mapping(uint256 slot => uint256 count) public bidCount;
```

## Functions

### bid

_Bid function for bidders to submit manual bids._

```solidity
function bid(uint256 slot, uint256[] memory packedBids) external;
```

**Parameters**

| Name         | Type        | Description          |
| ------------ | ----------- | -------------------- |
| `slot`       | `uint256`   | The auction slot.    |
| `packedBids` | `uint256[]` | Array of packed bids |

### getBidderInfo

_Retrieve information about a bidder after auction settlement._

```solidity
function getBidderInfo(uint256 slot, address bidder) external view returns (uint120 itemsBought, uint128 amountOwed);
```

**Parameters**

| Name     | Type      | Description                                                  |
| -------- | --------- | ------------------------------------------------------------ |
| `slot`   | `uint256` | The slot identifier of the auction.                          |
| `bidder` | `address` | The address of the bidder for whom information is requested. |

**Returns**

| Name          | Type      | Description                                                                                                                                                                                                          |
| ------------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `itemsBought` | `uint120` | The number of items bought by the bidder in the specified auction.                                                                                                                                                   |
| `amountOwed`  | `uint128` | The amount owed by the bidder for the items bought in the specified auction. Requirements: - The auction must have been settled. - The provided `bidder` address must be valid and have participated in the auction. |

### packBid

_Packed Bid details into a uint256 for submission._

```solidity
function packBid(uint128 bidPrice, uint120 itemsToBuy, uint8 bidderId) external pure returns (uint256 packedBid);
```

**Parameters**

| Name         | Type      | Description                  |
| ------------ | --------- | ---------------------------- |
| `bidPrice`   | `uint128` | Price per item.              |
| `itemsToBuy` | `uint120` | Items to buy in the auction. |
| `bidderId`   | `uint8`   | Id for bidder                |

**Returns**

| Name        | Type      | Description            |
| ----------- | --------- | ---------------------- |
| `packedBid` | `uint256` | for auction submission |

### calcAverageBid

_Calculate average bid price for the last n auctions_

```solidity
function calcAverageBid(uint256 numAuctions) external view returns (uint128 avBidPrice);
```

**Parameters**

| Name          | Type      | Description                       |
| ------------- | --------- | --------------------------------- |
| `numAuctions` | `uint256` | Number of auctions to average for |

**Returns**

| Name         | Type      | Description         |
| ------------ | --------- | ------------------- |
| `avBidPrice` | `uint128` | for last n auctions |

## Events

### AuctionSettled

```solidity
event AuctionSettled(uint256 indexed slot);
```

### BidderAdded

```solidity
event BidderAdded(address indexed bidder, uint8 indexed bidderId);
```

### BidderRemoved

```solidity
event BidderRemoved(address indexed bidder, uint8 indexed bidderId);
```

### AuctionOpened

```solidity
event AuctionOpened(uint256 indexed slot, uint120 itemsForSale);
```

### AuctionPaidOut

```solidity
event AuctionPaidOut(uint256 indexed slot);
```

### AuctionRefund

```solidity
event AuctionRefund(uint256 indexed slot);
```

## Errors

### InvalidId

```solidity
error InvalidId();
```

### Unauthorized

```solidity
error Unauthorized();
```

### InvalidBidItems

```solidity
error InvalidBidItems();
```

### InsufficientFunds

```solidity
error InsufficientFunds();
```

### AuctionNotOpen

```solidity
error AuctionNotOpen(uint256 slot);
```

### AuctionNotClosed

```solidity
error AuctionNotClosed(uint256 slot);
```

### AuctionAlreadyOpen

```solidity
error AuctionAlreadyOpen(uint256 slot);
```

### AuctionAlreadySettled

```solidity
error AuctionAlreadySettled(uint256 slot);
```

### BidderNotRegistered

```solidity
error BidderNotRegistered(address bidder);
```

### BidderAlreadyExists

```solidity
error BidderAlreadyExists(address bidder);
```

# SettlementHouse Interface

[Git Source](https://github.com/manifoldfinance/open-bidder-contracts/blob/main/src/interfaces/ISettlement.sol)

_A contract for managing bundles of transactions for a futures token._

## Structs

### Bundle

```solidity
struct Bundle {
    address submitter;
    uint256 amountOfGas;
    bytes32[] bundleHashes;
}
```

## State Variables

### futuresToken

```solidity
IERC6909 public immutable futuresToken;
```

## Functions

### submitBundle

```solidity
function submitBundle(uint256 slot, uint256 amountOfGas, bytes32[] calldata bundleHashes) external;
```

# Bidder Interface

[Git Source](https://github.com/manifoldfinance/open-bidder-contracts/blob/main/src/interfaces/IBidder.sol)

## Functions

### getBid

_Get the bid from a bidder for a specific slot and round._

```solidity
function getBid(uint256 slot) external view returns (uint256[] memory packedBids);
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

**Returns**

| Name         | Type        | Description                                                                                        |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------- |
| `packedBids` | `uint256[]` | Array of bids (in a packed format). uint256(uint128(bidPrice),uint120(itemsToBuy),uint8(bidderId)) |
