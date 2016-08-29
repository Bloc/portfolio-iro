---
layout: post
title: First Alexa Skill
---
Yesterday I wrapped up another project called Blocipedia, an application that allows users to create public and private Markdown-based wikis. Needless to say, this project kept me on my toes. This project had me use [Devise](https://github.com/plataformatec/devise), a flexible authentication solution, along with [Pundit](https://github.com/elabs/pundit), a gem for authorization, and even set up [Stripe](https://stripe.com/) to charge users for upgrading their account from standard to premium. And, not to forget I implemented [Redcarpet](https://github.com/vmg/redcarpet) a gem used to parse Markdown syntax for users' wikis. Overall this was a great project and I feel pretty good about the new tools learned.

Today I submitted my first Alexa skill for certification/approval from Amazon. I'm not even sure when to expect a response as to whether or not it will meet their expectations. Anyway, the Alexa project incorporates the [Alexa Skills Kit (ASK)](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit), [Alexa Voice Service (AVS)](https://developer.amazon.com/public/solutions/alexa/alexa-voice-service), Amazon Web Services, and Node to create voice-enabled applications. This project was eye opening because it allowed me to see what else can be done with programming. The idea of creating a skill for Alexa and then having my family actually using it with their own Echo is pretty cool thing. And, I have to remind myself this is only scratching the surface.

About the project. I created a simple skill that plays multiple choice questions using an [Alexa Skills Kit Sample](https://github.com/amzn/alexa-skills-kit-js). I customized the skill to play questions about what noises animals make. I have a one year old daughter who is starting to recognize animal noises and thought this would be a fun way to learn them. Basically, a user is given four possible noises to choose from, and the user then answers by responding with the correct number (1-4).

Alexa: "What sound does a dog make?"
  "Woof"
  "Meow"
  "Ribbit"
  "Neigh"
User: "One"
Alexa: "One is the correct answer. Your score is one."

One thing that stood out to me while completing this project was thinking about the User Interface. Thinking about the user's flow through voice commands is much different than a flow a user might experience on a web application. The short of it is, simple is better when developing an AVS. I'm excited to complete more skills with more capability than just multiple choice questions for animal noises.
