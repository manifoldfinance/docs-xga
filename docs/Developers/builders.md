---
title: Builder overview
description: Block Builder related information.
status: new
---

## Block Properties

Builders need the following data:

| Field          | Where it comes from                     | Notes                                            |
| -------------- | --------------------------------------- | ------------------------------------------------ |
| `feeRecipient` | validator (`builder_registerValidator`) | Address to receive fees from the block.          |
| `gasLimit`     | validator (`builder_registerValidator`) | preferred gas limit of validator                 |
| `timestamp`    | relay (BN)                              | value for the timestamp field of the new payload |
| `prevRandao`   | relay (BN)                              | from previous slot                               |
| `extraData`    | builder                                 | graffiti from builder, not proposer              |

## Builder Api

> All URIs are relative to _http://localhost:18550_

| Method                 | HTTP request                           | Description                                                                                              |
| ---------------------- | -------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| [**getValidators**](#) | **GET** `/relay/v1/builder/validators` | Get a list of validator registrations for validators scheduled to propose in the current and next epoch. |
| [**submitBlock**](#)   | **POST** `/relay/v1/builder/blocks`    | Submit a new block to the relay.                                                                         |

<a name="getValidators"></a>

## **getValidators**

> List `getValidators()`

Get a list of validator registrations for validators scheduled to propose in the current and next epoch.

-   Used by builders to know when to submit bids for an upcoming proposal.
-   Returns an array of validator registrations for the current and next epoch.
-   Each entry includes a slot and the validator with assigned duty.
-   Slots without a registered validator are omitted.

### Parameters

This endpoint does not need any parameter.

### Return type

[**List**](#)

| Name              | Type       | Description                             | Notes             |
| ----------------- | ---------- | --------------------------------------- | ----------------- |
| **fee_recipient** | **String** | Address to receive fees from the block. | [default to null] |
| **gas_limit**     | **String** | Preferred gas limit of validator.       | [default to null] |
| **timestamp**     | **String** | Unix timestamp of registration.         | [default to null] |
| **pubkey**        | **String** | BLS public key of validator.            | [default to null] |

### Authorization

No authorization required

### HTTP request headers

-   **Content-Type**: Not defined
-   **Accept**: application/json

<a name="submitBlock"></a>

## **submitBlock**

> submitBlock(submitBlock_request, cancellations)

Submit a new block to the relay.

-   Blocks can be submitted as JSON or SSZ, and optionally GZIP encoded. To be clear, there are four options: JSON,
    JSON+GZIP, SSZ, SSZ+GZIP. If JSON, the content type should be &#x60;application/json&#x60;. If SSZ, the content type
    should be &#x60;application/octet-stream&#x60;.
-   To enable GZIP compression for the request body, the HTTP content encoding should be &#x60;gzip&#x60;. Compression
    is optional.
-   The relay will simulate the block to verify properties and proposer payment in the payment transaction from builder
    to proposer &#x60;fee_recipient&#x60; at the end of block.
-   For accountability, builder signature is over the SSZ encoded &#x60;message&#x60;.
-   The &#x60;message&#x60;, which does not include the transactions, will be made public via the data API, allowing
    anyone to verify the builder signature.
-   Any new submission by a builder will overwrite a previous one by the same &#x60;builder_pubkey&#x60;, even if it is
    less profitable.

### Parameters

| Name                    | Type                                            | Description                              | Notes                        |
| ----------------------- | ----------------------------------------------- | ---------------------------------------- | ---------------------------- |
| **submitBlock_request** | [**submitBlock_request**](#submitBlock_request) | A signed bid with an execution payload.  |                              |
| **cancellations**       | **String**                                      | If set to 1, opt into bid cancellations. | [optional] [default to null] |

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

-   **Content-Type**: application/json, application/octet-stream
-   **Accept**: application/json

## submitBlock_request

## Properties

| Name                       | Type       | Description                                                                                                              | Notes                        |
| -------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------------------- |
| **slot**                   | **String** |                                                                                                                          | [optional] [default to null] |
| **parent_hash**            | **String** |                                                                                                                          | [optional] [default to null] |
| **block_hash**             | **String** |                                                                                                                          | [optional] [default to null] |
| **builder_pubkey**         | **String** | The validator&#39;s BLS public key, uniquely identifying them. _48-bytes, hex encoded with 0x prefix, case insensitive._ | [optional] [default to null] |
| **proposer_pubkey**        | **String** | The validator&#39;s BLS public key, uniquely identifying them. _48-bytes, hex encoded with 0x prefix, case insensitive._ | [optional] [default to null] |
| **proposer_fee_recipient** | **String** | An address on the execution (Ethereum 1) network.                                                                        | [optional] [default to null] |
| **gas_limit**              | **String** |                                                                                                                          | [optional] [default to null] |
| **gas_used**               | **String** |                                                                                                                          | [optional] [default to null] |
| **value**                  | **String** |                                                                                                                          | [optional] [default to null] |
