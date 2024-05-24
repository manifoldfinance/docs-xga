---
title: Augmented Uniform Price Auction
description: Specification for the Augmented Uniform Price Auction
tags: ["primary market", "price auction", "auction format", "gas auction", "mechanism design"]
---

## Specification for Primary Market

We are augmenting the standard uniform price auction format with two features:

1.  Instead of providing a perfectly inelastic supply (also known as a fixed amount that we auction off), we offer an
    elastic supply schedule: If the price is very low, we will offer only limited amounts of options.

2.  We introduce a different tie-breaking rule for excess demand. Owing to the discrete nature of bids, situations can
    arise where no market-clearing price exists (where demand equals supply). While the typical rule in many auctions
    prioritizes high marginal bids first, we propose an alternative that exerts more pressure at the marginal quantity
    level.

We explain the rationale behind these two features below.

Before we delve into the details, let us address the issue with the standard uniform price auction. When the supply is
fixed, or perfectly inelastic, there is a risk of resulting in very low prices. This concept, well understood since the
work of Wilson (1979), highlights that bidders are incentivized to understate their bids, a common challenge in most
multi-unit auctions. In the uniform price auction, the tradeoff is evident: if you lower your bid for the marginal unit,
not only do you reduce your price for that unit, but if you win, you also decrease the overall price you pay.

Now, the overall effect and danger of severe under-pricing is contingent on demand factors. It cannot be easily inferred
from data. It is also well understood that there is no clear way to tell whether the discriminatory or uniform price
auction provides more revenue, neither theoretically (Ausubel et al. 2011) nor empirically.

## Elastic supply curve

-   Fix the max capacity of beta, $q^{max}$. We assume this is given for the auction. Obviously, it can be a parameter
    that we will optimize over time.

-   The supply curve, $S \colon P \to Q$, where $P$ is the set of allowed prices; and $Q$ the set of available options.
    It gives for each price the amount of gas space we offer.

-   The set of options will be determined by the tick size we provide. $Q$ will be further limited by the max capacity
    we offer. That is, typically,

$$
Q=0, t_q, 2 t_q, \ldots, q^{\max } \text { where } t_q
$$

$$
t_q=q^{\max } / k
$$

for some $k \in N$.

-   The idea for the shape of the supply function is to have an initial segment of the supply curve which is concave and
    a second segment that then only provides a constant amount. This is the maximally available capacity. Below are
    pictures, that will make this clearer.

-   Concretely, one parameterized functional form is this:

$$
S(p) =
\begin{cases}
s(p)  & \text{for } p < p' \\
s(p') & \text{for } p >= p'
\end{cases}
$$

where $ s(p) $

$$
s(p) = ap^n
$$

where $a,n$ are constants. The idea, again, is that the function is concave and thereby monotonically increasing until
price $p'$.

This price is calculated by setting the max quantity, $q^{max} = ap^n$, and then deriving

$$
 p' \equiv (q^{max} / a)^{1/n}
$$

NOTE: It goes without saying that the functional form above is up for change if we want to.

NOTE: It is theoretically well understood that an elastic supply curve can reduce the danger of dramatically
underpricing. In practice, this is not so often used. One reason can be that the value of the good might be lower for
the auctioneer.

In our case, however, this can be different. The reason is that we possibly have use for the space ourselves. So, as
remarked above, we might have a positive outside value and might not be willing to sell for any price.

## Bidders

Each bidder can submit several (quantity,price) pairs. We thereby elicit his (partial) demand function
$d_i(p) \colon P \to Q$.

## Aggregation of demand

The way that a uniform auction proceeds is by aggregating demand and matching it to supply. This allows to determine a
market clearing price - if it exists. Reasons for non-existence can be increasing demand curves.

Now, first, consider the aggregate demand:

$$
D(p) \equiv \sum_j d_j(p)
$$

Fix the highest price at which the all the demand can be satisfied (if it exists). That is,

$$
p^{*}=max\{p|D(p)=S(p)\}
$$

Note, in the case where there is excess demand for this price, i.e. $D(p^{*})>S(p^{*})$, we need an allocation rule that
determines who gets what.

Note, if demand schedules $d_j(p)$ were continuous, then excess demand would not be feasible.

Lastly note, that the fact that actual bids are discontinuous might reduce the likelihood of a low price outcome (Kastl
2011).

## Allocation rule

In case of excess demand, how is the excess demand cleared?

The standard rule is higher price, higher priority:

$$
q_j = d_{j,\>}(p^{*}) + \frac{d_{j}(p^{ *})- d_{j,>}(p^{*})}{D_{j}(p^{ *})- D_{j,>}(p^{*})}
$$

where $d_{j,\>}(p^{*})$ is the individual demand of $j$ for higher prices than $p^{*}$ and $D_{j,>}(p^{*}$ is the
aggregate demand at prices higher than $p^{*}$.

So, an agent first gets his demand that he stated at higher prices. Then he will receive a relative share of the
remaining excess demand at the market clearing price.

There is an alternative allocation rule though:

Give a share relative to individual demand at that point. That is,

$$
q_i = d_i(p^{**})/D(p^{**})
$$

Which means the larger the demand relative to overall demand at that price, the larger the share that a player will get.
In contrast to the rule above, only the marginal demand matters; demand stated at higher demand levels are irrelevant.

!!! info inline "Reflection"

    This creates stronger incentives to bid closer to true valuations; it reduces the tendency to end up

in a low price equilibrium.
