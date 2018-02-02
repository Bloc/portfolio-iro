---
layout: post
title: Bloccit
---

**SUMMARY:**
Bloccit is an app where people can post, vote on, share and save links and comments.

**EXPLANATION:**

Blocitt has many features needed to make it a cool web app, but the first thing we need to do is design a basic user-interface (UI)
as a foundation to build on.

Bloccit users will need to be able to post information and comment on those posts. Posts and comments will need to persist;
that is, they'll need to be saved to a database so users can interact with them across sessions. When we need to persist data,
we should immediately think about data models. Data models, or more simply "models", are the "M" in MVC architecture.

Used Object Relational Mapping, or ORM is similar to a translation service, in that it provides a way for Rails developers
to manipulate a database using Ruby, rather than writing SQL. Rails employs an ORM library named *ActiveRecord* to provide this
translation service.

I learnt how to populate my application with test data, the process is called seeding data. This test data will consist of script-generated fake posts and comments, added to the development database only. This will allow you to see how the application will behave.

I learnt how to build resources, and how to interact with them through a concept known as CRUD. CRUD stands for Create Read Update
Delete. Bloccit needs to be able to perform CRUD operations on our models (such as posts) so that users can perform these actions
from the GUI we present to them (the views).

Bloccit also needs routes so that when a client makes a request to our application, such as requesting to delete a post,
Bloccit knows where to look to perform that action. In other words, our routes act like a traffic controller. Like a traffic
controller telling cars where to go, our routes tell the client requests where to go within Bloccit.

Let's say a user wants to delete a post. From a high level, the user clicks a button that says "Delete Post". The button sends
a request to our server (application) across the Internet that points to a specific web URL. Our routing maps the URL to a controller action within Bloccit. In this example, the web URL will map to an action that deletes a post.

For example, imagine the web URL is www.myapplication.com/posts/1/delete/. When a user sends a request to that URL, our
application looks for the route using a table and determines which controller action it should perform. This action in turn
interacts with the model and ultimately the database, modifying the state of our application by deleting the post.
These pieces work together to form the posts resource within our application.

I implemented a user interface (UI) so that Bloccit users can create posts. Now that we can create and view posts, I implemented
the ability to edit, update, and delete them via controller methods.

I built the functionality to create posts, but I don't have a way to organize them. I anticipate that Bloccit users will create
a large number of posts, and will therefore need a way to organize, or categorize them. I created a topics resource that will be
used to organize posts. Along the way, I learnt how to nest resources and refactor code.

I learnt more about data validation and partials. Validation methods are provided by ActiveRecord and allow us to define
valid states for model attributes. Validations can prevent unwanted data from entering the database. Validation methods
allow us to check for things like presence, length, numericality, format, and uniqueness.

I learnt more about ActiveRecord callbacks.  User authentication systems determine whether a user is who they claim to be.
They allow users to sign up, sign in, and sign out.

Bloccit has the ability to model and persist users, but we have no way of creating a user or signing up for the application, so
I implemented sign up.

Now that users can sign up for Bloccit, they'll need to be able to sign in. Signing in to an application requires user information
to persist while a user is signed in to Bloccit. That is, we must authenticate and retain user information so that we know
who the user is until they sign out. I used a session object to persist a user's information after they sign in to Bloccit.

I associated users and posts using has_many and belongs_to associations, to allow ownership of content in Bloccit.

I authenticated the app, allowing users to create password-secured accounts and sign in and out. With authentication I know
who our users are, but not what they're allowed to do. For that we need to add authorization to Bloccit.  Authorization refers to the access rights each user has to resources and the operations they can perform on them. Authorization is a set of rules and permissions, according to user roles. An example of an authorization rule could be: "The owner of a post should be able to edit or delete it." In this example, the user role is owner, the resource is a post, and the permission is the ability of a user to edit or delete a post.  Another example of an authorization rule might be: "Administrative users should be able to edit / delete posts, independent of ownership." In this example, the user role is administrator, post is the resource, and editing / deleting are the actions an administrator can perform on posts.

I want to allow Bloccit users to comment on posts. I built comments as a separate resource, and in doing so, introduced
shallow nesting to prevent our routes from becoming long and cumbersome.

As Bloccit grows there will be thousands of posts, and users will want a feature to distinguish the good from the bad.
I built a voting feature to allow users to up or down vote posts.

Most social web apps allow users to opt-in for notifications. I built a favoriting feature to allow users to flag posts
to notify them when a post receives a new comment.

As the Bloccit community grows , users will become proud of their posts and comments. Much like other community
applications, finally i wanted to provide our users with a way to publicly share their profile and contributions, using a profile
page. The profile page will display some basic information about the user, their avatar, and a list of their posts and comments.
