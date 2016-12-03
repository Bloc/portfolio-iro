---
layout: post
title: BlocChat
feature-img: "img/sample_feature_img.png"
thumbnail-path: "img/ChatGruntBrackets.png"
short-description: Blog page with Firebase.
---
The BlocChat project was a fun. Implementing the Firebase tools and intrastructure (google).

---


{:.center}
![]({{ site.baseurl }}/img/Coffee_house.png)

---
Realtime Database on Firebase (Google) console.

{:.center}
![]({{ site.baseurl }}/img/firebasedb.png)

---
Using Grunt from terminal on my local server.

{:.center}
![]({{ site.baseurl }}/img/ChatGruntBrackets.png)

---
Added scripts: jquery, UI Bootstrap library, Angularjs, and local scripts. 
The code also, ran a cookies service.

{% highlight javascript %}
  <body>    
        <ui-view></ui-view>
        
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
        <script src="https://cdn.firebase.com/js/client/2.2.4/firebase.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/1.3.3/ui-bootstrap-tpls.min.js"></script>
        <script src="https://cdn.firebase.com/libs/angularfire/1.2.0/angularfire.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.13/angular-ui-router.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular-cookies.js"></script>
        <script src="/scripts/app.js"></script> 
        <script src="/scripts/controllers/HomeCtrl.js"></script> 
        <script src="/scripts/controllers/ModalCtrl.js"></script>
        <script src="/scripts/services/Room.js"></script>
        <script src="/scripts/services/Modal.js"></script>
        
 </body>
{% endhighlight %}

___


Interesting real world note:  AngularFire's Authentication API documentation and the Google Angular Firebase was not consistent, updated, and or complete at the time of this exercise. Recently, Google purchased Firebase. 
