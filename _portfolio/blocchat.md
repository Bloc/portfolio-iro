---
layout: post
title: BlocChat
feature-img: "BlocChatScreenShot.png"
thumbnail-path: "/img/BlocChatScreenShot.png"
short-description: BlocChat is a Firebase powered chat room!

---
{:.center}
![]({{ site.baseurl }}/img/BlocChatScreenShot.png)

{:.center}
![]({{ site.baseurl }}/img/blocchatusermodal.png)

{:.center}
![]({{ site.baseurl }}/img/blocchatnewroommodal.png)
# Summary
BlocChat uses the AngularJS framework with M.V.C. modeling to host chat rooms, using Firebase to store user messages. Once loaded BlocChat will open a modal that requests a username, if one isn't already saved. Another modal opens if the user wants to create a new room.
# Explanation
Building a chatroom was a fun way to get to know AngularJS and the benefits of using the M.V.C model. M.V.C. helps keep everything organized. Each View with one Controller that can access any variables or methods inside the Model through Dependency Injections.
# Problem
The main part of this project was to write code that could access the Firebase database. The first reason was for saving newly created chat rooms. The second was for saving newly created user messages. The third was for retrieving those messages.
# Solution
{% highlight javascript %}
(function() {
    function Room($firebaseArray) {
        var Room = {};
        var ref = firebase.database().ref().child("rooms");
        var rooms = $firebaseArray(ref);

        Room.all = rooms;

        Room.add = function(room) {
            rooms.$add(room);
        }

        return Room;
    }

    angular
        .module('blocChat')
        .factory('Room', ['$firebaseArray', Room]);
})();
{% endhighlight %}
This is the entire Model file that handles saving new rooms. the **.child()** method is used in *var ref* since Firebase considers A property's values to be the children of that property.
{% highlight javascript %}
this.send = function() {
          Message.send(this.newMessage, this.selectedRoom.$id);
          this.newMessage = "";
      }
{% endhighlight %}
This is a snippet from a Controller file, used for sending new messages to the database. The information from the View (this.newMessage, this.selectedRoom.$id) passes through this Controller file and into the **Message** Model where *.send()* pushes to Firebase.
{% highlight javascript %}
<table class="table table-striped">
          <tr ng-repeat="message in home.messages">
              <td class="sender">{{ message.username }}</td>
              <td class="wording">{{ message.message }}</td>
              <td class="timing">{{ message.datetime | timeStampz }}</td>
          </tr>
      </table>
{% endhighlight %}
This is a snippet from the home template (the only View file in this project except for the pop-up modals). AngularJS uses double curly brackets to pass data into the View so users can see it. All three times that same *Message* Model file is referenced. *username, message,* and *datetime* are the property names for each message saved in Firebase. *timeStampz* is a function I had to make to convert the UNIX TIMESTAMP into actual human readable format.
# Results
Testing was a step by step process. I was continuously checking the documentation for AngularJS, Firebase, as well CSS bootstrap. Once I had all my code right so that data could push and pull from the database, I went back through and redid all of my CSS which had been giving me a headache:)
# Conclusion
I'm surprised at how simple it is to make a real, functioning web page. I hadn't heard about Firebase until this project, but it's a cool thing that anyone can use it for databasing. This was my second project using AngularJS and the M.V.C. model.
