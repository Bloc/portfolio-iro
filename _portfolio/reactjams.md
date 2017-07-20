---
layout: post
title: ReactJams
date: May 14, 2017
feature-img: "img/Screenshot 2017-07-09 17.57.33.png"
thumbnail-path: "img/Screenshot 2017-07-09 18.00.59_2.png"
short-description: This re-write of BlocJams uses React and the plyr audio plugin to create a fully functional audio-streaming app.

---

The React paradigm allowed me to think in very different ways about how BlocJams was constructed and the ways in which the constituent parts interacted. Its 'component' model involved less separation between HTML and JavaScript and consider sections of a page as self-contained units with very explicit and intentional communication between them. This was exciting, but it also introduced significant challenges.

---

## ECMA Script 2015

In addition to working with the new methodology of React, I was also using features of ES 2015 to re-write BlocJams. This, in addition to a growing comfort native type methods allowed me to write JavaScript code that was more succinct while remaining easy to read and efficient. One aspect of ES 2015 that I was excited to use (where appropriate) with React was the Object prototype shorthand 'class'.

```javascript
class PlayerBar extends Component {
  constructor(props) {
    super(props);
    this.state = { volume: 5, position: 0 };
  }
  ...
}
```

While functional components were appropriate in other situations, I found it easier to think of component prototypes in an object-oriented fashion.

Another feature of ES 2015 that I used extensively was arrow functions. The ability to quickly and easily control a functions scope was a very welcome tool during this re-write.

```javascript
playPauseHandler = () => {
  this.setState(prevState => ({ playing: !prevState.playing }));
}
```

Other ES 2015 perks that featured prominantly in this project included: Object and Array deconstruction and initialization, Object.assign, template strings, let, and const. It was extremely fun to experience the benefits of these enhancements to JavaScript and compare them with the 'old way' of writing JavaScript.

---

## Challenges with React

Using React's component model to think about the BlocJams music streaming app facilitated many things. A components properties could easily be referenced to build a view that dynamically updated as the values behind those properties also did. However, the smaller the components got, the more they needed to depend on external information to update appropriately. This was a challenge, but a relatively small one. The bigger challenge emerged when these small components not only depended on external properties (form parent components), but also needed to be able to manipulate those properties and share them with yet more components.

My research led me to the conclusion that I needed to lift some properties 'up' in the component chain so that the 'owner' of a particular property like the status variable, `playing`, would be a common ancestor of every component that needed to reference it. Additionally, I had to pass functions as parameters down to sub-components so that they could modify the value of its parent's properties. Only then could all the various components truly be in sync with each other and agree on the overall 'state' of the application.

## Third Party Libraries

The challenges certainly didn't end there! I started out this project with the understanding that I would use the `plyr` audio library to provide the central functionality of BlocJams (playing music). Learning how to use the library was simple enough, but it needed to hook into the components in appropriate ways to that the page elements responded as the music played and/or as the user interacted with the control elements on the page (audio seek bar, play/pause buttons, next/previous buttons). The seek bar proved most complicated, because it qualified for both of these uses and needed to be updated regularly as a song was playing.

The `plyr` library broadcasts events as a songs playback position changes, so I needed to create event listeners that would update the component properties related to the seek bar's position. Now, as the user dragged the seek bar's control it also had to set a new position for the music playback. However, if a user and the `plyr` event were both trying to update the seek bar's position at the same time, it would make for a very frustrating experience indeed - the users dragging action would essentially have no effect because the broadcasted events happen so regularly, that they would always overwrite the user's changes. So, each time the user starts dragging the seek bar slider, the event listener would have to be torn down and re-created when the user stoped dragging.

```javascript
seekHandler = (event) => {
  this.setState({position: parseFloat(event.target.value)});
  document.removeEventListener('timeupdate', this.positionUpdater);
  if (this.seekTimer) {
    this.seekTimer = clearTimeout(this.seekTimer);
  }
  this.seekTimer = setTimeout(() => {
      this.player.seek(this.state.position);
      document.addEventListener('timeupdate', this.positionUpdater);
  }, 250);
}
```

The final challenge came when reviewing and refactoring the React version of BlocJams. With React, the code is broken into small components. With static content that's easy to read and quite semantic. However, with more complex and dynamic content, it can be very difficult to understand how component properties affect behavior as you flip from file to file simply to find out how one function call affects each dependent component. This wasn't really a problem with a development solution beyond trying to simplify component design as much as possible (fewer shared properties and state properties). That being said, as I spent more time thinking about and reading React components, it became marginally easier to visualize their relationships. Another tool that helped a bit was the React dev tool plugin for Chrome, which allows you to quickly navigate through the component tree and watch properties as they get updated.

{:.center}
![App playing music]({{ site.baseurl }}/img/Screenshot 2017-07-19 23.15.21.png)

---

## Jammin' Out

After overcoming all those obstacles, the React version of BlocJams was a fully functional music streaming application. It was extremely rewarding to be able to use it to actually listen to music while I ironed out the final kinks. Although it wasn't backed by a true database, it accomplished all the essential parts of any streaming service with efficacy. Coming into the project, I didn't know what to expect from React. My previous experience with AngularJS and KnockoutJS gave me a certain approach to creating SPAs. The component architecture itself was new, but relatively easy to wrap my head around - the appeal and benefits seemed clear to me. However, the JSX syntax, component state and properties, and leveraging events from within components were all things that challenged my assumptions about the MVC (Model-View-Controller) approach. I have always loved taking complex problems and looking at them through new lenses as well as solving them with different tools; and re-building BlocJams using React was exactly that kind of exercise!
