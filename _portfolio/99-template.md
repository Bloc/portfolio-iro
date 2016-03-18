---
layout: post
title: Conference Design
feature-img: "img/sample_feature_code.png"
thumbnail-path: "/img/placeholder_1x.jpg"
short-description: Email, App & Event Design

---

<h1>Bloc Chat</h1> 
<em>**Key tools used:** AngularJS, JavaScript, Firebase, Real Time Database, Sketch, HTML, and CSS</em>

![logo](../img/blocchat_1x.png)

<h2>Situation:</h2>
People’s 

<h2>Code & Visuals: <a href="http://github.com/srhbinion/bloc-chat" style="font-size:.65em"><i class="fa fa-fw fa-github"></i></a></h2>
This site is built in **AngularJS**.  [**Firebase**](https://www.firebase.com) facilitates the backend.

---
{% highlight javascript %}
binChat.controller("LandingController", ["$scope", "$firebaseArray","Room", "Message", function($scope, $firebaseArray, Room, Message) {
    // "room" array features
    $scope.chatRooms = {
        // accesses "room" array
        room: Room.allRooms,
        // adds item to the "room" array
        add: function(room){
            // adds this info to new "room" item in array
            $scope.chatRooms.room.$add({
                name: $scope.newRoomName,
                type: "Room"
            });
            // ng-model hold room name information
            $scope.newRoomName =[];  
        },
        // removes item from "room" array
        remove: function(room){
            $scope.chatRooms.room.$remove(room); 
        },
        //shows the selected room as current room
        set: function(room){
            // toggles between rooms in bodypanel
            $scope.currentRoom = !$scope.currentRoom;
            // ability to call selected room name information
            $scope.current = {
                name: room.name,
                roomId: room.$id
        };
    }
};
{% endhighlight %}
<h6><i>excerpt code: modification to the "rooms" array in the database with prototype naming standards</i></h6>
---

Utilizing user scenarios and suggested by Bloc.io. Prototype comps were created in the browser and the final visual design comps were revised in Sketch and implemented in CSS by me.

---
![logo](../img/blocchatC_1x.png)
![logo](../img/blocchatB_1x.png)
<h6><i>prototype comps</i></h6>
---

<h2>Final Product:</h2>
Bloc Chat is a succinct app that gives users the power to be connected to their flights as soon as the crew knows.