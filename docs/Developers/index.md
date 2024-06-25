---
title: Developer overview
description: Developer related information for builders, searchers and intergrators.
---

!!! important

    [Check the Walkthrough Guide for an end to end tutorial](./walkthrough.md)

## General

-   [SDK](./sdk.md)

-   [Mainnet](./mainnet.md)

-   [Holesky Testnet](./testnet.md)

## Auction Contracts v1.0

-   [Interface](./interface.md)

### Builder and Searcher specific

[Requirements](./builders.md)

[Payment Methods](./payment-methods.md)

## RPC Endpoints

Holesky:
https://holesky-eth.xga.com/ - Relay    
https://holesky-op.xga.com/v1 - L2 RPC    
https://holesky-rpc.xga.com/v1 - L1 RPC    
https://holesky-dashboard.xga.com/ - Auction dashboard   

Mainnet:
https://eth.xga.com/ - Relay    
https://op.xga.com/v1 - L2 RPC   
https://rpc.xga.com/v1 - L1 RPC   
https://dashboard.xga.com - Auction dashboard   

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
