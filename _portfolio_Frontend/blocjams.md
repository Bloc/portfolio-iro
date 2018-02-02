---
layout: post
title: BlocJams
thumbnail-path: "/img/bloc_jams_img.png"
short-description: BlocJams for iOS is awesome!
---

!['Bloc Jams'](/img/bloc_jams_img.png)

[BlocJams Link](https://blocjams-digitalmusicplayer.netlify.com/)

**SUMMARY:**
My foray into development of digital music player, **Bloc Jams**, on a web browser using:
* Java Script
* JQuery

**EXPLANATION:**

I used the basic HTML structure to set up the structure of Bloc-Jams application.  Used basic HTML tags, added styles to the landing page, add color, placement, icons, and other visual modifications to give it a modern appearance using *cascading style sheets*.

I used principles of *responsive web development* to define how Bloc Jams should look and function on mobile devices.  To view albums and play songs, I continued to use responsive classes to see a collection of available albums on collection view that we can play, so our album collection looks nice on a mobile device.

From the collection page user can choose an individual album and view more details about it for which I built an album view.  The album view included a cover image, info about the album, and HTML table of album's songs.

I implemented animation on the landing page using *DOM events* to call functions to run animation.  I used *DOM scripting* to dynamically generate as many albums as needed to display, used events and even handlers to control play/pause buttons, added music player to control song playback.

I refactored landing, collection, and album pages with ***jQuery, the helper library,*** to execute many common time-consuming tasks that simplify development.

I programmed usable seek bars to adjust the current time of the song and its volume.  Developed seek bars to update as the song plays and respond to mouse events.
