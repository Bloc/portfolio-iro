---
layout: post
title: Blocipedia
---
**SUMMARY:**
Build an application that allows users to create public and private Markdown-based wikis.

Wikis are a great way to collaborate on community-sourced content. Whether the wiki is for a hobby or work-related project, I built an app that lets users create their own wikis and share them publicly or privately with other collaborators.

This project basically enabled me to:

1. Create a basic user scheme for a Ruby on Rails application.
2. Give the users of a Ruby on Rails application the ability to sign up for my application using the Devise gem.
3. Understand how to create CRUD routes and resources in a Rails Application.
4. Explain the difference between authentication and authorization.
5. Integrate Stripe third party API callouts.
6. Integrate Redcarpet Markdown rendering gem.

**EXPLANATION:**

As a user, I want to sign up for a free account by providing a user name, password and email.  I used the *Devise gem* for authentication. Blocipedia's authentication system should allow users to sign up and send emails for account confirmation.

Now that users can sign up for Blocipedia, you want to give them a way to sign in and out of the app. I used Devise to implement user sign in/out.

As a user with a standard account, I want to create, read, update, and delete public wikis.  I created the Wiki model and wikis_controller.

As a developer, I want to offer three user roles: admin, standard, or premium. I used the *Pundit gem* for authorization. Users should have one of three roles: standard (free), premium, or admin.

As a developer, I want to seed the development database automatically with users and wikis.  Now that user and wiki models are established, we can seed data into the development database. I used the *Faker gem* to generate fake 1 data for users and wikis.

As a user, I want to upgrade my account from a free to a paid plan.  I used *Stripe* to charge users before switching their account role from standard to premium. I included code to also allow a user to downgrade their premium account to a standard account.

As a premium user, I want to create private wikis.  Premium and admin users should be able to create new private wikis and make public wikis private. I checked the user's role before allowing them to edit a wiki's private attribute.  Since Blocipedia allows premium users to downgrade their accounts, what should happen to their private wikis? I built a user flow for this scenario which prompts the user with a reminder that their private wikis will become public if they downgrade their account.

As a user, I want to edit wikis using Markdown syntax.  I used the *Redcarpet gem* to parse Markdown syntax.

Finally, as a premium user, I want to add and remove collaborators for my private wikis.  Users will add and remove collaborators from a private wiki via its edit page. I Modeled this new relationship between wikis and users by creating a collaborator model. Private wikis should only be visible to admins, the wiki creator, or wiki collaborators. I used Pundit's scope to restrict which wikis appear on the index page. 
