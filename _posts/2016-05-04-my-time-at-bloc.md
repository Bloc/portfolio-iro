---
layout: post
title: My Time at Bloc
---
My Time at Bloc-

As mentioned in the previous post, I decided to enroll in Bloc, a remote programming bootcamp. I chose Bloc because it was less expensive, remote, and I got to choose my mentor who has been invaluable to me. Bloc has a variety of courses available. I was and still am searching for a customer/client facing role to continue learning in as I advance in my career. Because of this, Ruby and Rails seemed liked the clearest path, so I enrolled in the Ruby Development course.  I’m two months and two weeks into the course with 3 weeks left to go. I’ve learned so much so far I’m not even sure I can fit it all into a blog post!

My absolute favorite thing about my Ruby course and Bloc is that I have the ability to solve problems my own way. One example of this, is that I had problem that was looking for me to call the .shift method, only thing was, I wasn’t yet familiar with .shift. Here was the problem;

      Write me a function stringy that takes a size and returns a string of alternating '1s' and'0s'. The string should start with a 1. A string with size 6 should return :'101010'. With size 4 should return : '1010'. With size 12 should return : '101010101010'. The size will always be positive and will only use whole numbers.

 The solution I came up with was;

`def stringy(size)
  string = ''
  size.times do |number|
    if number.even?
      string = string + '1'
    else
      string = string + '0'
    end
  end
  string
end`



I was able to use my own coding knowledge to come up with a work around,  albeit a much more complicated bit of code than .shift, but was able to learn the easier method too.

I have completed two projects so far at Bloc and I am working on my third. The first project, called Bloccit, was a project that aimed to mimic Reddit. In Bloccit, there is user authorization and authentication to have users sign up, sign in, and sign out. There are three user roles in Bloccit; users, moderators, and admins. Users of Bloccit can create, view, edit, or destroy topics and posts. They can also comment on posts as well as up vote or down vote. Moderators are able to police to posts while admins have full authority to delete anything they want. Bloccit was created using Ruby on Rails, HTML, CSS, and a little JavaScript and jQuery.

The second project I’ve worked on while at Bloc is Blocipedia, a Wikipedia model. Through user authorization and authentication, there are two types of users; standard and premium. Standard users are able to view, create, edit and destroy public wikis. Standard users may upgrade their account using Stripe integration in order to become a Premium user. Premium users can view, create, edit, and destroy both public and private wikis as well as collaborate with other users. They also have to option to downgrade their accounts back to Standard. Blocipedia was created using Ruby on Rails, HTML, CSS, and a little JavaScript and jQuery.

The last project I am working on while at Bloc is called Your Migraine Tracker. I am building this app loved ones in mind as they all suffer from migraines. The goal of this project is to have a private space to track your migraines. Using this site, users are able to;

  -Login or sign up
  -Keep track of their pain on a scale of 1 to 10
  -Use different APIs to predict triggers such as Allergies or barometric pressure changes,
  -Keep track of the medications they are currently on for their migraines.

I will post a link to Your Migraine Tracker as soon as it is deployed!
