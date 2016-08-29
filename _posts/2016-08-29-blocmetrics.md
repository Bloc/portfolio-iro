---
layout: post
title: Blocmetrics _API Tracking Service and Reporting_
---

The past week I have been working on another [Bloc](https://www.bloc.io/software-developer-track) project called Blocmetrics. Blocmetrics is to serve as an API tracking service for reporting purposes. Specifically, it's an analytics service and reporting tool that you can use with web apps to track user activity. If your interested in viewing the GitHub Repository feel free to [click here](https://github.com/smeads/Blocmetrics).

To date, this was the most difficult project I've worked on, but with greater difficulty comes more failures and more lessons learned. I feel my capabilities were stretched and some skills were honed in on. The biggest takeaways from this project is a better ability to read and debug coding errors. I really had to trust and use error messages to uncover many issues. When error messages didn't seem to help out, I learned how to "bread crumb" debug by using `puts hello`. This debugging approach literally allowed me to follow bread crumbs and find exactly at which part of my code was broken. The ultimately lead me to solve an issue I was trying to resolve for 3 days. Good skill to learn. You can see a code snippet below of how I used `puts` to debug:

```ruby
def create
  registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
p 'hello'
  if registered_application.nil?
    p 'hello'
    render json: { error: "missing valid registered application URL" }, status: :unprocessable_entity
  else
    @event = registered_application.events.build( event_params )
      if @event.save
        render json: @event, status: :created
      else
        render json: { error: "missing event name" }, status: :unprocessable_entity
      end
    end
  end
  ```

  I've also included a brief video below that runs through Blocmetrics. Check it out and let me know what you think.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=youtu.be/Gjd3QbME2-E
" target="_blank"><img src="http://img.youtube.com/vi/youtu.be/Gjd3QbME2-E.jpg"
alt="Blocmetrics" width="240" height="180" border="10" /></a>
