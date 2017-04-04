---
layout: page
title: Angular Notes
permalink: /angular/
feature-img: "img/brandon_caples.jpg"
hide: true
---

<a href="https://angularjs.org/" target="_blank">Angular</a> is a JavaScript framework for building dynamic web applications.
* CRUD (Create, Read, Update, Delete)
* not suitable for static, content-heavy sites
* SPA: single-page applications
    * do not require page loads when navigating between pages, like with most websites
    * goal is a <abbr title="User Experience">UX</abbr> similar to desktop applications
    * <em>e.g.</em> Gmail, Medium, Virgin America
* extend <abbr title="Hyper Text Markup Language">HTML</abbr> syntax with directives
    * directives attach particular behavior(s) to <abbr title="Document Object Model">DOM</abbr> elements
    * Example: `<div ng-click="doSomething()">`
* two-way data binding: automatic synchronization of data between model and view components

### Framework vs Library
* Framework: provides basic structure of application; developer's code fills in details
* Library: a collection of prewritten code of common tasks to simplify development; developer's code provides structure for which the library provides details

### Architectural Patterns
* <a href="https://blog.codinghorror.com/understanding-model-view-controller/" target="_blank">MVC</a> (Model-View-Controller)
    * Models - represent knowledge (HTML)
    * Views - visual representations of models (CSS)
    * Controllers - links between users and systems (browsers)
* MVVM (Model-View-ViewModel)
    * ViewModel represents the View and exposes data objects from the Model
    * ViewModel provides data binding between View and Model
    * Angular started MVC but is becoming more MVVM

### Modules
* Modules are containers for different parts of a web app
    * Controllers
    * Services
    * Filters
    * Directives
* Encapsulation: create functions locally within modules to avoid shadowing in the global scope
    Linters: tools that check code quality (<em>e.g.</em> <a href="http://jshint.com/docs/options/#shadow" target="_blank">JSHint</a>)

### Resources
* <a href="https://code.angularjs.org/1.4.7/docs/guide" target="_blank">AngularJS Documentation</a>
* <a href="https://docs.angularjs.org/tutorial" target="_blank">PhoneCat Tutorial App</a>
* <a href="http://www.learn-angular.org/" target="_blank">Learn Angular</a>
* <a href="https://www.airpair.com/angularjs/posts" target="_blank">AirPair</a>
* <a href="http://campus.codeschool.com/courses/shaping-up-with-angular-js/level/1/section/1/video/1" target="_blank">CodeSchool: Shaping Up With Angular</a>
* <a href="http://www.angularjs4u.com/demos/10-angularjs-crud-app-demos/" target="_blank">10 AngularJS CRUD App Demos</a>