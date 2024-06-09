---
title: API Reference
---

API paths to resources are generally broken into multiple segments,

`{scheme}://{host}/{version}/{category}/[{pathSegment}][?{query}]`:

-   `version`: can be v1.0 or beta.
-   `category`: is a logical grouping of APIs into top-level categories.
-   `pathSegment`: is one or many navigation segments that can address an entity, collection of entities, property, or
    operation available for an entity.
-   `query`: string must follow the OData standard for query representations

## RPC Methods Available

| RPC Method                                | Description                                                                                |
| ----------------------------------------- | ------------------------------------------------------------------------------------------ |
| `eth_blockNumber`                         | Returns the number of the most recent block.                                               |
| `eth_call`                                | Executes a new message call immediately without creating a transaction on the block chain. |
| `eth_estimateGas`                         | Estimates the amount of gas required to execute a transaction.                             |
| `eth_gasPrice`                            | Returns the current price per gas in wei.                                                  |
| `eth_getBalance`                          | Returns the balance of the account of given address.                                       |
| `eth_getBlockByHash`                      | Returns information about a block by hash.                                                 |
| `eth_getBlockByNumber`                    | Returns information about a block by block number.                                         |
| `eth_getBlockTransactionCountByHash`      | Returns the number of transactions in a block from a block matching the given block hash.  |
| `eth_getBlockTransactionCountByNumber`    | Returns the number of transactions in a block matching the given block number.             |
| `eth_getCode`                             | Returns the code at a given address.                                                       |
| `eth_getStorageAt`                        | Returns the value from a storage position at a given address.                              |
| `eth_getTransactionByBlockHashAndIndex`   | Returns information about a transaction by block hash and transaction index position.      |
| `eth_getTransactionByBlockNumberAndIndex` | Returns information about a transaction by block number and transaction index position.    |
| `eth_getTransactionByHash`                | Returns information about a transaction requested by transaction hash.                     |
| `eth_getTransactionCount`                 | Returns the number of transactions sent from an address.                                   |
| `eth_getTransactionReceipt`               | Returns the receipt of a transaction by transaction hash.                                  |
| `eth_getUncleByBlockHashAndIndex`         | Returns information about an uncle of a block by hash and uncle index position.            |
| `eth_getUncleByBlockNumberAndIndex`       | Returns information about an uncle of a block by block number and uncle index position.    |
| `eth_getUncleCountByBlockHash`            | Returns the number of uncles in a block from a block matching the given block hash.        |
| `eth_getUncleCountByBlockNumber`          | Returns the number of uncles in a block from a block matching the given block number.      |
| `eth_sign`                                | Signs data with a given address.                                                           |
| `eth_signTypedData`                       | Signs typed data with a given address (EIP-712).                                           |
| `eth_getLogs`                             | Returns an array of logs matching a specified filter condition.                            |
| `net_version`                             | Returns the current network protocol version.                                              |

<!--
## API Rate Limiting

If you receive a rate limit error, you should stop making requests temporarily according to these guidelines:

Continuing to make requests while you are rate limited may result in the banning of you, your family, and possibly your
entire country.

## Exceeding the rate limit

#### 80 requests per minute is the public default

!!! warning

    Reach out to us via Telegram or Email to get a rate limit increase if needed.

If you exceed your primary rate limit, you will receive a `403` or `429` response, ~~and the `x-ratelimit-remaining`
header will be `0`. You should not retry your request until after the time specified by the `x-ratelimit-reset`
header.~~

If you exceed a secondary rate limit, you will receive a `403` or `429` response and an error message that indicates
that you exceeded a secondary rate limit.

~~If the `retry-after` response header is present, you should not retry your request until after that many seconds has
elapsed. If the `x-ratelimit-remaining` header is `0`, you should not retry your request until after the time, in UTC
epoch seconds, specified by the `x-ratelimit-reset` header.~~[^1]

[^1]: Response header for retry/rate limit is not yet available.

<!-- @private
- If the `retry-after` response header is present, you should not retry your request until after that many seconds has elapsed.
- If the `x-ratelimit-remaining` header is `0`, you should not make another request until after the time specified by the `x-ratelimit-reset` header. The `x-ratelimit-reset` header is in UTC epoch seconds.
- Otherwise, wait for at least one minute before retrying. If your request continues to fail due to a secondary rate limit, wait for an exponentially increasing amount of time between retries, and throw an error after a specific number of retries.

## Checking the status of your rate limit

You can use the headers that are sent with each response to determine the current status of your primary rate limit.

| Header name             | Description                                                                  |
| ----------------------- | ---------------------------------------------------------------------------- |
| `x-ratelimit-limit`     | The maximum number of requests that you can make per hour                    |
| `x-ratelimit-remaining` | The number of requests remaining in the current rate limit window            |
| `x-ratelimit-used`      | The number of requests you have made in the current rate limit window        |
| `x-ratelimit-reset`     | The time at which the current rate limit window resets, in UTC epoch seconds |
| `x-ratelimit-resource`  | The rate limit resource that the request counted against.                    |

You can also call the `GET /rate_limit` endpoint to check your rate limit. Calling this endpoint does not count against your primary rate limit, but it can count against your secondary rate limit. For more information, see "[REST API endpoints for rate limits](https://docs.github.com/en/rest/rate-limit/rate-limit)." When possible, you should use the rate limit response headers instead of calling the API to check your rate limit.

There is not a way to check the status of your secondary rate limit.

## Exceeding the rate limit

If you exceed your primary rate limit, you will receive a `403` or `429` response, and the `x-ratelimit-remaining` header will be `0`. You should not retry your request until after the time specified by the `x-ratelimit-reset` header.

If you exceed a secondary rate limit, you will receive a `403` or `429` response and an error message that indicates that you exceeded a secondary rate limit. If the `retry-after` response header is present, you should not retry your request until after that many seconds has elapsed. If the `x-ratelimit-remaining` header is `0`, you should not retry your request until after the time, in UTC epoch seconds, specified by the `x-ratelimit-reset` header. Otherwise, wait for at least one minute before retrying. If your request continues to fail due to a secondary rate limit, wait for an exponentially increasing amount of time between retries, and throw an error after a specific number of retries.

Continuing to make requests while you are rate limited may result in the banning of you, your family, and possibly your entire country.
-->
