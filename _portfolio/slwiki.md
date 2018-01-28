---
layout: post
title: SLWiki
feature-img: "img/hubble_img.jpg"
thumbnail-path: "img/slwiki/slwiki_edit.png"
short-description: A Rails app to create public and private markdown wikis.

---
SLWiki creates public and private markdown wikis. Use them to keep track of recipes, organize your baseball cards or comics, or create cheatsheets to help you code better!

Try it out here: [SLWiki](https://shielded-falls-24557.herokuapp.com/)

View the code at [SJl149/slwiki](https://github.com/SJl149/slwiki)

{:.center}
![]({{ site.baseurl }}/img/slwiki/slwiki_landing.png)

## Explanation
The purpose of this project was to deepen my understanding of Rails and learn how to integrate important dependencies including:
+ **Devise** for user authentication.
+ **Stripe** which allows users to update to premium accounts.
+ **Pundit** creates policies to control access to private wikis.
+ **Redcarpet** facilitates markdown processing.

It was built with **Ruby 2.4** and **Rails 4.2.8**.

{:.center}
![]({{ site.baseurl }}/img/slwiki/slwiki_view.png)

Through working on this project, I learned how to create users and set up the logic for topics, posts, comments, and votes. Stripe and devise integration are important skills, and working through the documentation helped me understand how they work.

{:.center}
![]({{ site.baseurl }}/img/slwiki/slwiki_edit.png)
