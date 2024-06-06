---
title: XGA L2 Testnet
description: Testing information for node operators, validators, builders, and searchers.
---

-   [Live auction dashboard](https://holesky-dashboard.xga.com/)
-   [L2 Blockchain explorer](https://holesky-blockscout.securerpc.com/)

## Node Operators

Please coordinate with us to register your validator set with our registry service. We will provide you with the
necessary information to get started.

## Validators

Connecting to the relay without being registered will result in your validator operating correctly so long as MEV Boost
is also running.

## Holesky Information

-   **L2 RPC (TESTNET):**

    -   Description: L2 Node RPC (Testnet)
    -   URL: [https://holesky-api.xga.com/v1](https://holesky-api.xga.com/v1)
    -   Methods: eth\_\*
    -   ChainId: 42169

-   **Beta bundle RPC (Testnet):**
    -   Description: Beta bundle submission RPC
    -   URL: [https://holesky-rpc.xga.com/v1](https://holesky-rpc.xga.com/v1)
    -   Method: mev_sendBetaBundle
    -   Parameters:
        -   `txs`: List of txs as bundle e.g. [0x2323...,]
        -   `slot`: slot number e.g. "11282389"
    -   ChainId: 17000

## Builders and searchers

Aquire some Holesky Testnet ETH through a faucet in the resources listed below. If you are unable to secure enough,
please reach out to us.

### Contracts

L2 _Auctioneer_: `0x82052435119AedBEC6e237B5414880bF388F1B63`

L2 _SettlementHouse_: `0x513844F4425d54beC19B0594AE072e49bEbBF388`

_L1StandardBridgeProxy_: `0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C`

To monetize yourself on L2, send some ETH on L1 (Holesky) to `0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C`

### Resources

-   Block Explorers
    -   [holesky.etherscan.io](https://holesky.etherscan.io/)
    -   [holesky.beaconcha.in](https://holesky.beaconcha.in/)
    -   [dora-holesky.pk910.de](https://dora-holesky.pk910.de/)
-   Ethstats: [ethstats.holesky.ethpandaops.io](https://ethstats.holesky.ethpandaops.io)
-   Faucets:
    -   [holesky-faucet.pk910.de](https://holesky-faucet.pk910.de/)
    -   [QuickNode Faucet](https://faucet.quicknode.com/ethereum/holesky)
    -   [Chainstack Faucet](https://faucet.chainstack.com/holesky-faucet)
    -   [Automata Holesky Faucet](https://holeskyfaucet.io)
