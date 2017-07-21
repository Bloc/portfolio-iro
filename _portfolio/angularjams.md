---
layout: post
title: AngularJams
date: June 10, 2017
feature-img: "img/Screenshot 2017-07-09 17.57.33.png"
thumbnail-path: "img/Screenshot 2017-07-09 18.00.59_3.png"
short-description: Creating an Angular version of BlocJams proved a fascinating paradigm contrast to the native JavaScript and React versions.

---

Having worked with Angular in the past, using it to re-write BlocJams felt somewhat like coming home. Though the homecoming rather like returning after an extended vacation! Everything was familiar, but I had just been immersed in the world of React. Angular was quite a contrast despite its familiarity and, admittedly, my previous exposure to Angular was not exactly 'extensive'. Revisiting this well-known JavaScript framework helped me grasp concepts that I had overlooked before or simply not understood very well. Additionally, I could now compare it with React, another popular Front-End development library.

---

## Angularizing

Angular's approach to SPAs is quite different from that of React. As such, basically the only things I could re-use from the React version of BlocJams in this project were the JSX (re-factored as HTML5 template files) and the CSS. That being said, certain Angular services also allow ES2015 `class` declarations for object prototypes, so I was able to use some of the 'guts' of the React class components as a starting point.

Diving into the Angular specifics, I immediately started learning tons about the various use-cases for the different types of services; how to organize my app, controllers, directives, and services into their own files for readability; and the ways in which the different pieces fit together into the MVC model. My basic familiarity with Angular truly allowed this project to be incredibly informative because I could really dive deep and begin to understand the Angular concepts in much more depth than otherwise would have been possible.

---

## Third Parties and Angular

My React version of BlocJams used a third party audio library called [`plyr`](https://github.com/hadley/plyr) for the audio playback functionality. Since I had become a bit familiar with this library, I decided to use it yet again for the Angular version. This was incredibly tricky, especially because I had come to understand how it worked within a React component, but struggled to replicate that exactly in Angular. Naturally, the complications all stemmed from the same situations that caused me such grief in the React version: using event listeners to update service properties so that dependent services/directives/controllers could use them to update their own HTML.

Although I tried several variations including using a directive's `link` function to bind an event listener, I finally landed on fully encapsulating the `plyr` functionality in a service that exposed the primary functionality of the library and offered an opportunity to both initialize the player (which relied to a certain extent on the DOM) and create the event listeners that would update the audio player's seek bar as the music played.

```javascript
class AudioService {
  ...
  init(player) {
    if (!player) throw "You must provide an instance of plyr.";
    this.player = angular.element(player)[0];
    this.player.on('timeupdate', this.positionUpdater)
      .on('$destroy', () => {
        this.player.off('timeupdate', this.positionUpdater);
        this.player.destroy();
      });
  }
  ...
}
```

That wasn't the whole solution, however - and this is where I got to dig much deeper into how Angular is constructed. The event listener in question was operating outside of the scope of any Angular component or element. As such, it was not triggering the necessary Angular events for updating the DOM to match the properties they represent. The remediation for this was to explicitly tie the event listener actions to a `$scope`. Now, since I was using a Service, I didn't have access to a normal DOM scope like controllers or directives. Instead, I injected the Angular `$rootScope` service into my service. Now, with an Angular scope at my disposal, I could ensure that the event listener's changes were reflected in the corresponding DOM elements.

```javascript
class AudioService {
  ...
  this.positionUpdater = () => {
    if (!this.seeking) $rootScope.$apply(this.position = this.player && (this.player.getCurrentTime() || 0));
  };
  ...
}
```
---

## Extra Jam(s)

When the Angular version of BlocJams had reached the same level of functionality as the React version, I had an opportunity to have some fun with the Angular I had learned by adding some additional functionality. I loved the idea of being able to search the available songs and work with filtered arrays to provide a search field with 'autocomplete' functionality. While there was still no back-end to search through, nor a helpful organization of songs, I made do with what I had, extending the functionality of the `AlbumService` I had created previously to compile a list of all the songs. Then, I made a new directive for the search field and autocomplete results (complete with custom filter!).

![Navigation bar with search field](/img/Screenshot 2017-07-20 19.28.19.png)

The hardest part about the directive was binding the event listeners in such a way that the user interactions had the intended effect. This was made more difficult by the fact that I had to bind listeners differently on the `<input/>` field (where the keyboard would be used and `event.target` would represent the `<input/>` field rather than the desired item) than on the search results dropdown (where the mouse would be used to select the desired item).

```javascript
angular.module('blocJams').directive('songSearcher', ['Utilities', function(Utilities) {
    return {
      restrict: 'AE',
      replace: true,
      scope: {},
      templateUrl: '/templates/song-searcher.html',
      link: function(scope, element, attrs, Ctrl) {
        const results = element[0].querySelector('.search-results');
        let selected = results.querySelector('.selected'),
            newSelected;
        element.on('keydown mouseover',(event) => {
          if (event.keyCode === 38) //up arrow
            newSelected = Utilities.prev(selected || angular.element(results.children[0]));
          else if (event.keyCode === 40) //down arrow
            newSelected = selected ? (selected.next()[0] || selected[0]) : results.children[0];
          else if (event.type === 'mouseover')
            newSelected = event.target;
          else if (event.keyCode === 13) //return key
            Ctrl.navigate('album', { id: selected[0].dataset.album });
          else return;
          if (selected) selected.removeClass('selected');
          if (newSelected) {
            event.preventDefault();
            newSelected = angular.element(newSelected);
            if (!newSelected.hasClass('search-result-item')) return;
            selected = newSelected;
            selected.addClass('selected');
          }
        });
      },
      controller: ['AlbumService', '$state', songSearcherController],
      controllerAs: 'songSearchCtrl'
    };
  }]);
```

Afterward I discovered some (arguably) easier methods for implementing search autocomplete (like `<datalist>` or jquery-ui's `.autocomplete()` method), but I was pleased with the results of my efforts. It was simple, fit in the style of the web page, and would meet most users' expectations as far as search autocomplete fields go.

---

## React vs Angular

Writing the Angular version of BlocJams really helped me build a solid foundational understanding of Angular and how it can be used to build powerful apps. I found that Angular was a bit easier to wrap my mind around than React was; although I can't discount the advantage of having actually used Angular in the past. Dependency injection allowed me to easily and clearly share functionality between parts of my app. The difference between React and Angular here is that in React, you don't immediately know where a `prop` is coming from; the parent Component, yes, but it could also belong to any one of the ancestors. In Angular, since you inject the service into each component that needs it, you know immediately where it came from and don't need to jump through a hierarchy of Components to discover its origins.

That being said, I think that I ran into fewer 'errors' while building the React app and didn't have to do quite as much research to achieve what I was imagining. Additionally, I think my React implementation may have taken fewer hours overall to complete; I have this sense that it came together a bit more quickly. They both use significantly different approaches to front-end web development and I think it was incredibly rewarding to have experienced both, but I would need much more time getting comfortable with each before I felt confident that I was using them as intended and going about things 'the React or Angular way'.

I've heard that Angular 2 and 4 are completely different animals than their common ancestor and I'm excited to explore the differences. Perhaps they will incorporate some of the Component-model that React relies on so heavily such that the differences between the two will blur a bit. I can't wait to find out!
