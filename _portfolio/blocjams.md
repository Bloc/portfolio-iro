---
layout: post
title: BlocJams
feature-img: "img/sample_feature_img.png"
thumbnail-path: "https://d13yacurqjgara.cloudfront.net/users/3217/screenshots/2030966/blocjams_1x.png"
short-description: BlocJams is a music player similar to Spotify.

---

Music is a very personal expression of identity for many people. BlocJams was built with user experience in mind, and with its personalized feel, I am happy to include it in my portfolio of work.

BlocJams is my first deployed web application, built in the fall of 2016 to showcase my knowledge of JavaScript as I work my way through the Bloc curriculum. The overall design of the site was determined by Bloc for me to implement.

***

### Requirements
I was tasked with building a music library similar to Spotify that provides a good user experience and simple interactivity. It also needed to be aesthetically pleasing.

The site needed to be simple for a new user to understand. In order to provide a good experience where the user can easily determine how to use the site, I didn’t clutter up the page with unnecessary content. I also used well-recognized symbols from the <a href="http://ionicons.com/" target="_blank">Ionicons font library</a> to create the music player buttons.

BlocJams needed to be deployed quickly and with a small file size to accomplish fast page loading. In order to accommodate these requirements, most functions of the site were built with jQuery, which allowed for less code and quicker page load. Audio-related functions were built with the Buzz library in order to manage the sound functions.

### Problem
Another problem with the user experience of the album page involved the song lengths and the current time on the seek bar. The songs displayed their current and total times in seconds with two decimal places. This wasn't a very appealing way to provide the length of a song.

### Solution
In order to fix the song times, I used a filter function to convert the seconds format into a user-friendly (MM:SS) format:

{% highlight javascript %}
var filterTimeCode = function(timeInSeconds) {
    var mins = Math.floor(parseFloat(timeInSeconds) / 60);
    var secs = Math.floor(parseFloat(timeInSeconds)) % 60;
    if (secs < 10) { secs = "0" + secs; }
    return mins + ":" + secs;
};
{% endhighlight %}

I then called the `filterTimeCode` function at the end of each song row, as well as below the seek bar:

{% highlight javascript %}
for (var i = 0; i < album.songs.length; i++) {
        var $newRow = createSongRow(i + 1, album.songs[i].title, filterTimeCode(album.songs[i].duration));
        $albumSongList.append($newRow);
    }
{% endhighlight %}

This provided me with the correct display.

### Conclusion
In the end, BlocJams played as it should, after some tweaks. Though it's relatively simple from a user's perspective, this project taught me a lot about JavaScript, particularly the complexity of seemingly simple web applications.