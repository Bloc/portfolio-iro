---
layout: post
title: Blocipedia
feature-img: "img/blocipedia_banner_1.png"
date: March, 2018
thumbnail-path: "img/blocipedia_landing_1.png"
short-description: A wikipedia spin-off complete with markdown, previews, and premium subscriptions.
published: true
---

A Wikipedia-style web application built with Ruby on Rails, Blocipedia incorporates 3rd party gems like [Devise](#devise---authentication), [Redcarpet](#redcarpet), and [Stripe](#stripe---payments) to provide a realistic 'wiki' experience.

![Blocipedia Landing Page](https://tboddyspargo.github.io/img/blocipedia_landing_2.png)

# Devise - Authentication

For user authentication, Blocipedia makes use of a really handy and popular rails extention and gem called [devise](https://github.com/plataformatec/devise). It enhances your `User` model with the necessary attributes and methods for secure authentication as well as many additional auth-related features.

![Default Devise View](https://tboddyspargo.github.io/img/blocipedia_devise_1.png)

Out-of-the-box devise (depicted above) works quite well, but it is a very plain appearance by default. As Blocipedia matured and took on a particular look and feel (inherited from Boostrap v4), I wanted to modify the views that devise provides by default to fit in a bit better. Luckily Devise supports customization fairly well, so all I had to do was run this command:

```ruby
rails generate devise:views User
```

This moved the default devise views into my application directories, so that I could modify them to fit my needs, adding bootstrap wrappers and classes. This led to a set of views that was much more in-line with the rest of the application aesthetic.

While most of what I changed was HTML tags and classes, I also customized the default devise messaging system to integrate better with my own rails `flash`-based approach for displaying success/failure messages.

Views weren't the only thing about devise I ended up wanting to customize, however. I needed custom user-related routes like `/unsubscribe_from_premium` and `/user/update_password`. Customizing the routes did end up posing some challenges; particularly when trying to write tests for my intended functionality. Here is the error I received when I attempted to run these tests.

![Default Tests Error Message](https://tboddyspargo.github.io/img/blocipedia_devise_2.png)

Luckily, the answer is right there in the error message, but it took a bit of research to understand exactly what it meant. I learned that these tests bypass the routing mechanism that devise relies on to direct URIs to their appropriate actions. What I needed to do was to tell the test to use those 'mappings' so that the correct actions are invoked. To do this I specified the devise mappings in the `@request.env` hash prior to making the requests.

_[spec/controllers/registrations_controller_spec.rb]_
```ruby
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
```

Doing that allowed all the test requests to invoke the appropriate actions and lead to the expected outcomes.


# Pundit - Authorization

[Pundit](https://github.com/varvet/pundit) is a tool that allows you to create authorization logic (as opposed to authentication logic) to allow users to access _only_ that information which they should be allowed to access.

Pundit does this by creating policy classes associated with models. When used a appropriately, the Pundit policy for a stands as a protective layer in between the access request and the model or controller itself. Each model and controller method/action can have a corresponding Pundit policy method which evaluates the current context to return a `true` or `false` representation of whether or not the user should be allowed to perform that action. Often these decisions are based solely on the logged in user instance and the model class they are trying to access.

For example, Blocipedia allows non-members to read public wikis, but private wikis may only be seen by their creators and collaborators. The pundit `wiki_policy` includes the following to boolean methods which determine a user's ability to request the `index` and `show` actions on the `Wiki` controller.

```ruby
def index?
  true
end

def show?
  user.try(:admin?) or user == record.owner or record.collaborators.find_by(user_id: user.try(:id)) or record.public?
end
```

As you can see, anyone may access the `index` action on the `Wiki` controller. Granted, the set of wikis that are shown on that page are only a subset (i.e. 'public' wikis) if no user is logged in, but that logic is handled in what's called a Pundit Scope definition. Here we're only determining if they're allowed to execute an action on the controller.

The `show` action has a much higher barrier of entry. A user must be an admin, the owner of the wiki in question, a contributor to it (via the HMT relationship), or the wiki must be public in order for the action to be allowed.

Pundit can greatly simplify the management of authroization strategies through clear separation of concerns. When data models begin to have complex relationships with other models that affect authorization, defining scope can be especially tricky, but knowing that authorization is handled in one specific location is extraordinarily helpful.

# Redcarpet

I couldn't imagine writing a wikipedia 'pastiche' that didn't involve some form of markdown language. While I have a lot of experience with the [mediawiki](https://meta.wikimedia.org/wiki/Help:Advanced_editing) markdown style, I rather prefer the style used by [github](https://guides.github.com/features/mastering-markdown/) and other code-focused platforms. I searched around for a bit and found redcarpet to be a good option for rails development, so I included it in my project very near the beginning.

I wrote several helper functions to help provide seed data for Blocipedia's dev and test environments and was disappointed to learn that tools like FactoryBot recommend NOT leveraging their factories in seed files, so there is a bit of redundancy where those 'fake wiki' functions are concerned. I also used [Faker](https://github.com/stympy/faker) to easily access a bunch of fun example text to make these non-production environments feel more real.

## Markdown Previews
A big feature that I found missing in this project early on was the ability to preview a wiki that you're editing so that you can quickly make adjustments and obtain your desired look before actually 'saving' the page. This was somewhat tricky however, as redcarpet performs server-side HTML rendering of markdown text. When the user is editing, however, the server doesn't have those edits until they're submitted – traditionally as part of the create/update actions – so I needed some other tool.

I needed to have a small piece of aysynchronous code in the `/edit/:id` view that would make a server call to render some submitted text and send back the rendered html. The client side code would then insert the received HTMl into a 'preview container' for display to the user.

To accomplish this, I created a custom `preview` action in the `wikis_controller.rb` that corresponded to a `/markdown` route in `routes.rb`. By performing a `POST` to that route, I could leverage the server-side rendering capabilities of Redcarpet with a helper function and return it to the calling code - a snippet of JQuery that made the request and used a small callback function to insert it into the `wiki-preview` container, which corresponded with a tabbed area using bootstrap.

The result is a very functional and convenient preview feature to help users quickly verify the effects of the markup they are writing.

# Bootstrap 4

My Blocipedia project cooincided nicely with the release of Twitter [Bootstrap's v4](https://getbootstrap.com/docs/4.0/getting-started/introduction/) release. This version was a significant overhaul of Bootstrap's paradigm with changes to underlying css properties used, syntax, and offered features. While it took some adjusting to, I greatly appreciated the updates: grid layout leveraging `flex` instead of `float`; improved class relationships which reduced the overall quantity of classes required; and the updated aesthetics which, though similar, are more 'clean' than previous versions, in my opinion.

# Stripe

Integrating with [Stripe](https://stripe.com/) allowed me to explore the real-world scenario of incorporating payment and subscriptions into my application. Blocipedia users can upgrade their membership to `Premium` status to access additional features, like creating private wikis. Since Blocipedia is not a true business venture, only the [test version](https://stripe.com/docs/testing) of Stripe is used to demonstrate this functionality (no financial transactions will actually take place).

# Try it

[Hosted on Herkoku](https://protected-lowlands-64539.herokuapp.com/)
