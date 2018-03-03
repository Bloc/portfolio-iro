---
layout: post
title: Bloccit
date: December, 2017
feature-img: "img/bloccit_landing1.png"
thumbnail-path: "img/bloccit_landing1.png"
short-description: Rails made building a reddit-style forum application easy and fun!
published: true
---

This web application is a reddit-styled forum site written in Ruby on Rails. Bloccit users can contribute to a variety of conversation topics. Members vote on the relevance of each post so that current trends are apparent to all users.

## Ruby on Rails

Bloccit wasn't my first foray into the world of Ruby on Rails, but it was my most in-depth and well-rounded Rails experience. I love the principles on which Rails is built: convention surrounding common and mature web application needs can lead to reducing developer load, shorten the path from conception to release, and make for more manageable codebases. In my own life, I have encountered the frustrations that accompany a free-for-all code culture. Often in these situations, my teams have resorted to defining and enforcing standards, but those standards are often abstract and must be taught. With Rails, the conventions are inherent to using the technology and don't vary too much from company to company. It's a joy to learn those conventions in the context of being introduced to a new framework - it feels like swimming with the current, rather than against it.

![Bloccit Landing page](https://tboddyspargo.github.io/img/bloccit_landing1.png)

## Test Driven Development (TDD)

When writing Bloccit, I always wrote tests for each piece of functionality before I implemented it. This method, called Test Driven Development, is a practice that encourages thoughtful features, ensures much more maintainable code, and helps refactoring efforts down the road.

The tests for Bloccit are written using the RSpec framework, which greatly facilitates writing concise, quasi-natural-language tests. While, the built-in rails testing framework is quite good, RSpec is a well known and respected name that enhances the developer experience when writing tests and reviewing the tests that others write.

Here's an example of how easy to read these tests can be:

```ruby
RSpec.describe Vote, type: :model do
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }

  describe "update_post callback" do
    it "triggers update_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save!
    end

    it "#update_post should call update_rank on post" do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save!
    end
  end
end
```

The model tests rarely fail once they are written, but they ensure that the underlying functionality of the data doesn't change without the developers becoming aware fairly quickly. As the tests get more specific they have a higher chance of being affected by changes to controllers (for example). I found that the tests for the URL routes and associated controller action outcomes were extremely helpful as I refactored the code, added features, and adjusted routes to improve the user experience. As long as the tests kept passing, I new that the site would behave as expected, and if they failed then I either had to adjust the tests to match new expectations or the code to produce the expected outcome.

![Post form](https://tboddyspargo.github.io/img/bloccit_post1.png)


## Authentication

There are many pre-built Ruby gems that help extend Rails functionality to include standard features for user authentication - something that almost all web applications need. Using [Bcrypt](https://github.com/codahale/bcrypt-ruby), I was able to quickly implement a secure method for allowing users to authenticate into my application without having to learn all about cyber security and implement my own. Bcrypt seems to be a well-respected open encryption algorithm tool that works well with Ruby. Once I implemented this very simple tool, I had a site that users could sign up for and suddenly, many user stories started to take shape that were not previously possible.

## Sessions

In addition to the authentication aspect of user interactions with Bloccit, I also had to handle user sessions (whether someone is currently logged in or not). Again, Rails made this easy by providing the `session` hash where I could keep track of whether or not a user has logged in recently. Used with SSL, this is a secure method for recognizing that the user is authenticated and keeping their experience consistent with that fact. Since I can tell if a user has a session, I can also restrict parts of the site based on that fact. I also added a `role` enum attribute to the User object to enhance this ability and allow `:admin` users more power to control the applications content than regular `:member` users. Testing these differences in experience was complicated and led to quite long RSpec tests, but ensured that the experience matched the design.

![Sign up](https://tboddyspargo.github.io/img/bloccit_signup1.png)

## Mailer

Bloccit provided me with a really exciting opportunity to work with triggered notification features. These are a standard part of any business/social web application feature set and fit well into the Bloccit experience. Using Rails' built-in `ActionMailer` class, I was able to easily define the a mailer action and then call that action based on an event - in my case, when a new comment was added to a post that users had favorited. They then received an email displaying the new comment and providing a link to the full post discussion. This functionality was surprisingly easy to build and contributed greatly to the 'richness' of the Bloccit experience.

![Mailer notification](https://tboddyspargo.github.io/img/bloccit_email1.png)

## Pop, Lock, and Bloccit

Creating this social web application with Ruby on Rails was extremely rewarding as it was one of the first fully-functional web applications I had built from the ground-up. I now feel prepared to take these same ideas and principels – TDD, user stories, security around authentication and session managment, automatic notifications, and more – and build something that truly solves a real-world problem that I'm passionate about. I'm very excited to use Ruby on Rails in future projects and build something even more complex and feature-rich!
