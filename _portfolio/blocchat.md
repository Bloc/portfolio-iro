---
layout: post
title: ChatterBox
date: July 04, 2017
feature-img: "img/sample_feature_img.png"
thumbnail-path: "img/chatter-box-logo.png"
short-description: ChatterBox is a lightweight forum/chat application built with Angular and fueled by Fire(base)!
published: true
---

ChatterBox — originally titled BlocChat — was a way to build a more complex web application using the skills I learned in the BlocJams project. The big difference was that ChatterBox uses a JavaScript based back-end, Firebase, provided by Google. This was a fantastic motivating factor, because with a database the site didn't simply have to look and feel dynamic, it could actually serve up and save off content to be truly dynamic. Firebase made it very easy to create something that just works!

---

## Firebase

The Firebase API provides access to a JSON-type database. It's a fairly simple tool for organizing datasets, but its really the API framework, two- and three-way data binding, and feature set that makes it so powerful.

The first few steps to building a chat application involved simply slapping something simple together, but soon I had to think more carefully about how to organize the database. [Firebase documentation](https://firebase.google.com/docs/) recommends having a ['flat' structure](https://firebase.google.com/docs/database/web/structure-data#flatten_data_structures), which, in my mind, corresponded to some of the relational databases that I've worked with in the past. It focused on using Ids to connect related types of information, rather than storing and managing duplicate info or having a very deeply nested structure that wasn't conducive to relating data together.

Here is an example of what _not_ to do:

```JSON
{
  "rooms":{
    "$room_id": {
      /* properties */
      "messages": { /* array of messages for this room */ }
    }
  }
}
```

The above structure is not optimum for fetching subsets of information. For example, if all you want to do is list the rooms that are available, this structure would force you to unnecessarily download all the messages along with the room info.

Here is the recommended 'flat' approach (a simplified version of what I _actually_ did):

```JSON
{
  "rooms":{
    "$room_id": { /* properties */ }
  },
  "messages": {
    "$room_id": { /* array of messages for this room */ }
  }
}
```

With this method, you can quickly and cleanly request a list of rooms and then **only** list the messages for a specific room when the user chooses to. Now, to a certain extend, this does create some duplication as you store IDs to reference other 'tables' in the database, or if you want to simulate a many-to-many data relationship, but it is likely more performant and can facilitate creating Firebase rules, which is another topic I researched quite a bit.

Bloc's curriculum didn't quite adhere to Firebase's documentation, so I decided to go a bit off the beaten trail. This allowed me to do a bit more with Firebase and my app, and I even provided some feedback that I hope will improve Bloc's curriculum for this project (as far as Firebase data organization goes). I kept my data structure as 'flat' as possible, but my ambitions for ChatterBox led to some pretty complex data sets as I tried to keep track of public vs private chatrooms, room membership as well as room invitations, and private user data (like favorite chatrooms) as well as public user data (user info for attributing posts, or searching for friends).

---

## Angular Services

I struggled a great deal with the services that I would use to facilitate the application flow and provide relevant info at the appropriate time. While AngularFire makes things very easy, I was attempting to build services that would only perform the minimal number of transactions possible with the back-end. This meant that it was important to store traceable references to all the results of database queries and, when available, return them rather than querying again. While this sounds fairly straight-forward, the data wasn't always structured or query-able in ways that facilitated this approach. For example, using the 'flat database structure and creating fine-tuned access rules (a topic which I'll explore further below) meant that I often had to store related pieces of information in different locations and artificially aggregate it for referencing later.

The services I created were also intended to play a specific role, but the needs of the app, as well as the organization of the data, caused overlap that didn't always sit well with me. For example, the UserService, whose primary role was authentication had to keep user data accurate in multiple locations (I know, not very DRY). One of those other locations was a data table that aggregated all users' basic info (so that, as a user, I could look other users up as well as see who posted in various chatrooms as an intelligible name rather than an alphanumeric id string). I had created a separate service for that specific function called UserDataService, but when a user udpates his/her own information, the `UserService` has to talk to the `UserDataService` to get and set that data. Even inside of the `UserDataService` the data had to be retrieved and updated from/in different places in the database.

That same kind of cross-service communication and disparate data storage locations is not uncommon in ChatterBox and it struck me that interdependence among services may not be the best design. On the other hand, and as I'll explain, the only way I could see to create relatively secure data was to save it in different locations, so that particular challenge probably didn't have a solution without moving away from Firebase as the security layer for the database.

---

## User Authentication

Very early on in the project, my vision for ChatterBox was one where users could not only identify themselves, but log in and have a personalized experience that also allowed for some privacy. One of the user stories I was considering right off the bat was one in which uses could send each other messages that only they could see (direct/personal messaging). A similar use case is easily imagined with groups conversations that you wish to remain closed to the public and accessible by invite only. While there are many considerations and design choices that went into addressing those user stories, the central one was user authentication. Luckily, Firebase provides a fantastic structure and API to facilitate this. All I had to do was build my `UserService` to expose the important aspects of that API. However, that certainly didn't solve the design challenges surrounding user authentication.

Once I had a `UserService`, I had to figure out how to use it to lock down the site when a user wasn't logged in, or was logged in as someone who shouldn't be able to see certain content. Each page had to respond to the user authentication state appropriately and guide people intuitively to sign up and log in without those pieces becoming obtrusive.

With more time, I would gladly explore this area in more depth as I'm sure there are more effective ways of achieving this even more reliably.

---

## Security

Firebase provides 'rules' as a means by which to lock-down different data segments. Given my desire to provide the ability to have 'private' conversations on ChatterBox, I felt it was crucial to establish a corresponding ruleset. This was quite a struggle and required a lot of research, iterative testing, and several not-inconsequential data re-structuring efforts. For a while I was worried that my vision wasn't possible with the JSON model of Firebase and the way they implemented rules, but I discovered that it was simply impractical.

To summarize a lot of investigation, Firebase rules are established from the 'top' of the hierarchy down and the search for access stops as soon as one is reached. This means that you cannot have multiple access rules within a tree. There's "one rule to rule them all" - so to speak.

To demonstrate, here is a simplified data structure.

```JSON
{
  "users": {
    "askfh83r98hhw9h9a": {
      "name": "Joe Smith",
      "email": "smithj@example.com",
      "preferences":{

      }
    }
  },
  "rooms": {
    "a87f029uro892a": {
      "name": "My Room",
      "members": ["92h3r9hap9e235o2zmn","r928hnfpzbwkbraslashdp10"]
    }
  },
  "messages": {
    "a87f029uro892a": {
      "author": "askfh83r98hhw9h9a",

    }
  },
  "members": {
    "askfh83r98hhw9h9a": {

    }
  }
}
```

---

## Boxing it all up
