---
layout: post
title: Open_to_do
---

**SUMMARY:**
Build an externally usable API for a basic to-do list application. This API will allow users to modify user accounts and to-do items from the command line.

To-do lists should be simple, while remaining flexible to use. It's one thing to have a physically limited stack of papers in your pocket. It's quite another to have a list that works easily on your Android, and your spouse's iPad, and your Windows computer (and any command line, worldwide).

Apps like Todo.txt go a long way towards solving this problem by creating a simple API that any programmer can easily navigate and extend. Like Todo.txt, this app will be easy to control from the command line.

My API should allow me to change the same data from the command line or the browser. This API can support other platforms and allow programmers to build on my tool in new and exciting ways.

**EXPLANATION:**
As the Open To-do API, I want to return JSON representations of users, lists, and items.

1.  Open To-do API requires three models: a User, a List and an Item. A user model represents a user, an item is a single to-do item, and a list belongs to a user, has several items, and a private attribute. I generated these three models with basic attributes.

The Open To-do API must return formatted responses that users can read, and machines can generate and parse. The standard for most modern web APIs is JSON, which stands for JavaScript Object Notation. JSON is a lightweight data-interchange format.

Converting a Rails object into a JSON representation is called serializing. Open To-do API will need to serialize users, lists, and items. I generated UserSerializer, ListSerializer, and ItemSerializer using the Rails Serializers guide.

I tested from the Rails console, inserting at least one user, list, and item.

From the Rails console, I confirmed that  puts JSON.pretty_generate(UserSerializer.new(User.first).as_json) outputs the JSON representation of a User.

From the Rails console, confirmed that  puts JSON.pretty_generate(ListSerializer.new(List.first).as_json) outputs the JSON representation of a List.

From the Rails console, confirmed that  puts JSON.pretty_generate(ItemSerializer.new(Item.first).as_json) outputs the JSON representation of an Item.

Validated the JSON output for each Serializer using JSONLint.


2.  As a user, I want to authenticate myself from the command line, using a username and password.  Created an ApiController from which the user, list, and items API controllers will inherent.

Created a private method named authenticated?. Other API controllers will use  authenticated? to ensure users are authorized.

authenticate_or_request_with_http_basic implements basic HTTP authentication, which ensures HTTP requests are accompanied by a valid username and password.

To test authenticated?, we will need an API route that requires authentication.  I edited routes.rb to provide API routes.

Created UsersController to match the API routes.  Wrote index to return a UserSerializer-generated JSON representation of all users.

Tested the code creating users via the Rails console.  From the command line, retrieved all the users via a curl request. Replaced username and password with a valid username and password. Tried to retrieve all users using an invalid username and password combination, verified the request fails.


3. As a user, I want to create new users, lists, and items from the command line. Edited routes.rb to provide the API routes for Lists and Items.

Created ListsController and ItemsController to match the API routes.  In UsersController, added a create method and a private users_params method.

Tested list and item creation from the command line.

Tested my code to modify the curl request for creating users to send a request without a password. Confirmed an error message is returned, and a user is not created.

Modified the curl request for creating users to send a request without a username. Confirmed an error message is returned, and a user is not created.

Modified the curl request for creating lists to send a request without a name. Confirmed an error message is returned, and a list is not created.

Modified the curl request for creating items to send a request without a description. Confirmed an error message is returned, and an item is not created.

4.  As a user, I want to remove users and lists from the command line.

Added a destroy method to UsersController.  Tested code for user and list deletion from the command line.


5.  As a user, I want to update list and item attributes from the command line.  Allow users to change a list's private attribute from the command line. Added an  update method to ListsController.  Added the ability to update items and mark them as complete to ItemsController.

Tested code to list permission updates and item completion from the command line.
