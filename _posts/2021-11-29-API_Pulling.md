---
layout: single
title: API pulling market data from Eve Online High Sec Market Hubs
---

So, As you may or may not have inferred from the link on the website's landing page, I dabble in playing Eve Online. It's a Spaceship MMO, and for me, it is a lot of fun.

Though there are many aspects to the game, I'll focus on the economy of the game which is one part of the game that I enjoy, how I currently operate in this playstyle, and how I am starting to develop tools using python to harvest public API data surfaced by `CCP games` in order to inform me better in my gameplay decisions.

Eve Economy and Hubs
-
Many articles have been written about the economy of Eve online, so will talk about it very high level. Unlike many other MMOs, eve has a single server or shard. Additonally, everything that exists in the shard is there because a player harvested it through world interaction. Whether they harvested the items through missions for lower tech items, or mined minerals to build higher tech items, they exist because a player harvested the item through pouring their time into getting or creating the item. These items are sold on the market. Building blocks of higher tech items, which are standard items you should use when you reach a certain proficiency in the game, are created by building/crafting them. Their building blocks are basically ore/gas, processed moon byproducts, or planetary byproducts. This, together with a blueprint, which can be bought on the market for lower tier items, and for normal tier and above have to be found via drops are what the building blocks of industry are.

These items can be bought and sold on the market, which is actually quite amazing. In the screenshot shown below, the market info is pulled up for the Battleship Nestor. The first screenshot shows the current existing buy and sell orders for the item. The second screenshot shows the price history.

![Nestor Buy and Sell orders](/assets/img/Nestor_Market_Screenshot.png)

![price history](/assets/img/Nestor_Market_Screenshot_price_history.png)

Now... every item can be bought and sold on the market. So, buying and selling is not limited to ships. Ammo, guns, special items, ship skins, spiced wine, exotic dancers... you name it. If you can hold it in your cargo hold or station inventory, you can sell it on the market, or put buy orders for it on the market.

![exotic dancers](/assets/img/exotic_dancers.png)

So, items can be bought, sold, traded. One thing that I haven't mentioned yet are market hubs. Each of the 4 major Empires have their central market hub. The market hubs became hubs due to the demand of the market themselves. However not all market hubs are the same. The well known `Jita 4-4` market hub is _the_ major market hub. It has both the highest volume, and ISK (in game currencty) velocity when compared to any other market hub. I won't go into details, but I'm including the `Perimeter` structure called `Tranquility Trading Tower`, which is basically an offshore station in order to save on some taxes vs the main `Jita` NPC owned hub. The `Amarr VIII` is the second largest hub, but it's roughly about 40% of the Market Volume of `Jita`, followed by `Dodixie` which is about half of the size of `Amarr`,  and `Rens` which is half of `Dodixie`.

The reason I bring up the market hubs is because this is where my strategy lies. I have been using this playstyle to fund my actual Player vs Player (PvP) habit _independently_, without having to rely on an external corporation for space/facilities/resources for generating ISK.

Station Trading, a Market Trading Playstyle
-
If you were going to ask for advice on forums.eveonline.com, or the r/eve subreddit on playing the market, you'd get the memeish axiom at least once from someone of `buy low, sell high`. Which is, in it's essence, the basis of all profitable trading. But the devil is in the details.

There is the perhaps, simplest way to participate in _pure_ market trading, which is to sit in `Jita` and margin trade. Basically, set up buy orders for items, sell them for whatever tax you paid for the transaction plus your profit. This is the simplest one to get into as there are less moving parts, only uses a single charachter, and you are literally applying the meme axiom by buying low and selling high word for word. Or at least trying to, because you never know when the invisible hand will move the market in the opposite direction of your profits.

I've tried this out, and it works. But at the time I tried this out, the relisting fee was negligible. So, you could just sit there and relist every 5 minutes (minimum amount of time the order had to sit before you could edit it), and basically try to chase the market. This sort of worked becuase of the ISK liquidity of Jita. However, babysitting market orders was not my thing, as I would prefer to be doing anything else other than babysitting my market orders to chase the market on a pixel spaceship game. Since then, the market mechanics have changed a bit, and you're better off setting a good strike price initially and adjusting if the market moves in a different direction or if you get a huge volume of orders placed above your order. I may revisit this in the future.

Market Arbitrage, my Market Trading Playstyle
-
This is the strategy that I'm using currently. It requires some more charachters to comfortably do this without too much of a time waste traveling around to each hub region to update old orders, or restock new orders.

In a nutshell, this is the Arbitrage. I buy at one market hub, and sell at another market hub. Market hubs, plural, actually.

Since September last year, I've been implmementing a simple strategy. Which is, source everything from `Jita` sell orders, and sell in `Amarr`, `Dodixie`, `Rens` via sell orders. This has been quite profitable, considering that the operation is in High Sec space. High Sec space is the area of the Eve Online universe where you as a player are relatively safe. There are some High sec NPC space police that show up to thwart and punish bad actors that try to destry your ship with no good reason. So, the most risk averse players as well as newbies stay here as they feel safe. Of course, with more risk comes more rewards, there are other sections of space that do not have this police existing and is much more lawless. But this is really not relevant for this discussion. The profits are comparable to higher tier PvE gameplay, with much less at risk, and less in game costs.

One of the most lovely things about this strategy is that you can see supply and demand in action. `Jita`, being the largest hub, has a lot of competition. Competition drives better price, hence, the margins here between buy/sell are the tightest. But you can make your items liquid very quickly. For arbitrage, the `Jita` hub is _key_ because 

Null Security space, or Nullsec for short, is the area of the eve universe that is _the_ most lawless. No police, no security standing penalties. Anything goes here. I joined a Nullsec corp and started to do arbitrage, leveraging the demand for certain items, and trying to apply my item selection strategies to Nullsec as well. Though also profitable, this would be the 4th hub that I would have to keep an eye on in terms of updating and restocking orders. The amount of items that I had to keep an eye on here made the effort start to feel like a lot.

This is the impetus that motivated me to start to factor in my code. I realized that to continue to scale, I _can_ just add more items to other market hubs. _But_, I would need to find a way to reduce the time I spend updating items, as well as picking the items. Improving these times will optimze my time spent on the market, and help fit in another market or two if I'd like to scale a bit.


