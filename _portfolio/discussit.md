---
layout: post
title: Discussit
feature-img: "img/hubble_img.jpg"
thumbnail-path: "img/discussit/discussit_landing_page.png"
short-description: A topic-based social media app that creates forums to discuss ideas.

---
#### A simple social media app that creates forums to discuss user created topics.
Try it out at [Discussit](https://discussit-social.herokuapp.com/) **or**
view the code at [SJl149/discussit](https://github.com/SJl149/discussit).

{:.center}
![]({{ site.baseurl }}/img/discussit/discussit_demo.gif)

## Description
I undertook this project to learn the basics of Rails development in an app that has different scopes for different levels of users. This project also was produced using Test Driven Development using RSpec.

## Features
##### Users
There are three user levels: admin, member, and non-member.

* Admins can add and delete all comments, posts, and topics.
* Members cannot create topics, but can add posts and comments. They can only delete their own posts and comments.
* Non-members do not need to sign in, but can only view topics, posts and comments.

##### Posts

Posts are organized by topics. Users can add posts to a topic and comment on the posts of others. Votes raise or lower the profile of posts in the post list.
