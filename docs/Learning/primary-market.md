---
title: Primary Market
subtitle: Call Market Reference
---

```mermaid
sequenceDiagram
    participant Client as Client
    participant DA as Discriminatory Auction COP
    participant FB as Flatten Bids
    participant SB as Sort Bids
    participant PAB as Process Auction Bids
    participant HRI as Has Remaining Items
    participant AI as Allocate Items

    Client->>DA: Start Auction(num_items, bids)
    DA->>FB: flatten_bids(bids)
    FB-->>DA: List of (price, quantity, bidder_id)
    DA->>SB: sort_bids(all_bids)
    SB-->>DA: Sorted list of bids
    DA->>PAB: process_auction_bids(sorted_bids, num_items)
    loop For Each Bid
        PAB->>HRI: has_remaining_items(remaining_items)
        HRI-->>PAB: Yes/No
        alt If Yes
            PAB->>AI: allocate_items(bid, remaining_items)
            AI-->>PAB: Allocation result, Updated remaining_items
        else If No
            PAB-->>DA: Final Allocation
        end
    end
    PAB-->>DA: Final Allocation
    DA-->>Client: Auction Results
```

Client Starts Auction: The process begins with the client calling the Start Auction method, providing the number of
items and the bids.

Flatten Bids: The Discriminatory Auction (DA) system flattens the structured bids into a list of tuples. Sort Bids: The
flattened bids are then sorted in descending order based on the bid price. Process Auction Bids: Enters a loop to
process each bid in the sorted list.

Check for Remaining Items: For each bid, it checks if there are remaining items to be auctioned. If there are no
remaining items, the auction process is concluded, and the final allocation is returned. If there are remaining items,
it proceeds to allocate items based on the current bid. Allocate Items: Items are allocated to the bidder if the
conditions are met (i.e., there are enough remaining items to fulfill at least part of the bid). Loop Continues: This
loop continues until all bids are processed or there are no more items to auction

Auction Results Returned: Finally, the auction results are compiled and returned to the client.
