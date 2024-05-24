---
id: sdk
sidebar_position: 1
title: Auction SDK
---

XGA auction winners are granted future block space via a token, which is used with submission of transactions for
inclusion in the beta block. Budding bidders can register themselves with the protocol to participate in beta block
auctions. Thereupon custom implementations will be required to bid and submit transactions. Technical details are
provided herein.

Technical Overview:

-   [Bidding](#bidding):
    -   [Connect to L2 RPC](#l2-rpc)
    -   [Bridge eth to L2](#l1-bridge)
    -   [Understand auction contracts](#auction-contracts)
    -   [Deploy custom bidding strategy contract](#bidder-contracts)
-   [Submitting bundles](#submitting-bundles):
    -   [Beta Bundle RPC](#beta-bundle-rpc)
    -   [Bundle JSON Requests and Responses](#bundle-json-requests-and-responses)

Full working examples are available for:

-   [Zero latency open bidder contract](https://github.com/manifoldfinance/open-bidder-contracts/)
-   [Bundle submissions](https://github.com/MEV-Protocol/beta-bundles-py)

# Bidding

## L2 RPC

-   **L2 RPC:**

    -   Description: L2 Node RPC
    -   URL: [https://xga-api.securerpc.com/v1](https://xga-api.securerpc.com/v1)
    -   Methods: eth\_\*
    -   ChainId: 7890785

-   **L2 RPC (TESTNET):**

    -   Description: L2 Node RPC (Testnet)
    -   URL: [https://holesky-api.securerpc.com/l2](https://holesky-api.securerpc.com/l2/)
    -   Methods: eth\_\*
    -   ChainId: 42169

## L1 Bridge

Fund L2 address by sending ETH to the L1 bridge address.

### Deployed Address

```bash
L1_BRIDGE="0x490B959870889D5FA0B329431683B8B3e850DD95"
```

### Deployed Address (Testnet)

```bash
L1_BRIDGE="0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C"
```

## WETH

### Deployed Address (Mainnet and Testnet)

```bash
WETH="0x4200000000000000000000000000000000000006"
```

## Auction Contracts

### Deployed Addresses

```bash
AUCTIONEER="0x86Bc75A43704E38f0FD94BdA423C50071fE17c99"
SETTLEMENT="0x80C5FfF824d14c87C799D6F90b7D8e0a715bd33C"
```

### Deployed Addresses (Testnet)

```bash
AUCTIONEER="0xD88e271AD39dAb4DEB0f7f9475d993ed4Bf5029b"
SETTLEMENT="0x7Ac1A452B59114Fb1E67470720343A2e9AE18297"
```

### Registering a bidder

Only registered bidders can participate in the auction. Operators can onboard new bidders through the contract.

To check for bidderId when registered, call `IdMap` on the contract:

```solidity
function IdMap(address bidder) external view returns (uint8 id);
```

### Packing a bid

Bids are packed by price, amount, bidderId

```solidity
    /**
     * @dev Packed Bid details into a uint256 for submission.
     *
     * @param bidPrice Price per item.
     * @param itemsToBuy Items to buy in the auction.
     * @param bidderId Id for bidder
     * @return packedBid for auction submission
     */
    function packBid(uint256 bidPrice, uint256 itemsToBuy, uint256 bidderId)
        external
        pure
        returns (uint256 packedBid);
```

### Winning bid info

After an auction is closed, bidders can query their bid results:

```solidity
    /**
     * @dev Retrieve information about a bidder after auction settlement.
     *
     * @param slot The slot identifier of the auction.
     * @param bidder The address of the bidder for whom information is requested.
     * @return itemsBought The number of items bought by the bidder in the specified auction.
     * @return amountOwed The amount owed by the bidder for the items bought in the specified auction.
     *
     * Requirements:
     * - The auction must have been settled.
     * - The provided `bidder` address must be valid and have participated in the auction.
     *
     */
    function getBidderInfo(uint256 slot, address bidder)
        external
        view
        returns (uint120 itemsBought, uint128 amountOwed);
```

## Bidder Contracts

A minimal viable bidder is provided below.
[A more sophisticated fill or kill open bidder contract is provided](https://github.com/manifoldfinance/open-bidder-contracts/).

```solidity
/// SPDX-License-Identifier: UPL-1.0
pragma solidity ^0.8.25;

import {WETH} from "solmate/tokens/WETH.sol";
import {ERC6909} from "solmate/tokens/ERC6909.sol";

interface SettlementHouse {
    function submitBundle(uint256 slot, uint256 amount, bytes32[] calldata hashes) external;
}

/// @title MockBidder
contract MockBidder {
    uint256[] public bids;
    ERC6909 auctioneer;
    SettlementHouse house;
    WETH weth;

    constructor(WETH _weth, address _auctioneer, address settlement) {
        weth = _weth;
        auctioneer = ERC6909(_auctioneer);
        house = SettlementHouse(settlement);
        weth.approve(_auctioneer, type(uint256).max);
    }

    function setBids(uint256[] memory newBids) public {
        bids = newBids;
    }

    function getBid(uint256) external view returns (uint256[] memory packedBids) {
        return bids;
    }

    function submit(uint256 slot, uint256 amount, bytes32[] calldata hashes) external {
        auctioneer.approve(address(house), slot, amount);
        house.submitBundle(slot, amount, hashes);
    }
}
```

# Submitting bundles

## Beta Bundle RPC

-   **Beta bundle RPC:**

    -   Description: Beta bundle submission RPC
    -   URL: [https://mainnet-auction.securerpc.com/](https://mainnet-auction.securerpc.com/)
    -   Method: mev_sendBetaBundle
    -   Parameters:
        -   `txs`: List of txs as bundle e.g. [0x2323...,]
        -   `slot`: slot number e.g. "11282389"
    -   ChainId: 1

-   **Beta bundle RPC (Testnet):**
    -   Description: Beta bundle submission RPC
    -   URL: [https://holesky-api.securerpc.com/v2](https://holesky-api.securerpc.com/v2)
    -   Method: mev_sendBetaBundle
    -   Parameters:
        -   `txs`: List of txs as bundle e.g. [0x2323...,]
        -   `slot`: slot number e.g. "11282389"
    -   ChainId: 17000

## Bundle JSON Requests and Responses

### Example JSON request

```jsonc
{
    "jsonrpc": "2.0",
    "method": "mev_sendBetaBundle",
    "params": [
      {
        "txs": [0x... ],
        "slot": "1001"
      }
    ],
    "id": 8
}
```

### Example JSON response

```jsonc
{
	"jsonrpc": "2.0",
	"id": 1,
	"method": "mev_sendBetaBundle",
	"result": "0x79e5cba7876f532218ac35a357209800be2362dd2e3f1e6dc5974698f0d7cee4",
}
```

## Bundler Examples

-   [Python bundler](https://github.com/MEV-Protocol/beta-bundles-py) - employs a deployed bidder contract for
    continuous automated bidding, while listening for auction close event, then submits the bundle
