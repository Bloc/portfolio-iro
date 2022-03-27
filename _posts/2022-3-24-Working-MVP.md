---
layout: single
title: MVP, CI/CD, and Data... oh my!
---

Fell into a bit of a slump come around the holidays, and also Q1. Work and other RL obligations has kept me "entertained", to put it nicely. Lets leave it at that, shall we?

## Starting a Full Stack Specialization

I've recently started to do a Full Stack Cloud Developer specialization. Mainly because I haven't created anything as of late, and would like to _not_ lose the creative muscle of making/building things. Additonally, the cloud portion of the specialization will allow me to think in a different way in terms of how to build and deliver applications, which I believe should bring some benefit to any future projects on the horizon.

## Market Data puller

Since I've last posted, I've been successful at creating an MVP for pulling market data for the Eve Online High Sec Market, yay! It's just basically a nice set of scripts that pulls one after the other, based off of the different URI locations where the APIs are serving data from. 

I'd like to post a bit more about what I've done, and how I've structured this, as I never did this when the project was built. Additonally, would also like to do this because I would like to review the code to remember how it works, as well as leave a document of it's workflow.

Additonally, I would like to build on top of this. The idea of building this code was to understand how to pull from the market data available from Eve online. **Big check box ticked off!** Now, I'd like to think a bit more about how to best *save* this data, as well as eventually how to best serve/present this data.

Subsequent posts will follow on this (no more slacking on my part).

## CI/CD

Have been reading up CI/CD, as well as migrating workflows to the cloud via migrating to microservices. I think it's time to apply some of this, as there is no better way to eat your own dogfood.

I'd like to start to do some CI/CD on the apps that I have. Specifically this site. There are a couple of reasons. Main one being, that if I just have to focus on creating the content, *i.e. this post*, commit, and then sit back/relax, and let the CI/CD workflow do it's thing.... I think the cadence and motivation to actually do these posts will go up.

Plus, the added bonus that I get to learn about deploying this first hand on a Linux Distro.

## Containerization

Later on, would like to start to move some services onto containers. That is, for example, for the Market Data puller, I would like to evaluate moving the harvested data to a database. Having a database run on a container, and having the actual database file just be a file on the host OS seems interesting. I know nothing about DB planning yet, and would need some reading into. But would be a first step of moving things towards containers.

Another interesting container effort, would be to setup CI/CD on containers themselves, however, I'd like to understand what the software chosen to do the CI/CD does first, so containerizing this would take a bit.

## Data

I've alluded to migrating harvested data to a DB of some sort. I have no clue if this makes sense for the scope of the project, how to organize the datat, what the pros and cons are of doing this, and if it's even worth the effort.

However, I do need some sort of way to organize the data. Right now, I'm pulling from the different URIs, filtering, and then combining the data. Will go through the thought process of if it may be easier to just immediatly dump all harvested data into some sort of SQL dabase, and then do the filtering and combining of data through SQL.

## Next steps

To kick this all off, I'd like to start with the CI/CD portion, as I believe it would be the most low hanging fruit, and would save me the most time short term, as a good CI/CD pipeline would allow me to focus on making the content, and save me the step of building the web app, and uploading/reloading NGINX every time I have new content.

I'm hoping that this is, the second to last, if not the last post I have to manually do the web app building process.
