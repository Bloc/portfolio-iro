---
layout: post
title: Address-Bloc
---

**SUMMARY:**
This project is built on Ruby on Rails, Ruby being a dynamic open source programming language with focus on simplicity and productivity with elegant syntax that is easy to read and write, while Rails is a web application framework that includes everything needed to create a database-backed web application according to the MVC(Model view controller) pattern.

Address-Bloc is a Ruby based address book application.  It will need to model an internal address book and all its entries.  Models provide a structured interface to the data source in a project, which allows for easier manipulation of underlying data.

**EXPLANATION:**
I configured the development environment, installed Rails, used Cloud9 - browser-based development environment.

I practiced TDD (Test driven development) by creating tests before I wrote function code.  It encourages us to think carefully about expected behavior and desired design.  For TDD, I downloaded Rspec and installed it using 'gem' command.

I started by creating a model to store my address book entries, *Entry*.

I created directories to store models and spec i.e (mkdir models and mkdir spec).

Created 2 files, one for entry and one for entry_spec.rb i.e (touch models/entry.rb and touch spec/entry_spec.rb)

Created first set of tests for Entry, included attributes: name, phone_number, and email.  These specs will test that Entry responds to these attributes.

In the model, entry.rb, I leveraged attr_accessor to handle those attributes.  I initialized attributes in the specs and defined an initialize method in entry.rb that takes these arguments.

I ran test and they all passed.

I used Rspec's efficient helper method *let* to the keep the test DRY -*Don't repeat yourself*

I needed an address book model to store entries, so created address book model and specs.  Created a test to confirm that AddressBook responds to entries.

I added a method add_entry to update our *entries array*.

With models to store and retrieve data, we have the foundation we need to make Address-Bloc an interactive experience.  I gave users a command-line menu that allows them to view entries, create entries, search for a specific entry, import entries from a file, delete and edit entries, and exit the program.  To do this we created a MenuController to process user selections, update the models, and present information to the user.

I added the ability to search Address Bloc, used binary search algorithm to implement search functionality.

I wrote rest of the methods in menu_controller.rb to connect the user interface of Address-Bloc to the methods in AddressBook.
