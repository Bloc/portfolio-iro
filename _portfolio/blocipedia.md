---
layout: post
title: Blocipedia
feature-img: "img/sample_feature_img.png"
thumbnail-path: "img/blocipedia.png"
short-description: Blocipedia is a SaaS Wiki Collaboration Tool.

---
### Summary:
Blocipedia is a Software as a Service wiki collaboration tool.  It allows users to collaborate using Markdown syntax for free, or to upgrade to a premium user to allow the addition of collaborators on private wikis.

### Explanation:
This is my second Ruby on Rails app that I created with the help of my mentor, Shannon Bertucci, at Bloc. I felt this app would be more difficult than the other options I had at Bloc, and I chose it because I really wanted to challenge myself.  I figured if I really struggled with the hardest app for my first Rails app that didn't involve a step-by-step tutorial, then I could build anything afterwards.  

### Problem:
I ran into several errors for the first time while building this app.  Some of them include: installing Rails, installing Rspec, and deploying to Heroku (production).

Blocipedia also introduced me to many gems for the very first time:
* Devise - for user sign in/out
* Pundit - for authorization of the three user roles: standard/free, premium, and admin
* Faker - for seeding the development database
* Stripe - for charging users to upgrade from a standard to premium account
* Redcarpet - for adding Markdown syntax for users to use in their wikis

### Solution:
I learned how to really read error messages, how to google for the solutions, and even putting trust that good error messages do indeed exist.  Often times, error messages will tell you how to fix the error, and my mentor had to remind me several times just to trust in what I have been given.  This is a skill I had to hone in on, but eventually learned to have in my coding tool belt.  Now it's definitely the first thing I rely on when I am troubleshooting.

I also learned how to study README's for gems.  I admit to installing a few gems without properly reading all the documentation on how to install and use the gems, and after making this mistake a few too many times, I learned a good lesson on never doing that again.  README's provide a wealth of information and it is a fool's errand to try to install something without being fully read up on this precious information.

### Results:
After a good struggle with deploying Blocipedia to Heroku, I have finally successfully pushed this app to production and have had a few friends tinker around with the app.  First notes in are that the app is not as user friendly or clear as to how to use the app.  These are great notes as I continue my education at Bloc.  Since I haven't learned front end development yet, I'm really just happy that no one has found anything broken with the way this app has been built.  That means that I have built this app well enough from a back end perspective.  Please checkout my app here and let me know what you think: [Blocipedia](https://murmuring-mountain-47468.herokuapp.com/)

### Conclusion:
I have mostly completed the web development/back end portion of my studies, which teaches me how to build the back end of an app using Ruby on Rails.  When I learn more about front end development in my next lessons at Bloc, I hope to make the app look more user friendly and add some more copy to help the user understand how to use this app.

I really cut my teeth on Blocipedia and while it doesn't look like the most polished app (yet), I am really proud of it.  The app helped me realize that I could indeed struggle and struggle with coding and yet find myself at the end of the journey with an app that works.  Learning to code can be a very difficult task, but it's projects like this one that make the journey feel worthwhile.  It wasn't an easy project to start off with, but it certainly gave me plenty of confidence to start my next project with less fear and more knowledge.
