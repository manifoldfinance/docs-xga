---
title: Constants
---

### Gwei values

| Name                          | Value                                   |
| ----------------------------- | --------------------------------------- |
| `MIN_DEPOSIT_AMOUNT`          | `Gwei(2**0 * 10**9)` (= 1,000,000,000)  |
| `MAX_EFFECTIVE_BALANCE`       | `Gwei(2**5 * 10**9)` (= 32,000,000,000) |
| `EFFECTIVE_BALANCE_INCREMENT` | `Gwei(2**0 * 10**9)` (= 1,000,000,000)  |

### Time parameters

| Name                               | Value                     |  Unit  |   Duration   |
| ---------------------------------- | ------------------------- | :----: | :----------: |
| `MIN_ATTESTATION_INCLUSION_DELAY`  | `uint64(2**0)` (= 1)      | slots  |  12 seconds  |
| `SLOTS_PER_EPOCH`                  | `uint64(2**5)` (= 32)     | slots  | 6.4 minutes  |
| `MIN_SEED_LOOKAHEAD`               | `uint64(2**0)` (= 1)      | epochs | 6.4 minutes  |
| `MAX_SEED_LOOKAHEAD`               | `uint64(2**2)` (= 4)      | epochs | 25.6 minutes |
| `MIN_EPOCHS_TO_INACTIVITY_PENALTY` | `uint64(2**2)` (= 4)      | epochs | 25.6 minutes |
| `EPOCHS_PER_ETH1_VOTING_PERIOD`    | `uint64(2**6)` (= 64)     | epochs |  ~6.8 hours  |
| `SLOTS_PER_HISTORICAL_ROOT`        | `uint64(2**13)` (= 8,192) | slots  |  ~27 hours   |

### Time parameters

| Name                                  | Value                     |    Unit     |  Duration  |
| ------------------------------------- | ------------------------- | :---------: | :--------: |
| `SECONDS_PER_SLOT`                    | `uint64(12)`              |   seconds   | 12 seconds |
| `SECONDS_PER_ETH1_BLOCK`              | `uint64(14)`              |   seconds   | 14 seconds |
| `MIN_VALIDATOR_WITHDRAWABILITY_DELAY` | `uint64(2**8)` (= 256)    |   epochs    | ~27 hours  |
| `SHARD_COMMITTEE_PERIOD`              | `uint64(2**8)` (= 256)    |   epochs    | ~27 hours  |
| `ETH1_FOLLOW_DISTANCE`                | `uint64(2**11)` (= 2,048) | Eth1 blocks |  ~8 hours  |

```ini
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#misc
FAR_FUTURE_EPOCH = 2 ** 64 - 1
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#time-parameters-1
MIN_VALIDATOR_WITHDRAWABILITY_DELAY = 2**8
SHARD_COMMITTEE_PERIOD = 256
MAX_SEED_LOOKAHEAD = 4
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#state-list-lengths
EPOCHS_PER_SLASHINGS_VECTOR = 2**13
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#rewards-and-penalties
PROPORTIONAL_SLASHING_MULTIPLIER_BELLATRIX = 3
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#gwei-values
EFFECTIVE_BALANCE_INCREMENT = 2 ** 0 * 10 ** 9
MAX_EFFECTIVE_BALANCE = 32 * 10 ** 9
# https://github.com/ethereum/consensus-specs/blob/dev/specs/capella/beacon-chain.md#execution
MAX_WITHDRAWALS_PER_PAYLOAD = 2 ** 4
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#withdrawal-prefixes
ETH1_ADDRESS_WITHDRAWAL_PREFIX = '0x01'
# https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#validator-cycle
MIN_PER_EPOCH_CHURN_LIMIT = 2 ** 2
CHURN_LIMIT_QUOTIENT = 2 ** 16

# Local constants
GWEI_TO_WEI = 10 ** 9
SHARE_RATE_PRECISION_E27 = 10**27
TOTAL_BASIS_POINTS = 10000

MAX_BLOCK_GAS_LIMIT = 30_000_000
```
