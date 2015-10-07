---
layout: post
title: Bloccitoff
feature-img: "img/Bloccitoff_Feature.jpg"
thumbnail-path: "https://s3-us-west-2.amazonaws.com/lgreen-bloccitoff-prod/Bloccitoff+Screenshot.png"
short-description: Bloccitoff is a simple web-based checklist for things to do.

---
Bloccitoff is a simple web app that allows you to create a list of things to do. Every item that is added to the list must be completed within 7 days. If you complete them before then, you can mark them as done. Otherwise, they will be automatically wiped after that time.

### What can a user do?

Bloccitoff is a very simple web-app. The user has the ability to:

* Sign up and create an account
* Add items to their list of things to do
* Mark items as done
* Personal details can be changed by the user at any time (authentication will be re-verified via password)

### How did we improve it?

To speed up the process and improve user experience, both the create and destroy actions have been Ajaxified. As soon as the user adds an item to their list, the item will show up right away, along with the time left displayed on the right side. 

### Results

* User Authentication is handled using the Devise gem, which provides a complete and flexible solution
* SendGrid was used to email users and have them confirm their accounts
* Ajax was implemented to create and destroy items in the list, improving the speed and overall user experience 
* Automated Rake task implemented to delete items after 7 days ([Whenever gem](https://github.com/javan/whenever))

### Screenshots

![alt text][logo]

[logo]: https://s3-us-west-2.amazonaws.com/lgreen-bloccitoff-prod/Screen+Shot+2015-09-28+at+4.09.46+PM.png "Bloccitoff Screenshot 1"

![alt text][logo2]

[logo2]: https://s3-us-west-2.amazonaws.com/lgreen-bloccitoff-prod/Screen+Shot+2015-09-28+at+4.09.59+PM.png "Bloccitoff Screenshot 2"

![alt text][logo3]

[logo3]: https://s3-us-west-2.amazonaws.com/lgreen-bloccitoff-prod/Screen+Shot+2015-09-28+at+4.10.11+PM(2).png "Bloccitoff Screenshot 3"

[Link to Project](https://liz11-bloccitoff.herokuapp.com/)