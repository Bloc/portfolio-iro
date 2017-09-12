---
layout: post
title: BlocJams
feature-img: "img/blocjamsangularlanding.png"
thumbnail-path: "/img/blocjamsangularlanding.png"
short-description: BlocJams plays music using jQuery!

---
{:.center}
![]({{ site.baseurl }}/img/blocjamsangularlanding.png)

{:.center}
![]({{ site.baseurl }}/img/blocjamsangularplayer.png)

{:.center}
![]({{ site.baseurl }}/img/blocjamsangularmobileview.png)
# Summary
BlocJams is a music library/player built with jQuery. There are three pages. The landing, the album collection, and the album page where songs can be selected and played. It collapses nicely into a mobile view.
# Explanation
This was my introduction to jQuery.
# Problem
The most notable part of the landing page for me is how the icons pop up, adding a bit of user interaction.
In the album playing page, I needed several functions so that the play icons would toggle as the user moved over them.
The seek bars actually took a bit of work to create.
# Solution
{% highlight javascript %}
var scrollDistance = $('.selling-points').offset().top - $(window).height() + 200;

  $(window).scroll(function(event) {
      if ($(window).scrollTop() >= scrollDistance) {
        animatePoints();
      }
  });
{% endhighlight %}
Here the jQuery allowed me to access html elements through their class names. The `.scroll()` jQuery method is an event listener attached to the actual browser window. When the user scrolls they will trigger this listeners *event handler* - a conditional statement references the `var scrollDistance` to see if the window has scrolled 200px down. If it has it calls *animatePoints*. This function reveals the 3 points.
I have another *event listener* set to call *animatePoints* incase the page loads so that the points should already be visible - (`$(window).height() > 950`).
{% highlight javascript %}
var onHover = function(event) {
          var songNumberCell = $(this).find('.song-item-number');
          var songNumber = parseInt(songNumberCell.attr('data-song-number'));

          if (songNumber !== currentlyPlayingSongNumber) {
              songNumberCell.html(playButtonTemplate);
          }
      };
{% endhighlight %}
This is the function I created, *onHover*, toggles the song number into a play button when the user hovers over it, unless it is already playing. In `var songNumberCell`, `$(this)` will apply to whichever song is being hovered over. So the jQuery functionality here is pretty useful. The *onHover* function is paired with another function to deactivate each instance of the listener - *offHover*.
{% highlight javascript %}
$seekBars.find('.thumb').mousedown(function(event) {
        var $seekBar = $(this).parent();

        $(document).bind('mousemove.thumb', function(event) {
            var offsetX = event.pageX - $seekBar.offset().left;
            var barWidth = $seekBar.width();
            var seekBarFillRatio = offsetX / barWidth;

            if ($(this).parent().attr('class') == 'seek-control') {
                seek(seekBarFillRatio * currentSoundFile.getDuration());
            } else {
                setVolume(seekBarFillRatio * 100);
            }

            updateSeekPercentage($seekBar, seekBarFillRatio);
        });

        $(document).bind('mouseup.thumb', function() {
            $(document).unbind('mousemove.thumb');
            $(document).unbind('mouseup.thumb');
        });
    });
{% endhighlight %}
So this code block actually works on both the seek and volume bars. The conditional statement in the middle distinguishes which bar is being manipulated by checking the *class* of the elements *parent* using the jQuery *.attr()* method. Maybe a bit humorously, the *.bind* listener at the bottom of the block needs to be *unbinded* in it's own code.
# Results
I mostly used the jQuery documentation and searched around on Stack Overflow when I ran into errors.

# Conclusion
This was a cool project. I like the way jQuery works - using class names to access elements. It saves time in development, however I understand that it also comes with the cost of being "heavier" on performance and load times. For this reason it seems jQuery is being used less and less. There are some jQuery light libraries that are still useful. Also, the way event-handlers work is pretty cool and since I refactored this project into AngularJS I got to see how handlers compare to role of controllers.
