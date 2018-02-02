---
layout: post
title: Bloc-Jams Project 2
---

**SUMMARY:**
Blocitoff uses the Firebase API and AngularJS to create tasks with an expiration date.

To-do lists are notorious for collecting junk - tasks that you want to remember but constantly reprioritize. To solve the problem of to-do list clutter, we built Blocitoff. Blocitoff is a web application that will manage your to-do lists by automatically deleting tasks that have not been completed after seven days.

Our hypothesis is that if the task is not important enough to be completed within seven days, it does not belong on your to-do list.

**EXPLANATION:**
1.  As a user, I want my tasks synced with a persistent backend.

Firebase has a service called $firebaseArray() that can be used to sync a Firebase database with an Angular model like an array of tasks. I set the $scope array holding my tasks to a Firebase object that calls $firebaseArray().

I tested my code to generate and save tasks and verified that they appeared on the firebase's dashboard.

2.  As a user, I want to see my active tasks in a list as my default view.

I set up ui-router and defined a home or index state. Associated the state with a template that holds the view of the list, and added a controller either as an option on the ui-router state or as an attribute-based directive on the HTML element that contains the view.

I used ngRepeat to iterate over the array of tasks and create an element for each.

I tested my code to generate some tasks and verified that each task appears in the active tasks list.

3.  As a user, I want completed tasks and tasks older than seven days hidden from my main task views automatically.

I used Angular's built-in filter to show and hide tasks.

I tested the code by generating a variety of tasks, some older than seven days. Verified that tasks older than seven days do not appear in my active tasks list.  Generated a variety of tasks, some completed, some otherwise. Verified that completed tasks do not appear in my active tasks list.

4.  As a user, I want expired and completed tasks presented in a separate view.

I created a separate state, template, controller and registered them with your ui-router-driven routes. Added a link at the top of my default view that has a ui-sref pointing to the state of my expired and completed tasks.

I tested my code to generate tasks both older than seven days and completed.  I verified these tasks do not appear in the main view.  Verified these tasks appear in my task history view.

5.  As a user, I want to submit new tasks with a description, priority level and three states: expired, completed or active.

I created an input with an ngModel tied to a  $scope model at the top of the list. Allowed the user to save the task by clicking a button or link. By default, created all tasks with the active state.

To allow Priority Selection, I distinguished tasks as "high", "medium", or "low" priority. Used a <select> dropdown to hold all of the priority levels and chose one before submitting the task.

To save Tasks to Firebase, I created a $scope method to pass into an ngSubmit in my HTML. The $scope method must call the $add() method on the array to sync the task with Firebase.

When I set the task array equal to a Firebase object instance with a $firebaseArray() call, my data will automatically keep up with my changes, so I need not update my list of tasks on Save.

I tested my code to create tasks with my field. Verified that tasks are automatically inserted into my active tasks list.
Verified that tasks are organized by priority.  Verified that tasks are synced to Firebase.
