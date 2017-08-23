---
layout: post
title: Bloc-Chat
thumbnail-path: "img/Bloc-Chat.png"
short-description: A chat room SPA created with AngularJS!
---

### Welcome To Bloc Chat Please Enter a Username!
{:.center}
![]({{ site.baseurl }}/img/set-username.png)

## My first SPA that I created!
Bloc Chat is a Single Page Application I created using AngularJS. I tackled on some tough issues like how to create chat rooms and display/send messages all in one page. Through using [Firebase](https://firebase.google.com/) and some AngularFire API methods I was able to do so. I was able to create modal windows using the UI Bootstrap and store usernames with cookies. This was a challenging project, but a fun and interesting one at the same time here's some of the issues and lessons I've learned in creating this web app.

## Creating and displaying my room(s)
![]({{ site.baseurl }}/img/create-new-room.png)
One of the first things I had to do was learn how to create an AngularJS service that I could use with the [Firebase](https://firebase.google.com/) database, so I may inject it into my app. Here's what the code looks like: 
```javascript
(function() {
  function Room($firebaseArray) {
    var Room = {};
    var ref = firebase.database().ref().child("rooms");
    var rooms = $firebaseArray(ref);

    Room.all = rooms;
    
    Room.add = function(room) {
        rooms.$add(room);
    }; 

    return Room;
  }

  angular
    .module('blocChat')
    .factory('Room', ['$firebaseArray', Room]);
})();
```
With this service I am able to create new rooms and display them as well using Angular Expressions and cool data-binding techniques like this: 

```javascript
<input type="text" ng-model="newRoom" />  

<button class="btn-md" type="button" ng-click="modal.cancel()">Cancel</button>

<button class="btn-md" type="submit" ng-click="modal.createroom(newRoom)">Create Room</button>
```
Here I used data-binding with a text input through my ng-model to create a new chat room with a modal window that you see in the picture above. With the service I showed you earlier I'm now able to style and create a container that will diplay all the contents that go inside a chat room.

## Displaying Rooms and Messages
![]({{ site.baseurl }}/img/room-msg.png)
Here's where things started to get tricky for me. I needed to figure out a way to display and store messages in my app, so that when I clicked on a chat room I only diplayed that room and it's messages. Because that is the main point of a chat room right? Being able to navigate through different channels and interacting with the users in that room, duh!?! Oh Yeah did I mention being able to send messages is also very important in a chat room. So here's what I did using the Firebase once again I was able to create a message service that holds messages along with usernames and a roomId that was generated from creating my chat room. From here I can now access any information I need to display and send messages in that chat room, here's the code I used to display objects from the picture above:
```javascript
this.setCurrentRoom = function(room, roomId) {
    this.roomValue = room;
    this.roomId = roomId;
    this.messages = Message.getByRoomId(this.roomId)
};

this.sendMessage = function() {
    this.newMessage.roomId = this.roomId;
    this.newMessage.username = this.currentUser;
    Message.send(this.newMessage);
};
```

## What I learned from this project!
As I mentioned before this was a challenging and great learning experience for me. I was able to bootstrap and load different AngularJS API's to help make my page come alive. From having modal windows pop-up to using a database like firebase to store information that I can share and display. Using data-binding to keep track of information like sending messages and creating new chat rooms. Also using the $cookies service to store usernames was a cool feature as well. Overall I feel like this project has improved my ability to read documentation because I wouldn't be able to have used all the things I just mentioned without having some understanding of applying the knowledge from all that reading! I look forward to posting more projects that I will be working on and sharing all the new tools and information that I have acquired and learned. 