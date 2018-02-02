---
layout: post
title: Bloc-Jams Project 2
feature-img: "/img/bloc_jams_img.png"
---

**SUMMARY:**
JQuery is a great tool for adding animation and effects to a page, but it is difficult to build a sophisticated frontend app with jQuery alone, so I used AngularJS, a javascript framework for building dynamic web apps, to refactor Bloc Jams that was originally built using javascript and jQuery in my first project.

**EXPLANATION:**
I configured *routing and states* to facilitate *single-page applications*, so that the browser doesn't have to reload the entire page when user navigates to a different page on the site.

The templates created using javascript and jQuery for the Bloc-Jams application were fine tuned using Angular's *Declarative view manipulation*.

I used *controller object* to communicate between controller and view, making it possible to define javascript code for a particular DOM element.

I used *Angular services* that are objects that share data and behavior across several components (controllers, directives, filter etc.)  To use the service, I injected it as a dependency for the component that depends on the service.

I used *Directives* to bind Angular functionality to HTML on a page.

I used *Angular's built-in filters* to format data.

>***PROBLEM LIST***:
1. Lot of redundant code where each of the pages were sharing the same basic structure and navigation.
2. Browser had to load a new HTML document when a user navigates between pages, which can result in a slow experience.

***Solution:***
With Angular, I pulled the shared HTML into one global file and each of the unique fragments into separate templates, templates in this context are HTML documents with Angular markup. I used ui-view directives in the global file with the help of an external module known as UI-router that tells Angular where to place the templates when they are requested. I configured states and paths with Angular's *state and location provider*, components of UI-router.



>***PROBLEM LIST:***
After establishing the basic views for Bloc-Jams, I discovered that the song list in the album view; however, was missing the onHover and offHover ability that I wrote in the first project, I was also missing crucial aspect of my application, the player bar.

***Solution:***
Instead of using jQuery's imperative view manipulation to create onHOver and offHover function, I declared this functionality in the view using Angular's ngShow directive.

Before I could add the declarative code, I needed to decide what to show and when to show it. ngShow in my coding helped serve this purpose.

When I converted Bloc-Jams to an SPA, I removed the player bar, so now I used Angular to create a player bar template and included it in the Album view using Angular directive, ngInclude.

>***PROBLEM LIST:***
In project 1, the collection view uses a *"for loop" and jQuery's append()* to add a specified number of albums to the collection view.  I needed to refactor this, because the jQuery code will break within the Angular application.

***Solution:***
I created a controller for the collection view, registered the controller.  Instead of using jQuery to append images, I bind the data from the album object to the collection template.  After I bound the album data to the collection controller using angular.copy() method, I needed to update template to access the necessary info and display multiple albums, which I did by adding an ngRepeat to the template, *ngRepeat instantiates a template once per item from a collection*.

>***PROBLEM LIST:***
Controllers have a specific role in an application and do not share code or state between each other.

***Solution:***
I used Angular services for that purpose.  Angular services share data and behavior across several component and we inject it as a dependency for the components that depend on the service.

I created custom services and registered them the same way as I registered controllers by calling a function on the application module.  I created service to pull the album data into my application and added a public getAlbum method to the service.  I injected the service into the controller.  Once injected, the service was available for use within the controller.

>***PROBLEM LIST:***
With the current play method, I could play all the songs on the album simultaneously, but that is not the expected behavior of a music player.

***Solution:***
Using Angular, I updated the play method with a condition that checks if the currently playing song is not equal to the song the user clicks on.  

If the currently playing song is not the same as the song the user clicks on then I want to:
1. Stop the currently playing song if there is one.
1. Set a new Buzz sound object.
1. Set the newly chosen song object as the current song.
1. Play the new Buzz sound object.

>***PROBLEM LIST:***
I could play and pause songs without issue, but it was not reusable.

***Solution:***
I refactored some parts of the code to make it reusable.  I extracted parts of the code from the play method and created a setSong function to handle them.

>***PROBLEM LIST:***
I could play and pause song from the song row in the Album view, but what about the player bar?.

***Solution:***
The player bar is a separate entity from the album view, so I created a controller for it, registered it, and updated the template to clearly declare the play and pause buttons of the player bar in the view.

>***PROBLEM LIST:***
Being able to play and pause from the player bar is one victory, but I needed to implement the ability to move between songs with next and previous buttons.

***Solution:***
I created nextSong and previousSong functions in a songplayer service.  To move between songs I needed to know the index of the song object within the songs array.  I wrote a series of code to achieve this functionality within the 2 functions.

>***PROBLEM LIST:***
I needed to create a Directive to handle the seekbars for Bloc Jams.

***Solution:***
Within the player bar HTML I found both instances of the seekbar element and replaced them with my custom seekbar directive, added logic to the seekbar directive i.e. update the seekbar from a click event and a mousedown event.

>***PROBLEM LIST:***
I could drag and click on the seek bar, but they are not yet functional.  When I interact with the seekbars, I needed to change the song position and the volume.

***Solution:***
My coding involved passing attributes to the directive, observe attribute changes, set the playback position of the song, evaluate the on-change expression, pass updated value to OnChange, broadcast the time change to the application and got the seekbar to update as the song plays.

>***PROBLEM LIST:***
The seek bar now updates as a song plays, but the song playback and total time are still represented in seconds, which is not the way we would normally view the duration of a song.

***Solution:***
To solve this I added an Angular filter.  I created a timecode filter, used filter functions to return another function which takes at least one argument, the input of the filter; in this case the input is seconds.  I took the number of seconds and converted into a time-readable format.  I used the timecode filter in the view.

This is an example of a post which includes a feature image specified in the front matter of the post. The feature image spans the full-width of the page, and is shown with the title on permalink pages.
