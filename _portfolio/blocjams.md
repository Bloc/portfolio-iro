---
layout: post
title: BlocJams
date: April 4, 2017
feature-img: "img/Screenshot 2017-07-09 17.57.33.png"
thumbnail-path: "img/Screenshot 2017-07-09 18.00.59.png"
short-description: BlocJams - This is my jam!

---
This HTML5/CSS/JavaScript project involved building a simple static content webpage that provides the skeleton for a more complex web application (a music streaming site). I knew, starting out, that much of the content was going to be review for me, but I also knew that it was going to be helpful to revisit and explore the fundamentals of JavaScript, HTML, and CSS and I was looking forward to it.

---

## The Basics

The first version of BlocJams (I went on to create two others), was built on core JavaScript (no fancy libraries). Such constraints gave me the opportunity to understand what other frameworks and libraries were using under the hood, as well as appreciate the kinds of problems they sought to address. Indeed, I found myself writing some small functions to perform repetative tasks that JS libraries like jQuery also provide (like `forEach()` on arrays and `numberPad`).

```javascript
// Function to pad a number with the zeros until it is as many characters long as desired.
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

I was able to move through the project fairly quickly, which gave me the opportunity to get a bit creative with the code. I'm very interested in code optimization, so I worked to refactor certain things, and make it appear as though the app had more 'dynamic' content. This included adding the ability to specify an 'album id' in the album URL so that clicking on a thumbnail in the collections page sent you to the appropriate album page.

![logo](/img/Screenshot 2017-07-09 18.38.16.png)

## Functional and Beautiful

My experience with CSS allowed me to add several minor aesthetic enhancements and make the site feel a bit more 'alive'. I added equalizer sound bars to the currently 'playing' track as well as a 'floating' arrow on the home page, indicating there was more content below the fold.
