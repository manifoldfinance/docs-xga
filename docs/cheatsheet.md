---
title: Cheatsheat Quickstart
---

*Cheatsheet for getting started, **quickly**.*

## Endpoints

### Mainnet

| Service | Endpoint |
|---------|----------|
| Relay   | https://eth.xga.com/ |
| L2 RPC  | https://op.xga.com/v1 |
| L1 RPC  | https://rpc.xga.com/v1 |

### Holesky XGA

| Service | Endpoint |
|---------|----------|
| Relay   | https://holesky-eth.xga.com/ |
| L2 RPC  | https://holesky-op.xga.com/v1 |
| L1 RPC  | https://holesky-rpc.xga.com/v1 |
| Auction Dashboard | https://holesky-dashboard.xga.com/ |

## Validator

Validators are required to make the following updates to their clients to participate in the auction.

### Privileged Public Keys

| Network | Public Key |
|---------|------------|
| Mainnet | `0xad2c0074aa2bb6149340187906196f719bbac701a20d0cc88baefd2bbcc9fc970fb060d5eeb5fedf22024db6e69582da` |
| Holesky | `0xa357078fe39a532623a366d44fa27052bd6aef14e78774202afab660fa2eda3051c43c6d94167c8222ebe5ad30ae517d` |

### vouch

Use the release **>= v1.9.0-alpha.7** located at [vouch](https://github.com/attestantio/vouch).

- [PR-206](https://github.com/attestantio/vouch/pull/206) was merged to the main repository and an alpha release was created.
- Only **lighthouse CL >= 5.1.3** is supported and recommended.

Configuration:

- Set `privileged_builders` configuration to the public key of the relay (vouch).
- Set `builder-boost-factor = "10000"` configuration (vouch).

### mev-boost

Use the latest release located at [mev-boost-privileged](https://github.com/manifoldfinance/mev-boost-privileged).

- [PR-656](https://github.com/flashbots/mev-boost/pull/656) to the main repository is pending.
- Only **lighthouse CL >= 5.1.3** is supported and recommended.

Configuration:

- Make sure the minimum bid value is set to `0` on the relay configuration (mev-boost).
- Set `-privileged-builder` configuration to the public key of the relay (mev-boost).
- Set `--builder-boost-factor=10000` on `validator_client` configuration (lighthouse).
- Set `--produce-block-v3` on `validator_client` configuration (lighthouse).
