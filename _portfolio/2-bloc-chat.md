---
layout: case_study_bloc-chat
title: Bloc Chat
feature-img: "img/ng-bloc-chat.jpg"
thumbnail-path: "img/bloc-chat-thumbnail.jpg"
short-description: Chat in real time.

---
The Bloc Chat app allows users from anywhere to create chat rooms and discuss in real time. After displaying the app, a user enters their name and can display any of the rooms on the left side to join a discussion. There's also an option to create new rooms.

### Method

The project, an **AngularJS** application, was built from scratch from a set of user stories or requirements, with minimal guidance from Bloc.

### Challenge 

This project was my first experience with using the cloud provider [Firebase](https://www.firebase.com/) to store and retrieve data in real time. At the end of the project I deployed the app on [Heroku](https://www.heroku.com/).

### Solution

Below are the main steps taken to implement the app.

#### 1. Configuration

Configuration steps were similar to those in the Bloc Jams project. I set up Bloc's [Frontend Project Starter](https://github.com/Bloc/bloc-frontend-project-starter) and especially made sure that dependencies were installed in anticipation of later deploying on Heroku (Heroku has a very very low tolerance of an improperly installed dependencies).

I set up the app's look & feel by downloading a Bootstrap CSS template featuring top and left sidebars (these would later come in handy for implementing the app's title and room list respectively).

In addition, I set up user accounts with Firebase and Heroku, both free services for my purposes.

#### 2. Creating and storing chat rooms

Rooms are stored as objects (JSON format) in Firebase, which offers its AngularFire binding for applications like Bloc Chat. This means your app can synchronize objects and data stored in Firebase in real time. Of particular interest was AngularFire's `$firebaseArray` service, which allowed me to handle rooms and messages stored in Firebase as arrays.

Below you see how rooms are stored in Firebase: each room is an object denoted by a randomly assigned `$id` and a single property for the name.
{:.center}
![]({{ site.baseurl }}/img/firebase_rooms.jpg)

Rooms and messages can each be handled via Firebase's `child()` method.

{% highlight javascript %}
var firebaseRef = new Firebase("<FIREBASE_API_URL>");
var rooms = $firebaseArray(firebaseRef.child('rooms'));
{% endhighlight %}

I created an Angular `Room.js` factory to provide an array of rooms retrieved from Firebase. Controllers request the `rooms` array from the factory to display or change the data of the room objects in Firebase.

Modals (e.g., for creating chat rooms) are implemented via UI Bootstrap's `$uibModal` service and a controller dedicated to creating rooms.

#### 3. Setting up messaging

Messages are stored and manipulated in both the app and in Firebase in a similar way as chat rooms, as described above. I added a `room.$id` property to each message in Firebase to associate it to a room.

When a user clicks on a room in the left sidebar, associated messages are displayed in the main container. I created a `Message.js` factory to load and synchronize Firebase messages for a controller to display or change.

#### 4. Users

When a user first displays the app, a modal prompts for username. A username is stored as a string in locally stored Angular cookie (`ngCookie`). When the app is re-opened at a later time, it retrieves the username data in the cookie and doesn't prompt for username.

As the app needs to detect the existence of the cookie as soon as it's run, the code for this is contained in a `run()` block in the main Angular module. A property for `username` is added to every message in Firebase to associate messages with users.

### Lessons

This project provided the opportunity to get into the mechanics of using a third-party API like Firebase. I learned what it took to bind Firebase's services to an Angular app. Despite Firebase's marketing about ease of use, I nevertheless found it challenging to understand and use it at first. The fact it stores objects in JSON format would seem to provide immediate ease of use, but it wasn't easy in the beginning to manually populate the database with objects in correct JSON format, and Firebase's UI didn't seem so intuitive for manually adding data either.

As always in coursework there are time constraints. Had I had more time, I would have added user authentication (in Firebase) and made improvements to scrolling when the space taken by messages exceeds the length of the viewport.

As it was, I could take the knowledge gained here and apply in my capstone project (ng-help-viewer).