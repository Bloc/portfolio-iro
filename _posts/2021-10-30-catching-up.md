---
layout: single
title: It's been a while....
---

A lot has happened since my last post.

In a nutshell, probably from most important to lesser important changes that have happened:

1. I have a daughter now. She's 3 right now.
2. We've moved from Brooklyn to Rockland County, a bit more of the suburban life. Least we stayed in NY State, right?
3. Left my previous position at Citrix, and have been working at Join Digital since about May 2019.
4. Have been focusing at Join a lot more on the L2/L3 and Firewall side, rather than on programming. Though very interesting to learn about the firewall as well as security side, I did think I was going to be working a bit more on the L2 SDN side, creating scripts consuming the OpenFlow controller API.
5. Have stopped climbing, initially because baby... and then we moved and were getting into a groove here. But I never re-joined a gym.
6. Though I continue to play EvE, but at a very different way. Much more focused on the market end of things, mainly importing/exporting peppered in with some PVP.

Without going into any of these in detail right now, life has changed quite a bit. As I look at my last post in 2018, can't but help to think about where my mind was at 4 months before my daughter came to this world. Part of me misses *some* parts of that time in my life, but not too much as for better or for worse, there's a bit more purpose than just myself now.

Snapping back into more interesting, less existential, more technical nerdy things... There are some motivating factors that have sparked my wanting to start writing up here again.

For starters, I've started to dabble a bit again in programming. Though super rusty, there is a different motivation that I'm going through right now that I didn't have before.

As opposed to when I was doing some bootcamps years ago, right now, I believe that I have problems that I'm motivated to create that I can solve through programming. Ahem.... let me say that again, things that *I actually want to build for my own benefit whether it be for work or for my hobby*. 

To be honest, also I'm missing writing about stuff I'm doing. I may be typing into the ether, into a void nobody will look at, which is fine for me. I'm not looking to become internet famous. At the very least, I think that there is benefit in the short term in writing out my thoughts, as well as in the long term, revisiting some of these writings for hints on what I've done, and how I've accomplished things. These hints can be useful in the future, whether it be in the technical realm because of the breadcrumbs that I've found in order to overcome the cruxes that are in front of me, or even the mindspace that I was in in order to achieve these goals.

Anyway, to less soft skills/mindset babbel.

Short term, there are a couple of technical goals that I've been working on in the past month. Some have been partially worked on, others I haven't even started to think about. But.... here goes:

* Dedicate some time posting more often.
* Figure out how to "update" **`Jekyll`**, which is the framework (?) that this website is using. May have to dig into the project's robust documentation.
* Update, or find a new look for this website! I've had this website up for quite some time. But am using the bare bones minimum. A quick google earlier today alluded to some updated color schemes and snazzy templates that will give the site a different visual feel.
* **EvE ESI** market data pulling for saving time doing my market stuff. Basically, quicker item picking, market order updating, and selling. It's a neat, and kind of a beheamoth of a project that I've already started to do some work on Python. High level, I'll be pulling data from the EvE online ESI that has relevant information on the in-game market, as well as my charachter's market orders. I've recently had some breakthroughs in how to use the python3 library **`request-futures`** for pulling data on a tangential project which built graph representation of the EvE online Universe for all non-wormhole space systems. Yes... I know.... **:insert nerd emoji here:**. Anyway, am currently in the process of thinking where to store the fetched data in order to format it into useful outputs, as well as how I'm going to present it for best use. For the storing, am *tempted* to use some kind of SQL, mainly because I haven't flexed that muscle for *quite some time*, and would like to refresh my memory on this. Currently, the most obvious route is to straight up create database tables from the market ESI data that I'm fetching, and then use SQL to create a table that will give me the relevant data that I want and need. However, will consider and look into other ways to do this. Besides this part, I'm also thinking of creating a link that would pull up an item on the in-game screen where I'm evaluating the item at. Basically saving me a metric ton of clicks to find the item that I should be investingating for purchasing or for selling. This last item of the project will force me to think on how to represent this data for my consumption/useage. That is, should I dump a **`.csv`** that can be loaded into google-sheets, and then visualize it better there? OR..... should I dust off my web dev skills and create a web app that allows me to visualize the data on a browser? OR..... should I move towards uncharted territory and use something like Qt5 to develop a custom app that would reflect my data?
* Create a GUI for the **`IntelPerimiter`** project. It's basically an intel tool that I created given that the corporation that I'm in doesn't have a tool that I can use on Linux. Intel tools are useful in eve online because every corporation (it's what they call guilds in this game) has a channel for a specific area of space. When a hostile fleet or player comes into the space, people type in their names and the system that they're in into the intel channels. My **`IntelPerimeter`** program scrapes the relevant intel chat logs, and sounds an alarm if hostiles are within X amount of jumps from the system that I'm in. Currently, it works, but is all running from a script, hence, why I'm interested into creating the GUI.
* Get back into some sort of physical exercise. Yes... I've been lazy. Gone are the days when I used to run 6 miles, bike 18 miles, climb for over an hour. I want to spend some time on what I can get into that will help me shed some pounds, as well as stay sharp without impacting my body too much negatively. Am tempted to get on an indoor rower, just to get started, maybe start to do running at a much lesser level than I did years ago. Maybe set up some goals in terms of running? Half marathon? 10k? Lets keep it simple. :)

Anyway, I'm tired of typing, and I'm going to have to figure out how to get **`Jekyll`** and this website updated again. So, if you're reading this, I've achieved some part of the goals set before. 

... And so it begins!
