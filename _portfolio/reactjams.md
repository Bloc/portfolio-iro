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

Other ES 2015 perks that featured prominantly in this project included: Object and Array deconstruction and initialization, Object.assign, template strings, let, and const. It was extremely fun to experience the benefits of these enhancements to JavaScript and compare against the 'old way' of writing JavaScript.

---

## Challenges with React

Using React's component model to think about the BlocJams music streaming app facilitated many things. A components properties could easily be referenced to build a view that dynamically updated as the values behind those properties also did. However, the smaller the components got, the more they needed to depend on external information to update appropriately. This was a challenge, but a relatively small one. The bigger challenge emerged when these small components not only depended on external properties (form parent components), but could also manipulate those properties and share them with yet more components.
