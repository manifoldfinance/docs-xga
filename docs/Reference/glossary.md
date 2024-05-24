---
title: Glossary
---

### Platform Terms

| Term                                 | Description                                                                                                                                       |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Auctioneer Contract                  | A smart contract designed for auctioning Ethereum block space, enabling dynamic participation and settlement.                                     |
| ERC6909 Standard                     | A specification for managing auction-related functionalities within smart contracts.                                                              |
| SafeTransferLib                      | A library ensuring the safe transfer of WETH (Wrapped Ether) within smart contract operations.                                                    |
| Bidders                              | Entities that participate in auctions by submitting bids for block space.                                                                         |
| Manual Bids                          | Bids placed by bidders manually for specific quantities and prices in an auction.                                                                 |
| Settlement                           | The process of concluding an auction, involving transferring owed amounts to successful bidders.                                                  |
| SDK (Software Development Kit)       | Tools and libraries provided to developers for building applications on a specific platform.                                                      |
| Testnet                              | A testing network where developers can deploy and test their applications in a simulated environment without using real assets.                   |
| Direct Payment Method                | A straightforward payment approach where transaction fees are paid directly by the transactions included in a block.                              |
| Coinbase Transfer Payment Method     | A method where transaction fees and rewards are transferred to the block proposer's address via the coinbase transaction.                         |
| Indirect Address Payment Method      | A payment method involving the use of a different address by the builder to pay the proposer through an end-of-block transaction.                 |
| Intermediate Transfer Payment Method | A two-step payment process involving an intermediary address for transferring payments to the proposer.                                           |
| Smart Contract-Based Payment Method  | Payment processing through a smart contract, allowing for programmable distributions based on predefined rules.                                   |
| Off-Chain Payment Method             | Payments made outside the blockchain network, possibly through other cryptocurrencies or banking systems.                                         |
| Validator                            | A network participant responsible for validating transactions and blocks on the Ethereum blockchain.                                              |
| MEV (Miner Extractable Value)        | Value extracted by miners (or validators) through their ability to include, exclude, or reorder transactions within blocks.                       |
| Slashing                             | A penalty mechanism where a validator's stake is reduced due to malicious actions or failure to comply with network rules.                        |
| Primary Market                       | The initial auction market where block space is auctioned to bidders.                                                                             |
| Secondary Market                     | A market that operates after the primary allocation, allowing for reallocation and adjustment based on new information.                           |
| Uniform Price Auction                | An auction format where all winning bidders pay the same price.                                                                                   |
| Discriminatory Price Auction         | An auction format where winning bidders pay according to their bid prices.                                                                        |
| Augmented Uniform Price Auction      | A modified uniform price auction designed to address underpricing by introducing features like elastic supply and alternative tie-breaking rules. |
| WETH (Wrapped Ether)                 | A token that represents Ether 1:1, allowing for easier integration with ERC-20 compatible services.                                               |
| Gas                                  | A measure of computational effort required to execute operations on the Ethereum network.                                                         |
| Gas Price                            | The cost per unit of gas, paid by users to compensate for the computational energy required to process and validate transactions.                 |
| Gwei                                 | A denomination of Ether, where 1 Gwei equals 10^-9 ETH.                                                                                           |
| Block Proposal                       | The process by which validators or miners propose a set of transactions to be included in a new block.                                            |
| Staking                              | The act of locking up cryptocurrency holdings to support the operation of a blockchain network, often in exchange for rewards.                    |
| Epoch                                | A division of time used in blockchain networks, referring to a set period during which certain processes or updates occur.                        |
