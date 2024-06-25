---
title: Walkthrough Tutorial
description: Developer Walkthrough guide for end to end information for builders, searchers and integrators.
---

!!! info

    GitHub Repo can be found here: [github.com/manifoldfinance/xga-sdk-v0](https://github.com/manifoldfinance/xga-sdk-v0)

## Getting Started

SDK for XGA bidders and users. This guide provides information on how to interact with the auction contracts and the L2
RPC endpoints. The codebase can be found here to follow along:
[github.com/manifoldfinance/xga-sdk-v0](https://github.com/manifoldfinance/xga-sdk-v0)

**Bidders**

-   Auction bidders can provide custom strategies either from an offchain bot or a contract.
-   [OpenBidder contract is a full working example](https://github.com/manifoldfinance/xga-open-bidder-contracts)
-   New bidders must be registered with the protocol. Please contact
    [sam@manifoldfinance.com](mailto:sam@manifoldfinance.com) for registration or reachout to us via this form

**Users**

-   Private transactions and bundles can be passed to beta blocks through the deployed
    [OpenBidder](https://github.com/manifoldfinance/xga-open-bidder-contracts).
-   Beta transactions can be constructed and submitted with provided
    [`cast`](https://github.com/manifoldfinance/xga-open-bidder-contracts/blob/main/script/OpenBidder.s.sol/) or
    [`python`](./sign-eth-tx-py/) libs.

### Convenience Setup

> Environment vars

Copy [`.env.example`](.env.example) to `.env` and change as necessary. Holesky Testnet and mainnet details have been
provided.

### Beta Transactions

**`MaxFeePerGas` = 0** An important difference with beta block transactions is that the `MaxFeePerGas` is set to zero.
Instead this fee is set for the L2 bid.

### Construct and sign a beta transaction

Make sure to setup env vars before signing txs.

#### Cast

Using Foundry's `cast`:

```bash
#!/usr/bin/env bash
# Script to sign a tx given details

# Expect env vars TX_TO, TX_SIG, TX_ARGS, TX_VALUE, PRIVATE_KEY, RPC_L1
# shellcheck source=/dev/null
set -o allexport; source .env; set +o allexport

# Ensure required environment variables are set
REQUIRED_VARS=(TX_TO TX_SIG TX_ARGS TX_VALUE PRIVATE_KEY RPC_L1)
for VAR in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!VAR}" ]; then
    echo "Error: $VAR is not set."
    exit 1
  fi
done

# Get current base fee
echo "Getting current base fee"
BASE_FEE=$(cast base-fee --rpc-url "$RPC_L1" latest)
if [ -z "$BASE_FEE" ]; then
  echo "Error: Failed to get base fee."
  exit 1
fi

# Sign TX
echo "Signing tx"
TX=$(cast mktx --rpc-url "$RPC_L1" --private-key "$PRIVATE_KEY" "$TX_TO" "$TX_SIG" "${TX_ARGS[*]}" --value "$TX_VALUE" --priority-gas-price 0 --gas-price $((2 * BASE_FEE)))
if [ -z "$TX" ]; then
  echo "Error: Failed to sign transaction."
  exit 1
fi
echo "$TX"

# Estimate gas
echo "Estimating gas"
AMOUNT_OF_GAS=$(cast estimate --rpc-url "$RPC_L1" "$TX_TO" "$TX_SIG" "${TX_ARGS[*]}" --value "$TX_VALUE")
if [ -z "$AMOUNT_OF_GAS" ]; then
  echo "Error: Failed to estimate gas."
  exit 1
fi
echo "$AMOUNT_OF_GAS"
```

#### Python

Using python:

```bash
poetry run python sign-eth-tx-py/sign.py <contract> <value> <function_sig> <args>
```

## Bridge

Before bidding, you will need to bridge ETH to L2 for bids.

```bash
# Fund L2 address by sending ETH to the bridge address.
cast send -i $L1_BRIDGE --value 0.01ether --rpc-url $L1_RPC_URL --private-key $PRIVATE_KEY

# Confirming the bridged Holesky ETH on L2
cast balance $WALLET_ADDRESS --rpc-url $L2_RPC_URL
```

### Using OpenBidder

Make sure to setup env vars before using open bidder, including `WEI_PER_GAS`. Scripts are provided for submitting a
private transaction to OpenBidder.

Using cast:

```sh
./open-bidder-contracts/script/sign-submit-tx.sh
```

Using python:

```sh
poetry run beta_bundles_py/main.py
```

## RPC Endpoints

-   **L2 RPC:**

    -   Description: L2 Node RPC
    -   URL: [https://xga-api.securerpc.com/v1](https://xga-api.securerpc.com/v1)
    -   Methods: eth\_\*
    -   ChainId: 7890785

-   **Beta bundle RPC:**

    -   Description: Beta bundle submission RPC
    -   URL: [https://mainnet-auction.securerpc.com/](https://mainnet-auction.securerpc.com/)
    -   Method: mev_sendBetaBundle
    -   Parameters:
        -   `txs`: List of txs as bundle e.g. [0x2323...,]
        -   `slot`: slot number e.g. "11282389"
    -   ChainId: 1

-   **L2 RPC (Holesky Testnet):**

    -   Description: L2 Node RPC (Holesky Testnet)
    -   URL: [https://holesky-op.xga.com/v1](https://holesky-op.xga.com/v1)
    -   Methods: eth\_\*
    -   ChainId: 42169

-   **Beta bundle RPC (Holesky Testnet):**
    -   Description: Beta bundle submission RPC
    -   URL: [https://holesky-rpc.xga.com/v1](https://holesky-rpc.xga.com/v1)
    -   Method: mev_sendBetaBundle
    -   Parameters:
        -   `txs`: List of txs as bundle e.g. [0x2323...,]
        -   `slot`: slot number e.g. "11282389"
    -   ChainId: 17000

### Bundle JSON Requests and Responses

#### Example JSON request

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

#### Example JSON response

```jsonc
{
	"jsonrpc": "2.0",
	"id": 1,
	"method": "mev_sendBetaBundle",
	"result": "0x79e5cba7876f532218ac35a357209800be2362dd2e3f1e6dc5974698f0d7cee4",
}
```

## Contracts Addresses

### L1 Addresses

| Contract                           | Address                                                                                                                       |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| L1StandardBridge                   | [0x490B959870889D5FA0B329431683B8B3e850DD95](https://etherscan.io/address/0x490B959870889D5FA0B329431683B8B3e850DD95)         |
| L1StandardBridge (Holesky Testnet) | [0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C](https://holesky.etherscan.io/address/0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C) |

### L2 Addresses

| Contract                          | Address                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| WETH                              | [0x4200000000000000000000000000000000000006](https://holesky-blockscout.securerpc.com/address/0x4200000000000000000000000000000000000006) |
| Auctioneer                        | [0x86Bc75A43704E38f0FD94BdA423C50071fE17c99](https://xga-blockscout.securerpc.com/address/0x86Bc75A43704E38f0FD94BdA423C50071fE17c99)     |
| SettlementHouse                   | [0x80C5FfF824d14c87C799D6F90b7D8e0a715bd33C](https://xga-blockscout.securerpc.com/address/0x80C5FfF824d14c87C799D6F90b7D8e0a715bd33C)     |
| Accountant                        | [0xE9B82BD9e839f1087d4017b4F7E928E0CADB2AF9](https://xga-blockscout.securerpc.com/address/0xE9B82BD9e839f1087d4017b4F7E928E0CADB2AF9)     |
| Auctioneer (Holesky Testnet)      | [0x82052435119AedBEC6e237B5414880bF388F1B63](https://holesky-blockscout.securerpc.com/address/0x82052435119AedBEC6e237B5414880bF388F1B63) |
| SettlementHouse (Holesky Testnet) | [0x513844F4425d54beC19B0594AE072e49bEbBF388](https://holesky-blockscout.securerpc.com/address/0x513844F4425d54beC19B0594AE072e49bEbBF388) |
| Accountant (Holesky Testnet)      | [0x4641748a26D6fca7C11B0366C443dc83d6eb6Be1](https://holesky-blockscout.securerpc.com/address/0x4641748a26D6fca7C11B0366C443dc83d6eb6Be1) |

## Bidding

**Only registered bidders can participate in the auction. Operators can onboard new bidders through the contract. Please
contact Mev Protocol to proceed.**

The following code snippet uses [Foundry](https://book.getfoundry.sh/getting-started/installation) as example.

### Manual bidding

#### Wrap ETH for bidding

```bash
cast send $WETH "deposit()" --value 1000gwei --private-key $PRIVATE_KEY --rpc-url $L2_RPC_URL

# allow Auctioneer to spend WETH
cast send $WETH "approve(address,uint256)" $AUCTIONEER $(cast max-uint) --private-key $PRIVATE_KEY --rpc-url $L2_RPC_URL
```

#### Get slot number of open auctions

```bash
cast call $AUCTIONEER "getOpenAuctions()" --rpc-url $L2_RPC_URL
```

#### Place a bid

To check for bidderId when registered, call `IdMap` on the contract:

```solidity
function IdMap(address bidder) external view returns (uint8 id);
```

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

For example:

```bash
# Packing a bid for 21,000 gas and 0.01 gwei per gas
cast call $AUCTIONEER \
    "packBid(uint128,uint120,uint8)" 0.01gwei 21000 $(cast call $AUCTIONEER "IdMap(address)" $WALLET_ADDRESS --rpc-url $L2_RPC_URL) \
  --rpc-url $L2_RPC_URL

# Placing a bid
cast send $AUCTIONEER \
  "bid(uint256,uint256[] memory)" SLOT_NUMBER ["0x...(Packed Bid)"] \
  --private-key $PRIVATE_KEY \
  --rpc-url $L2_RPC_URL
```

#### Winning bid info

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

```bash
cast call $AUCTIONEER \
  "getBidderInfo(uint256,address)" SLOT_NUMBER $WALLET_ADDRESS \
  --rpc-url $L2_RPC_URL
```

### Contract bidding

Bidder contract requirements:

-   Sufficient WETH balance and approval
-   Registered by operator
-   Implement `Bidder` interface

A minimal viable bidder is provided below, this contract will bid for every opened auctions:

```solidity
/// SPDX-License-Identifier: UPL-1.0
pragma solidity ^0.8.25;

import {WETH} from "solmate/tokens/WETH.sol";
import {ERC6909} from "solmate/tokens/ERC6909.sol";

interface Bidder {
    /**
     * @dev Get the bid from a bidder for a specific slot and round.
     * @param slot The auction slot.
     * @return packedBids Array of bids (in a packed format). uint256(uint128(bidPrice),uint120(itemsToBuy),uint8(bidderId))
     */
    function getBid(uint256 slot) external view returns (uint256[] memory packedBids);
}

interface SettlementHouse {
    function submitBundle(uint256 slot, uint256 amount, bytes32[] calldata hashes) external;
}

/// @title MockBidder
contract MockBidder is Bidder {
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

### Send Tx and Bundles

#### Check gas token balance for the slot

```bash
cast call $AUCTIONEER \
  "balanceOf(address,uint256)" $WALLET_ADDRESS SLOT_NUMBER \
  --rpc-url $L2_RPC_URL
```

#### Build and sign transaction on L1

-   Priority fee **MUST** be **ZERO**
-   RPC URL should be L1
-   Return signed transaction

```bash
# trasnfer 0.01 ether to self
cast mktx $WALLET_ADDRESS \
  --value 0.01ether \
  --priority-gas-price 0 \
  --private-key $PRIVATE_KEY \
  --rpc-url $L1_RPC_URL
```

#### Submit Tx to Beta Bundle RPC

Use the `mev_sendBetaBundle` method to send the bundle to L1 RPC. The bundle will be stored in L1 RPC, and L1 RPC will
return the `bundle hash`.

```bash
curl -X POST \
  -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","id":1,"method":"mev_sendBetaBundle","params":[{"slot": "SLOT_NUMBER","txs":["0x..SIGNED TX"]}]}' \
  $BETA_BUNDLE_RPC
```

#### Pay gas token for the bundle on L2

```solidity
/*
 * @dev Function to submit a bundle of transactions.
 * @param slot The slot of the futures token being deposited
 * @param amountOfGas Amount of futures tokens to deposit
 * @param bundleHashes List of bundle hashes
 */
function submitBundle(uint256 slot, uint256 amountOfGas, bytes32[] calldata bundleHashes) external
```

Submit the `bundle hash` to `SettlementHouse`. During this process, the `submitBundle` in `SettlementHouse` will check
and burn future Gas tokens.

```bash
cast send $SETTLEMENT_HOUSE \
  "submitBundle(uint256,uint256,bytes32[])" SLOT_NUMBER GAS_TOKEN_AMOUNT ["0x..BUNDLE_HASH"] \
  --private-key $PRIVATE_KEY \
  --rpc-url $L2_RPC_URL
```

The block builder will query the bundle hash in the `SettlementHouse` contract. If a bundle in the bundle pool is in the
`SettlementHouse` contract, it will be included in the beta block by the block builder.
