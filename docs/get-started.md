---
icon: material/home
---

# What is XGA?

XGA is a platform that is comprised of an Optimism based Rollup, a smart contract protocol, an Ethereum consensus layer
sidecar and a domain-specific engine called Open Games for proving/developing (game-specific) mechanisms.

<div class="grid cards" markdown>

- [**:octicons-beaker-16: Optimizing Bidding Stratagies**](#) – from a single _valuation definition_, traders can maintain or create different bidding strategies.
- [**:octicons-sync-16: State sync**](/state) – automatically synchronize the state from the server with connected clients.
- [**:octicons-server-16: Scalable**](/scalability) – built to be horizontally and/or vertically scalable
- [**:octicons-cloud-16: Cloud-agnostic**](/deployment) – you may self-host it on your own servers for free, or use our commercial [XGA Cloud](https://cloud.xga.com/) service.

</div>

---

## Getting started

Before we start, let's make sure you have the necessary system requirements installed on your local machine.

**Requirements**:

## Creating your server

Use the command below to set up a new XGA server project:

=== ":octicons-terminal-16: Terminal: Node.js"

    ``` bash
    # Create a new XGA project
    npm create xga-app@latest ./my-server

    # Enter the project directory
    cd my-server

    # Run the server
    npm start
    ```

=== ":octicons-terminal-16: Terminal: Bun"

    ``` bash
    # Create a new XGA project
    bunx create-xga-app@latest ./my-server

    # Enter the project directory
    cd my-server

    # Install Bun transport & Run the server
    bun add @xga/bun-websockets
    bun run src/index.ts
    ```

---

## Next steps

- See how to connect to the XGA Rollup through one of the available [client-side SDKs](/client/).
- Implement your own [Valuation definition](/server/room) to handle your game sessions.
- Learn how to [exchange messages](/server/room/#onmessage-type-callback) between the L2 Rollup and L1 Mainnet.
- Learn how the [state synchronization](/state/) works.
- Good Hunting.