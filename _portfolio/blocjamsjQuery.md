---
layout: post
title: BlocJamsjQuery
thumbnail-path: "img/BlocJamsjQuery.png"
short-description: BlocJams in jQuery is a replica to Spotify
---
<style>
 h2, h3{
    text-align: center;
 }
 
 p {
    text-align: center;
 }
 

</style>
<h2>Welcome to Bloc Jams made with jQuery my first project created as a Web Developer!</h2>

{:.center}
![]({{ site.baseurl }}/img/BlocJamsjQuery.png)

<h2>The Highlight Of The Project: The Media Player</h2>
This is the area where I spent most my time developing and sharpening my JavaScript skills.
![]({{ site.baseurl }}/img/BlocJamsPlayer.png)

There was a strong *emphasis* here on using **clean** code to help make my website load **faster** and these are some examples of **code _blocks_** I used:

### Code I used to set the volume of my playerbar in JavaScript!

{% highlight javascript %}
var setVolume = function(volume) {
    if (currentSoundFile) {
        currentSoundFile.setVolume(volume);
    }
};
{% endhighlight %}

<br>

### Code I Used to update my playerbar with jQuery!

{% highlight javascript %}
var updatePlayerBarSong = function() {

    $('.currently-playing .song-name').text(currentSongFromAlbum.title);
    $('.currently-playing .artist-name').text(currentAlbum.artist);
    $('.currently-playing .artist-song-mobile').text(currentSongFromAlbum.title + " - " + currentAlbum.artist);

    $('.main-controls .play-pause').html(playerBarPauseButton);
};
{% endhighlight %}

<br>

## Another Example Of Something I Created!

![]({{ site.baseurl }}/img/BlocJamsAlbums.png)

This is where I experimented with loops to generate multiple albums.

## My Thougths on the Project

This was my *first* project and *introduction* to becoming a Web Developer and I got exposed to a variety of *techniques*, **(HTML, CSS, JavaScript, DOM Scripting, jQuery)** all of which will only further my skills as a developer. It was challenging at first but I got to experience what it took to become **better** at web development. From feeling *down* when you're stuck trying to construct code that works **to** the *euphoric* feeling you get when you've created something with a `block of code`. All in all this was a great experience for me and without a doubt this is the future that awaits me and the present thing keeping me busy(Coding of Course). I learned how to structure code in a format that is **DRY** (Don't-Repeat-Yourself) and keep them **clean** and **easy** to read. The **building** blocks of using functions and *thinking* with **logic** to get my codes to work. These are just the foundamental tools I acquired to start working on my next project, so stay tuned for many future posts to come! 