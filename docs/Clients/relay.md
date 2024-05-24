---
title: Relay
---

## Relay

proposer payout: empty block, 0; non empty block, non-negative value < 0

Once a proposer calls `submitBlindedBlock` to a relay (with a signed header), it
depends on the relay to release the block to be able to propose anything (no
fallback to a local block is possible at that point due to possible slashing).

There's several relay error scenarios:

1.  payload withholding (relay doesn't release the payload and the proposer
    needs to forfeit the slot)

2.  incorrect payload  
    a. incorrect value (the final amount paid by the builder to the proposer was
    different to the amount claimed in the `BuilderBid`)  
    b. invalid block (invalid data / fields)
