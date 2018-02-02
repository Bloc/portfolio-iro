---
layout: post
title: Bloc-Chat
---

**SUMMARY**:
Bloc Chat uses Firebase and AngularJS to create a real-time chat application. In this project I used Firebase to build an application that sends and receives messages in real time.

**OBJECTIVE:**
After this project, I was able to:

1. Register Firebase as a module in an Angular application.
2. Inject the $firebaseArray service into a controller.
3. Understand and use the Firebase JavaScript and AngularFire APIs – methods such as child() and $add().
4. Query a Firebase array.
5. Use UI Bootstrap to create a modal.
6. Use cookies to store information in the user's web browser.

**EXPLANATION:**
1.  As a user, I want to see a list of available chat rooms.

I created fake rooms in the firebase.

I created a Room factory in Angular that defines all Room-related API queries. Created a reference to my Firebase database inside, and injected the $firebaseArray service provided by AngularFire.

I used Firebase's child() method (called on an instance of its API object) to either query an existing set of data or reference one I intend to populate with data in the future. I used the $firebaseArray service to ensure the data is returned as an array.

Created a controller and associated it with the home template in a $state. Injected the Room service so that I can assign the array of objects retrieved by the all method to a $scope variable. Displayed the rooms in the template using ng-repeat.

I tested my code to verify that empty chat rooms appear.

2.  As a user, I want to create chat rooms.

I used the AngularFire method $add() inside a Room factory method add. This will give the application the ability to add rooms to the firebase database. I don't want AngularFire specifics leaking into the rest of our application. To avoid this leaking, I created an abstract method in the service.

The Room service method add should take a room object as an argument. This room object was created outside of this service.

There needs to be a form that you can use to submit the new room's data using  ngClick or ngSubmit. Presenting a modal is an unobtrusive way to trigger a form on the interface. I used UI Bootstrap's $uibModal service to define a method for toggling a modal on the frontend.

I tested my code to verify that my array of rooms updates in real time as soon as I create one.

3.  As a user, I want to see a list of messages in each chat room.

Chat rooms tend to be designed so that only one room's messages show at a time. I created a container for holding a list of messages to the right of the list of available chat rooms. The active room should be stored in a $scope object in the main controller, so that the title of the active room changes every time you visit a different room. The active room should be triggered by clicking on the name of the room in the sidebar.

Associating Messages With a Room.  Associating objects with other related objects, like rooms with messages, requires using a reference to the parent data (in this case, the room) in the child data. The property, roomId, references the room where the message was sent. The ID is generated every time an object saves to Firebase, and can be viewed on the Firebase web interface.

I created a few rooms using the method I programmed previously so that I can use the IDs generated from those rooms to complete this part.

I created a few messages manually on the Firebase dashboard with the above data structure, and associated them all with one of our rooms so I can test querying messages with the rooms.

To query Messages with a Factory, I created a Message factory in Angular that defines all Message-related API queries. Created a reference to the Firebase database inside, and injected the $firebaseArray service provided by AngularFire.

Using the child() method on the $firebaseArray service again, queried messages instead of rooms this time. To get the messages for a given room, I need to chain the child() method with Firebase's orderByChild()1 method, targeting the roomId child.

Messages depend on the ID of a room, I passed an argument into the  getByRoomId method that contains the roomId associated with a rooms message. With the roomId, I used Firebase's equalTo() method to find all messages whose  roomId property is equal to the roomId in the argument.

I tested my code to launch Bloc Chat. Verified that messages appear when selecting a conversation. Verified that switching chat rooms replaces the messages with those associated with the new chat room.

4.  As a user, I want to set my username to display in chat rooms.

A username is a string identifying a user. A common way to store a string in your browser is to use cookies. Angular has an external module for including the services and methods associated with cookies. To integrate the module I included the Angular cookies module via a <script> tag in index.html.  Injected the ngCookies module into my Angular app's dependency array.

How can I require each user to enter a username when they visit Bloc Chat for the first time?.  Angular modules have a .run() method that runs code when the app instance is created. I used a .run() block to make sure that a username is set at the time the app is initialized. I will need to inject the $cookies service into the run block's dependencies to check for the presence of the cookie holding the username.

If the app detects that a username isn't present, there needs to be a way to enter one. Inside the conditional that checks for the presence of a username, I triggered another UI Bootstrap modal that requires a user to enter one. I did not provide a “cancel” option this time, so the user cannot access the chat until their username has been set.

To test my code, I launched Bloc Chat.  Verified that a modal prompts me for a username.  Verified that I cannot dismiss the modal.
Verified that submitting an empty username (or whitespace) does not succeed.  Verified that providing a username grants access to Bloc Chat.  Verified that the username is saved to the appropriate cookie.

5.  As a user, I want to send messages associated with my username in a chat room.

I added a method to my Message factory called send, that takes a message object as an argument and submits it to my Firebase server.

I created a controller method that is invoked via ngClick or ngSubmit on the frontend.

How can I make sure that the messages that a user sends are associated with their username?*  In the message object detailed earlier, there was a username property that held a string referring to the user crafting the message. I populated that property with the current user's username by injecting the $cookies service and referencing the current user object on it.

To test my code I launched Bloc Chat, opened a chat room.  Verified that messages are submitted to the active chat room.  Verified that my username is associated with each message I create.  Verified that new messages are associated with no chat rooms other than the active.
