---
title: Validators
---

## Requirements

-   Operate as a self-reporting node operator
-   Operating using MEV-Boost

## Protections

Node Operators are being provided with a tailored risk management solution that addresses the unique challenges and
risks of participating through the relay.

> Read more at [Relay: Captive Insurance](../Relay/captive-insurance.md)

This is a block diagram of all the parts of the system and will be updated as needed.

```mermaid
graph LR
subgraph "Consensus Node"
  engine[Engine API Client]
  BAPI[Beacon API]
  TICK[Slot processor]
  blk_db[Block DB]
  BS_db[Beacon State DB]
  brod[Broadway]
  FCTree[Fork choice store - Genserver]
  BAPI -->|Beacon state queries| BS_db
  brod -->|Save blocks| blk_db
  brod -->|Blocks and attestations| FCTree
  TICK -->|New ticks| FCTree
  BAPI --> engine
  BAPI --> |head/slot requests| FCTree
  brod --> |Save new states|BS_db
end
GOS[Gossip Protocols]
exec[Execution Client]
VALIDATOR[Validator]
engine <--> |payload validation, execution| exec
GOS -->|blocks, attestations| brod
VALIDATOR --> BAPI
```

## Networking

The main entry for new events is the gossip protocol, which is how consensus nodes communicates with other consensus
nodes.

1. Discovery: our node has a series of known `bootnodes` hardcoded. We request a list of the nodes they know about and
   add them to our list. We save them locally and now can use those too to request new nodes.

2. Message propagation. When a proposer sends a new block, or validators attest for a new block, they send those to
   other known nodes. Those, in turn, propagate the messages sent to other nodes. This process is repeated until,
   ideally, the whole network receives the messages.

## Gossipsub

One of the main communication protocols is GossipSub. This allows us to tell peers which topics we're interested in and
receive events for them. The main external events we react to are blocks and attestations.

### Receiving an attestation

```mermaid
sequenceDiagram
    participant prod as Topic Producer (GenStage)
    participant proc as Topic Processor (Broadway)
    participant FC as Fork-choice store

    prod ->> proc: Produce demand
    proc ->> proc: Decompress and deserialize message
    proc ->>+ proc: on_attestation()
    proc ->> FC: request latest message by the same validator
    FC -->> proc: return
    proc ->> proc: Validate attestation
    proc ->>- FC: Update fork-choice store weights
```

When receiving an attestation, it's processed by the
[on_attestation](https://eth2book.info/capella/annotated-spec/#on_attestation) callback. We just validate it and send it
to the fork choice store to update its weights and target checkpoints. The attestation is only processed if this
attestation is the latest message by that validator. If there's a newer one, it should be discarded.

The most relevant piece of the spec here is the [get_weight](https://eth2book.info/capella/annotated-spec/#get_weight)
function, which is the core of the fork-choice algorithm. In the specs, this function is called on demand, when calling
[get_head](https://eth2book.info/capella/annotated-spec/#get_head), works with the store's values, and recalculates them
each time.

!!! important

    It is a requirement that the validator cache the weights and the head root each time it adds a block or attestation: so it won't need to do the same calculations again.
    Additionally, it should save the latest messages in persistent storage as well so that if the node crashes it can recover the tree weights.

### Receiving a block

```mermaid
sequenceDiagram
    participant prod as Topic Producer (GenStage)
    participant proc as Topic Processor (Broadway)
    participant block as Block DB
    participant state as Beacon States DB
    participant FC as Fork-choice store
    participant exec as Execution Client

    prod ->> proc: Produce demand
    proc ->> proc: Decompress and deserialize message
    proc ->>+ proc: on_block(block)
    proc ->> exec: Validate execution payload
    exec -->> proc: ok
    proc ->> FC: request validation metadata
    FC -->> proc: return
    proc ->> proc: Validate block
    proc ->> block: Save new block
    proc ->> proc: Calculate state transition
    proc ->> state: Save new beacon state metadata
    proc ->> FC: Add a new block to the tree and update weights
    loop
        proc ->>- proc: process_operations
    end
    loop
        proc ->> proc: on_attestation
    end
```

Receiving a block is more complex:

-   The block itself needs to be stored.
-   The state transition needs to be applied, a new beacon state calculated, and stored separately.
-   A new node needs to be added to the block tree aside from updating weights.
-   on_attestation needs to be called for each attestation.

Also, there's a more complex case: we can only include a block in the fork tree if we know of its parents and their
connection with our current finalized checkpoint. If we receive a disconnected node, we'll need to use Request-Response
to ask peers for the missing blocks.
