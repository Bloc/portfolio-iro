---
layout: post
title: Bloccit
feature-img: "img/Bloccit_Test.png"
thumbnail-path: "https://s3-us-west-2.amazonaws.com/lgreen-bloccit-production/Bloccit.png"
short-description: A Reddit replica that teaches Rails fundamentals.

---
Bloccit is a simple web app that allows you to register and create an account. Each user has the ability to post a new topic, comment on existing ones and delete their own posts. 

### What needed to be improved?

There are several platforms, services and forums that allow users to participate. However, some may be too cluttered, while others may be overly simplistic. At the same time, most of them have one recurring problem: visibility. When you're dealing with thousands of users, perhaps millions of topics and posts, it becomes more and more difficult to keep track of the information posted. 

### How did we improve it?

We created an easy-to-use website that operates as a forum, but has an aesthetic feel. Sign up is fast and easy. Once the user has signed up and confirmed their account, they can start creating new posts, as well as commenting on existing ones.  

### What can a user do?

Besides starting new post and making comments, a user can also favorite another user's post. This will allow the user to follow the post along with the comments attached to it. The user can stop following the post at any time. 

The user also has the ability to attach a file to their post, as well as to upload a personal avatar to their profile. 

As a registered user, you will be able to view the most popular posts of the week, and the most active users. In synthesis, a user can: 

* Comment on a post
* Create multiple posts (public or private)
* Delete existing posts (user-created)
* Favorite posts and receive email alerts 
* Vote up and vote down posts  

### Results

* User Authentication is handled using the Devise gem, which provides a flexible solution, allowing multiple users to sign in 
* The Pundit Gem and roles were implemented to determine which views would be accessible to what kind of user (admin, guest, moderator, member)
* Pagination was implemented to improve user-experience 
* The site was Ajaxified to speed up the website and improve user-experience 

### Screenshots

![alt text][logo]

[logo]: https://s3-us-west-2.amazonaws.com/lgreen-bloccit-production/Bloccit.png "Bloccit Screenshot 1"

![alt text][logo2]

[logo2]: https://s3-us-west-2.amazonaws.com/lgreen-bloccit-production/Bloccit_Screenshot2.png "Bloccit Screenshot 2"

![alt text][logo3]

[logo3]: https://s3-us-west-2.amazonaws.com/lgreen-bloccit-production/Bloccit_Screenshot3.png "Bloccit Screenshot 3"

![alt text][logo4]

[logo4]: https://s3-us-west-2.amazonaws.com/lgreen-bloccit-production/Bloccit_Screenshot4.png "Bloccit Screenshot 4"

[Link to Project](https://liz11-bloccit.herokuapp.com/)