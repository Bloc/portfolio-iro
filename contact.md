---
layout: page
title: Contact
permalink: /contact/
feature-img: "img/color.png"
---

<form action="https://getsimpleform.com/messages?form_api_token=740d755f14cf2db8914d5d1a5a527d76" method="post">
  <!-- the redirect_to is optional, the form will redirect to the referrer on submission -->
  <input type='hidden' name='redirect_to' value='{{ site.url }}/thank-you/' />
  <input type='text' name='name' placeholder='Your Full Name' />
  <input type='email' name='email' placeholder='Your E-mail Address' />
  <textarea name='message' placeholder='Write your message ...'></textarea>
  <input type='submit' value='Send Message' />
</form>
