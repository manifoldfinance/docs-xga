---
title: Builder and Searcher payment methods
description: Classification of variouus payment methods
tags: ["primary market", "validators", "builders", "searchers", "payment"]
---

# Classification of Payment Methods in Ethereum Block Building

To further classify the payment methods, we can consider the broader context of Ethereum block building, including both traditional and MEV-Auction scenarios as it relates to payment mechanisms.

> This classification covers a range of payment methods from the simplest direct payments to more complex arrangements involving smart contracts and off-chain agreements.


| **Payment Method**                      | **Use Case**                                                                                          | **Traditional Scenario** | **MEV Auction Scenario** |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------|--------------------------|--------------------------|
| Direct Payment Method                   | Commonly used in standard Ethereum block building.                                                     | Yes                      | No                       |
| Coinbase Transfer Payment Method        | Utilized in both traditional and MEV-Auction scenarios.                                                | Yes                      | Yes                      |
| Indirect Address Payment (IAP) Method   | Specific to MEV-Auction, where builders and proposers are distinct entities.                           | No                       | Yes                      |
| Intermediate Transfer Payment (ITP) Methods | Specific to MEV-Auction, particularly when involving smart contracts or third-party addresses.         | No                       | Yes                      |
| Smart Contract-Based Payment Method     | Useful in decentralized block building scenarios or when complex payment distributions are required.    | Yes                      | Yes                      |
| Off-Chain Payment Method                | Might be used in private agreements between parties involved in block building.                         | Yes                      | Yes                      |

### Direct Payment Method

- **Description**: The most straightforward method where the block proposer (validator) receives the transaction fees directly from the transactions included in the block.
- **Use Case**: Commonly used in standard Ethereum block building.

### Coinbase Transfer Payment Method

- **Description**: In this method, the transaction fees and MEV rewards are transferred directly to the block proposer's address via the coinbase transaction.
- **Use Case**: Utilized in both traditional and MEV-Auction scenarios.

### Indirect Address Payment (IAP) Method

- **Description**: The builder uses a different address to pay the proposer through an end-of-block transaction, separate from the address receiving the block’s transaction fees.
- **Use Case**: Specific to MEV-Auction, where builders and proposers are distinct entities.

### Intermediate Transfer Payment (ITP) Methods

- **Description**: Involves a two-step process where the builder first transfers the payment to an intermediary address, which then sends it to the proposer.
- **Use Case**: Also specific to MEV-Auction, particularly when involving smart contracts or third-party addresses.

### Smart Contract-Based Payment Method

- **Description**: Payments are handled through a smart contract, which can programmatically distribute rewards based on predefined rules.
- **Use Case**: Useful in decentralized block building scenarios or when complex payment distributions are required.

### Off-Chain Payment Method

- **Description**: Payment occurs outside the Ethereum blockchain, possibly through other cryptocurrencies or traditional banking systems.
- **Use Case**: Might be used in private agreements between parties involved in block building.


## Builder Payment Methods

Builder payment patterns in the context of MEV payments to the validators

### Indirect Address Payment (IAP) Method

This method involves the builder using a different address to pay the proposer through an end-of-block transaction. In
this pattern, the builder first sets its own address to receive the block’s transaction fees and then employs a
different address to remunerate the proposer in the end-of-block transaction.

### Intermediate Transfer Payment (ITP) Method

In this method, the builder pays the proposer through an end-of-block transaction, initially transferring the amount to
an alternate address, which then initiates an internal transaction to send the funds to the proposer. This involves a
two-step process where the payment is first sent to an intermediary address (like a smart contract) before reaching the
proposer.
