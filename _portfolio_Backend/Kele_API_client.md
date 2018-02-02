---
layout: post
title: Kele_API_client
---

**SUMMARY:**
Build Kele, a Ruby Gem API client to access the Bloc API.

**OBJECTIVE:**
This project enabled me to:

1. Create a basic Ruby Gem.
2. Explain authorization with JSON Web Tokens.
3. Understand the reasons to call an API using a client.
4. Explain how to update resources via an API.

**EXPLANATION:**

Bloc's API provides an external facing JSON Web Token authorized gateway to the Bloc application. We can access it via cURL, but an API client can manage the low-level details of making requests and handling responses. I built the Kele API Client to provide easy access to and use of the student endpoints of Bloc's API.

As a user, I want to initialize and authorize Kele with a Bloc username and password. I created this project as a RubyGem to allow to integrate Kele with other software. With the skeleton of Kele created, I added an initialize method that creates a new Kele client authorized with a username and password.  I was able to test Kele to retrieve and store the authentication token when passing valid credentials.

As a user, I want to retrieve the current user as a JSON blob.  I retrieved the current user from the Bloc API by defining get_me.  I passed Pass auth_token to the request to properly authenticate against the Bloc API. Passed the auth_token via HTTParty's headers option.  I added the json gem as a runtime dependency and use the #parse method to convert the user data to a Ruby hash. Testing Kele I was able to retrieve my own user data and convert the user data to a Ruby hash.

As a user, I want to retrieve a list of my mentor's availability. I was able to retrieve a list of mentor's available time slots for the current user from the Bloc API by defining get_mentor_availability. I passed auth_token to the request to properly authenticate against the Bloc API. Converted the JSON response to a Ruby array.  I tested Kele in IRB to retrieve a list of my mentor's available time slots.

As a user, I want to retrieve roadmaps and checkpoints.  Retrieved roadmaps with their associated sections and checkpoints by defining get_roadmap. Retrieved checkpoints with their associated body and assignment by defining get_checkpoint.  Tested Kele in IRB to ensure that I can retrieve a roadmap and its associated sections and checkpoints, retrieve a checkpoint and its associated body and assignment.

As a user, I want to retrieve a list of my messages, respond to an existing message, and create a new message thread. On the Bloc platform all messages belong to a message thread. Retrieved all message threads for the current user by defining get_messages.  I added a create_message method that creates a new message on the Bloc platform. Tested Kele in IRB to ensure that I can retrieve all messages for the current user and create a new message and thread.

As a user, I want to submit checkpoint assignments. I added a create_submission method that creates a new Bloc checkpoint submission on the Bloc platform. Used the create checkpoint submission endpoint to create a new submission. Checkpoint submissions are tied to our account via an enrollment_id, which is included in our user information. Implemented create_submission.  Tested Kele to ensure that I can create a new checkpoint submission.
