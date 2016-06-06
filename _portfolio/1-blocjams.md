---
layout: case_study
title: Bloc Jams
feature-img: "img/blocjams.jpg"
thumbnail-path: "img/blocjams_thumbnail.jpg"
short-description: First Angular project. Yay!
github-repository: orlando21/ng-bloc-jams
demo-url: http://ng-bloc-jams.herokuapp.com

---
The Foundation portion of Bloc's [Frontend Web Development Course](https://www.bloc.io/frontend-development-bootcamp) teaches HTML5, CSS3, JavaScript, and jQuery by having students build a digital music player from the ground up. The app is built iteratively over many checkpoints starting with HTML/CSS and adding vanilla JavaScript before converting it to jQuery.

After the Foundation I chose to convert or "port" the app to AngularJS (this project).

### Method

Since I had just finished the jQuery version of Bloc Jams during the Foundation, I was of course already familiar with the app's features and structure.

As in the Foundation, I built the app over a series of checkpoints that explained different aspects of developing single page applications. My Bloc mentor at Bloc provided guidance where needed.

### Challenge

The challenges of this project were the learning curve and the implementation. I found single page applications to be different in many ways from the more "standard" DOM scripting I had learned. Understanding concepts such as Angular's model-view-controller paradigm and configuring dependencies for things like the local server were necessary to get the app running.

And as always there was a lot of debugging and problem solving when things didn't quite work as expected.

### Solution

Below are the main steps taken to convert the app to a single page application in Angular.

#### 1. Configuration

Configuration was necessary for setting up a local server to intercept requests and serve the relevant pages. For this, Bloc provides its [Frontend Project Starter](https://github.com/Bloc/bloc-frontend-project-starter) that can be cloned locally. This requires NodeJS package manager (`npm`) for installing dependencies, as well as the Grunt command line task runner.

Grunt third-party plugins such as `grunt-contrib-watch` had to be additionally installed. Among other things, much configuration effort went into the `Gruntfile.js` to enable features like the `watch` function.

The result was this directory structure, with the SPA living in the `app` subfolder.

```
├── Gruntfile.js
├── LICENSE
├── Procfile
├── README.md
├── app
│   ├── assets
│   │   └── images
│   │       └── bloc-logo-white.png
│   ├── pages
│   │   └── index.html
│   ├── scripts
│   │   └── app.js
│   ├── styles
│   │   └── style.css
│   └── templates
│       └── home.html
├── package.json
└── server.js
```
In addition:

1. Styles from the app's jQuery version (CSS) were migrated.
2. The app was prepared for Angular by including the Angular script file/library, declaring a main Angular module and linking this module to the app via the `<html>` tag using the built-in directive `ngApp`:

{% highlight html %}
<html ng-app="blocJams">
{% endhighlight %}

#### 2. Angular concepts

This project gave me the opportunity to learn about Angular concepts such as:

1. Routing (with UI-Router) and states for dynamic display of elements and templates. This included use of Angular provider services to configure state behavior and URL routing.
2. Templates for combining HTML markup with Angular markup and directives to render dynamic views in the browser.
3. Controllers for encapsulating the app's logic and binding it to `$scopes`. Controllers determined, for example, how the app behaved when a user clicked a button.
4. Services (singletons) and can be accessed anywhere in the app (e.g., by controllers). An example of a service in Bloc Jams is `Fixtures.js` which contains all music albums. This service is used at various points in the app to retrieve album information and has a constant state throughout the application (e.g., there's only one global instance). Another service is `SongPlayer.js` which provides global variables such as `song.playing` to keep track of the currently playing song in the app.
5. Common directives (both for the Angular core library and specific to UI-Router) such as `ui-view`, `ng-click` and more.

The result can be seen in the [demo](http://ng-bloc-jams.herokuapp.com/).

#### 3. Some features

{:.center}
![]({{ site.baseurl }}/img/blocjams.png)

1. Click on a song number to play a song (pause button is displayed). The transition between buttons is handled by an Angular template and directive.
2. The player bar is always displayed at the bottom of the app. It's handled by an Angular template and controller.
3. The seek bar is constantly updated with the song's play progress. It's handled by an Angular directive template. The functionality incorporates a `mousedown` event to allow users to play any point in a song.
4. The volume bar works on the same principles as the seek bar.

#### 4. Third-party libraries

 Besides the usual Angular libraries, the app used the [Buzz music library](http://buzz.jaysalvat.com/), a Javascript HTML5 audio library that wraps `mp3` files and makes them JS objects. This allows applying states like play, stop, and pause, setting song volume, etc., through methods.

### Lessons

This project taught the basics of Angular but one poignant lesson for me was the difference between imperative and declarative languages. With normal JS and languages like Java, you're using commands to direct an application's logic. That's normally the way I've always been taught to code.

The declarative style of Angular, where you just express what you want without specifying how to get it, seemed at first very abstract and somehow hard to grasp. On top of that, this was my first exposure to any language using a model-view-controller architecture. Among the prerequisites that Bloc recommended before starting the course, there were some learning modules on Angular, but in truth I hardly understood what was going on. This project was very helpful in clarifying how Angular works.
