---
title: Relay
---

# ValidatorRegistration

## Properties

| Name              | Type       | Description                             | Notes             |
| ----------------- | ---------- | --------------------------------------- | ----------------- |
| **fee_recipient** | **String** | Address to receive fees from the block. | [default to null] |
| **gas_limit**     | **String** | Preferred gas limit of validator.       | [default to null] |
| **timestamp**     | **String** | Unix timestamp of registration.         | [default to null] |
| **pubkey**        | **String** | BLS public key of validator.            | [default to null] |

# ValidatorsResponseEntry

## Properties

| Name                | Type                                            | Description | Notes                        |
| ------------------- | ----------------------------------------------- | ----------- | ---------------------------- |
| **slot**            | **String**                                      |             | [optional] [default to null] |
| **validator_index** | **String**                                      |             | [optional] [default to null] |
| **entry**           | [**getValidators_200_response_inner_entry**](#) |             | [optional] [default to null] |
