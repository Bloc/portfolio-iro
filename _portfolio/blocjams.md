---
layout: post
title: BlocJams
date: April 4, 2017
feature-img: "img/Screenshot 2017-07-09 17.57.33.png"
thumbnail-path: "img/Screenshot 2017-07-09 18.00.59.png"
short-description: BlocJams is a website that helps lay the groundwork for an audio-streaming service using only JavaScript, HTML5, and CSS.

---
This HTML5/CSS/JavaScript project involved building a simple static content webpage that provides the skeleton for a more complex web application (a music streaming site). I knew, starting out, that much of the content was going to be review for me, but I also knew that it was going to be helpful to revisit and explore the fundamentals of JavaScript, HTML, and CSS and I was looking forward to it; And, although Bloc provides guides for most of the content, there were small ways that I was able to add some personal flare to BlocJams.

---

## The Basics

The first version of BlocJams (I went on to create two others), was built with vanilla JavaScript. This gave me the opportunity to practice essential pieces of the language and to understand what other frameworks and libraries were using under the hood. Beyond that, it helped me appreciate the kinds of problems that such packages seek to address. Indeed, I found myself writing some small functions to perform repetative tasks that JS libraries like jQuery also provide (like `forEach()` on arrays and `numberPad()` to format integers as strings with leading zeros).

```javascript
function numberPad(number, digits = 0) {
  var string = number.toString(),
      i;
  for (i = 0, digits -= string.length; i < digits; i++) {
    string = "0" + string;
  }
  return string;
}
```

---

## Branch Out

I was able to move through the project fairly quickly, which gave me the opportunity to get a bit creative with the code. I'm very interested in code optimization, so I worked to refactor certain things, and make it appear as though the app had more 'dynamic' content. This included adding the ability to specify an 'album id' in the album URL so that clicking on a thumbnail in the collections page sent you to the appropriate album page. This is a minor enhancement, but it laid the groundwork for a web application that could be fueled by a robust backend database.

{:.center}
![URL query language for album pages]({{ site.baseurl }}/img/Screenshot 2017-07-09 18.38.16.png)

---

## Functional and Beautiful

My past experience with CSS allowed me to add several minor aesthetic enhancements and make the site feel a bit more 'alive'. I added equalizer sound bars to the currently 'playing' track as well as a 'floating' arrow on the home page, indicating there was more content below the fold. These subtle visual additions, rather than detract from the content, actually enhance the user experience (though perhaps in ways that become more clear when there is actually music playing).
