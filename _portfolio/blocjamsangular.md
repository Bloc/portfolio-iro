---
layout: post
title: BlocJamsAngular
feature-img: "img/blocjamsangularlanding.png"
thumbnail-path: "https://d13yacurqjgara.cloudfront.net/users/3217/screenshots/2030966/blocjams_1x.png"
short-description: BlocJams refactored with angularJS!

---
{:.center}
![]({{ site.baseurl }}/img/blocjamsangularlanding.png)

{:.center}
![]({{ site.baseurl }}/img/blocjamsangularplayer.png)

{:.center}
![]({{ site.baseurl }}/img/blocjamsangularmobileview.png)

# Summary
BlocJamsAngular is a music library/player, originally developed using JQuery, now refactored with AngularJS. It has a smooth transition into mobile view and a nice player bar with track-time and volume controls.
# Explanation
This was my first experience with AngularJS. Using it's M.V.C. model turned all the lengthy JQuery from the original BlocJam into a better organized and more easily maintained code base. It also improved loading times and data use.
# Problem
Instead of having to load a new page each time the user switched, I wanted to use an Angular config module to switch between states, staying on the same page.

Setting up the player bar took at bit of time, because it has several different operations.
# Solution
{% highlight javascript %}
        $stateProvider
            .state('landing', {
                url: '/',
                controller: 'LandingCtrl as landing',
                templateUrl: '/templates/landing.html'
            })
            .state('album', {
                url: '/album',
                controller: 'AlbumCtrl as album',
                templateUrl: '/templates/album.html'
            })
            .state('collection', {
                url: '/collection',
                controller: 'CollectionCtrl as collection',
                templateUrl: '/templates/collection.html'
            });
{% endhighlight %}
I used Angular's $stateProvider to neatly set up all of the different views the app has. The *landing* state uses `url: '/'` since it is the default state. Each state is associated with it's template and it's controller.

{% highlight javascript %}
SongPlayer.play = function(song) {
          song = song || SongPlayer.currentSong;
          if (SongPlayer.currentSong !== song) {
              setSong(song);
              playSong(song);
          } else if (SongPlayer.currentSong === song) {
              if (currentBuzzObject.isPaused()) {
                  playSong(song);
              }
          }
      };
{% endhighlight %}
This function plays the music. There are also previous, next, and pause functions which all look about the same. Here currentSong stores which song will play. If the song, `(song)`, isn't already set in *currentSong* then two functions are called. One to set and one play the new tune. Otherwise, the selected song must be the same one already saved in *currentSong*, so it plays after using `currentBuzzObject.isPaused()`, a method from the Buzz API.

{% highlight javascript %}
var calculatePercent = function(seekBar, event) {
          var offsetX = event.pageX - seekBar.offset().left;
          var seekBarWidth = seekBar.width();
          var offsetXPercent = offsetX / seekBarWidth;
          offsetXPercent = Math.max(0, offsetXPercent);
          offsetXPercent = Math.min(1, offsetXPercent);
          return offsetXPercent;
      };
{% endhighlight %}
This function handles some of the mechanics for both the track-time and volume bars. Using *.pageX* allows the user to use the bars without having to actually keep the mouse directly inside the bar, which would be really annoying.

# Results
Testing involved a lot of checking the Angular documentation, and also looking around on sites like W3, MDN, and Stack Overflow for possibilities and best practices for all of the functions I had to develop for this project.

# Conclusion
This project had a lot more moving pieces to set up as the developer than the jQuery version. It took a bit of 'stringing beads', making sure that arguments were congruent between templates, controllers, filters, and services. At first it was difficult just trying to figure out how to organize all of the different functions, which ones needed to go together or how they could be accessed through Dependency Injections. I learned to organize these by thinking about whether an attribute or function was private or public.
