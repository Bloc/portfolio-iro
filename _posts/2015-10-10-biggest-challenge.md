---
layout: post
title: My Biggest Challenge
---
Starting out in a new career can be very daunting. Personally, I never considered going to college for Programming or Computer Science. Even though I was always awfully interested in technology, it never occurred to me to make a living out of it. So I graduated with a Bachelor's Degree in Marketing. 

Fast-forward 7 years, after having worked in the tech environment, I decided to respond to my true calling. Having said that, I started my Bloc journey with very little programming background. As you start to read and learn from the resources, it can be intimidating to get accustomed to the new terms and definitions. 

My biggest challenge was translating the given written examples to hands-on projects. Having a mentor can definitely improve this situation, but once you are in charge of your own project, making changes and at times not being 100% sure of what you're about to do can be frightening. 

There was one particular instance when something as simple as [pagination](https://en.wikipedia.org/wiki/Pagination) was not working on my project. Now, the project had slightly veered off the original blueprint suggested by Bloc, so I was finding it difficult to figure out the solution. Exactly during this time, the mentor change happened, which made me a tad more anxious. 

I read through pages and pages of [Stack Overflow](https://stackoverflow.com/), hoping to find the answer. Troubleshooting is a huge part of building projects, and it's something I have come to embrace. After a couple weeks and trying different approaches, I was able to fix the problem. We were building arrays of wikis, and for some reason this was breaking the [will_paginate gem](https://github.com/mislav/will_paginate). The [solution](/portfolio/blocipedia.html) was to add an initializer that would 'require' the pagination gem with an array. Voilà. 