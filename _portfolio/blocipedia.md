---
layout: post

title: Blog
feature-img: "img/edit_wiki.png"
thumbnail-path: "img/blocipedia_index.png"
short-description: Blocipedia!

---
 The Blocipedia project was designed to understand how blog pages work. 
 
 ___

*Here is the index page that includes a register menu; listing current user, their role, and options such Editing and Upgrading the users role. It also provides a menu bar that currently has two primary links: Calendar and Change Events.*
{:.center}
![]({{ site.baseurl }}/img/blog_entry.png)

---

Account upgrade link to Stripe.

{:.center}
![]({{ site.baseurl }}/img/link_to_stripe
.png)

___

Edit registration page. This page was setup with Devise gem for authentication.   

{:.center}
![]({{ site.baseurl }}/img/edit_reg
.png)

---

Upgrading account with Stripe. A plug and play recurring billing solution for members.

{:.center}
![]({{ site.baseurl }}/img/stripe_pay.png)

___

This was a good exercise for using CRUD. Also, incorpated the Pundit gem for authorization of roles.
Used the Faker gem to generate random fake data for both users and wikis. Redcarpet gem to parse Markdown syntax. Replicated the code in HAML. A shorter, simpler form.   

