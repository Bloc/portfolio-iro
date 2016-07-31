---
layout: post
title: Address Bloc
feature-img: "img/address_bloc/address_bloc_002.jpg"
thumbnail-path: "img/address_bloc/address_bloc_001.jpg"
short-description: Address Bloc is a local Ruby app that takes entries from standard input or a CSV file.

---
The address bloc assignment is a simple application written in Ruby. First I learned how to use the command line, including opening the Ruby console for testing snippets of code, starting in my Debian Virtual Machine, then moving on to Cloud 9 at the end. I learned how to write short programs using good Test Driven Development (TDD) methods of writing a specific test to fail, coding it to pass, then refactoring the code to make it more elegant or reusable. 

Each Checkpoint (learning objective) was pushed to GitHub and merged to the master branch. Assignments were pushed, but not merged. 

The TDD required extensive Rspec throughout the assignments. Most of the specs were written for me, and when I tried to write my own, I often made small but fatal syntactical errors.

The address adds entries, alphabetized, from the standard input of a user at the console or from Comma Separated Value (CSV) files. I spoke with other Denver area Bloc students who struggled with the CSV files. I though the instructions were clear and easy, but CSV files are commonly used for downloads of data from technical equipment, so I'm more familiar with them than most users (doesn't mean I didn't forget completely what CSV meant).

The Address Bloc allows a user to enter data by selecting from a menu that leads to a case statement.

#### Using standard input in Ruby for user data ####
```Ruby
  print "Name: "
  name = gets.chomp
  print "Phone number: "
  phone_number = gets.chomp
  print "Email: "
  email = gets.chomp
```

#### Control flow with a case statement ####
```Ruby
def main_menu
puts "Main Menu - #{address_book.entries.count} entries"
  puts "1 - Create an entry"
  puts "2 - Search for an entry"
  puts "3 - Exit"
  print "Enter your selection: "

  selection = gets.to_i

  case selection
  when 1
    system "clear"
    create_entry
    main_menu
  when 2
    system "clear"
    search_entries
    main_menu
  when 3
    puts "Good-Bye"

    exit(0)

  else
    system "clear"
    puts "Sorry, that is not a valid input"
    main_menu
  end
end
```

Rspec is used for data verification. The application can search for an entry by user name (simple first name), using a binary search on the alphabetized entries. The Rspec grew long when the requirement was to search for a name that was there, a nil name, and a name close to a name that was in the address bloc, and a purely invalid entry (although for a computer, "close to" doesn't cut it. I learned to make and use a helper method in the spec to reduce the length of the spec file.

The address book additionally took entries from a CSV file into a table and sorted them into the Address Bloc to allow for searching.

Entries could also be deleted from the Address Bloc, but not purely edited.

The exercise was a warm-up, although the RSpec was challenging. The syntax was not explained, and it was difficult to find good sources online that just explained the syntax. I tried a couple of books, both online and offline, but still wound up unable to write a basic spec without a lot of trial and error stumbling.