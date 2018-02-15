---
layout: post
title: BlocJams
date: April 4, 2017
feature-img: "img/blocjams_playback_dark.png"
thumbnail-path: "img/blocjams_logo.png"
short-description: BlocJams is a simple audio-streaming web application (à la Spotify) built only on JavaScript, HTML5, and CSS.
published: true
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

I was able to move through the project fairly quickly, which gave me the opportunity to get a bit creative with the code. I'm very interested in code optimization, so I worked to refactor certain things, and make it appear as though the app had more 'dynamic' content. This included adding the ability to specify an 'album id' in the album URL so that clicking on a thumbnail in the collections page sent you to the appropriate album page.

Adding this functionality required a bit of research to understand how URL query parameters worked and how to leverage them for my particular use. I wrote a `getHtmlQueryAsJson()` function to parse the URL query (a string) and return an object with properties that I could reference as indeces in the array of albums.


```javascript
function getHtmlQueryAsJson () {
  var params = location.search.substring(1).split('&'),
      param,
      result = {};
  for (param of params) {
    param = param.split('=');
    result[param[0]] = param[1];
  }
  return result;
}
```

This was a minor enhancement, but it laid the groundwork for a web application that could be fueled by a robust backend database. Additionally, it made what was a static web page, look and feel as though it was more.


![URL query language for album pages](/img/blocjams1_album2.png)


---

## Functional and Beautiful

My past experience with CSS allowed me to add several minor aesthetic enhancements and make the site feel a bit more 'alive'. I added equalizer sound bars to the currently 'playing' track as well as a 'floating' arrow on the home page, indicating there was more content below the fold. These subtle visual additions, rather than detract from the content, actually enhance the user experience (though perhaps in ways that become more clear when there is actually music playing).


|![URL query language for album pages](/img/blocjams_album3.png)|![URL query language for album pages](/img/blocjams_landing1.png)|

---

## That's a Wrap!

Developing this simple 'mock-up' of a music streaming app provide the opportunity to revisit some of the cornerstones of web development. Any real-world project will involve many of the individual pieces that went into this site: responsive design, DOM navigation, HTML5 tags, block and inline elements, and more. I enjoyed being able to build something fun like BlocJams while reviewing the fundamentals that will continue serve me throughout my career.
