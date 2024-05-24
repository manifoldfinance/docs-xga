---
title: Contract Protocol summary
---

## Primary Market

The **Auctioneer Contract** is a Solidity smart contract that implements an auction mechanism for selling block space.
This contract allows bidders to participate in auctions, submit manual bids, and settle the auctions. It supports
multiple bidders, each with a unique ID.

## Key Features

-   **Bidders:** Add and remove bidders dynamically.
-   **Auctions:** Open and run auctions for selling block space.
-   **Manual Bids:** Bidders can submit manual bids with specific quantities and prices.
-   **Settlement:** After the auction, settle with successful bidders, transferring owed amounts.

## Contract Structure

-   The contract is based on the ERC6909 standard.
-   It uses the SafeTransferLib for safe WETH (Wrapped Ether) transfers.
-   Bidders can participate through the `getBid` function.
-   Manual bids are supported via the `bid` function.

## Events

-   `BidderAdded` and `BidderRemoved` for dynamic management of bidders.
-   `AuctionOpened` signals the start of a new auction.
-   `ManualBidSubmitted` is emitted when a bidder submits a manual bid.
-   `AuctionSettled` indicates the successful settlement of an auction.

## Errors

-   Various error messages to handle exceptional cases, such as invalid bids or insufficient funds.

## Functions

-   **newBidder:** Add a new bidder to the auction.
-   **removeBidder:** Remove a bidder from the auction.
-   **openAuction:** Open a new auction for a specific slot.
-   **bid:** Submit a bid for a specific auction slot.
-   **run:** Execute the auction for a specific slot, considering manual and contract bids.
-   **settle:** Settle the auction by transferring owed amounts to successful bidders.
-   **getBidderInfo:** Retrieve information about a bidder after auction settlement.
-   **packBid:** Pack bid details into a uint256 for submission.
-   **decodeBid:** Decode packed bid information for analysis.
-   **checkBid:** Check the validity of a bid before execution.
