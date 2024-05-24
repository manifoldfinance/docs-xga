---
title: XGA L2 Mainnet
description: Mainnet information for node operators, validators, builders, and searchers.
---

-   [Live auction dashboard](https://mainnet-auction-dashboard.securerpc.com/)
-   [L2 Blockchain explorer](https://mainnet-blockscout.securerpc.com/)

## Node Operators

Please coordinate with us to register your validator set with our registry service. We will provide you with the
necessary information to get started.

## Validators

Connecting to the relay without being registered will result in your validator operating correctly so long as MEV Boost
is also running.

## Mainnet Information

-   **L2 RPC:**

    -   Description: L2 Node RPC
    -   URL: [https://xga-api.securerpc.com/v1](https://xga-api.securerpc.com/v1)
    -   Methods: eth\_\*
    -   ChainId: 7890785
    -   Limits: 300 req per minute per IP

-   **Beta bundle RPC:**
    -   Description: Beta bundle submission RPC
    -   URL: [https://mainnet-auction.securerpc.com/](https://mainnet-auction.securerpc.com/)
    -   Method: mev_sendBetaBundle
    -   Parameters:
        -   `txs`: List of txs as bundle e.g. [0x2323...,]
        -   `slot`: slot number e.g. "11282389"
    -   ChainId: 1

## Builders and searchers

Aquire some Holesky Testnet ETH through a faucet in the resources listed below. If you are unable to secure enough,
please reach out to us.

### Contracts

L2 _Auctioneer_: `0x86Bc75A43704E38f0FD94BdA423C50071fE17c99`

L2 _SettlementHouse_: `0x80C5FfF824d14c87C799D6F90b7D8e0a715bd33C`

_L1StandardBridgeProxy_: `0x490B959870889D5FA0B329431683B8B3e850DD95`

To monetize yourself on L2, send some ETH on L1 to `0x490B959870889D5FA0B329431683B8B3e850DD95`

### Resources

-   Block Explorers
    -   [etherscan.io](https://etherscan.io/)
    -   [beaconcha.in](https://beaconcha.in/)
