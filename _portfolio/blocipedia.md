---
layout: post
title: Blocipedia
feature-img: "img/Blocipedia_Feature.jpg"
thumbnail-path: "https://s3-us-west-2.amazonaws.com/lgreen-screenshots-bloc/Blocipedia+Screenshot.png"
short-description: Blocipedia allows users to create their own wikis.

---
Blocipedia is a production quality SaaS app that allows users to create their own wikis. 

### What needed to be improved?

Wikipedia is a world-known platform that allows users across the world to contribute in the creation of content. The content has to be verified and sources must be referenced. However, the target is for public consumption, which means it is not possible to create private wiki pages. 

### How did we improve it?

While _improving_ may not be the best way to describe it, we created a web-app that allows registered users to create as many wikis as they wish. The site supports markdown which gives users more tools to create readable content. We have also added the option for premium users to create private wikis. 

### What can a user do?

The main goal of this app is to allow users to *create* wikis. Nevertheless, we provide different levels of access, as well as different options and features. 

* User accounts: Premium or Standard 
* Standard users can upgrade to a Premium account for 15.00USD and Premium Users can downgrade at any time 
* Premium users can create private wikis as well as public ones
* Private wikis are only visible to the owner and to those that have been added as collaborators<br />
_Note: Standard users can be added as collaborators to private wikis. They will have access only to those private wikis to which they have been added._
* Users can add collaborators to their wikis. This allows more than one person to contribute to the same wiki
* Collaborators can be removed at any time. If the wiki was private, they will no longer have access to it.

### Results

* User authentication was built from scratch. This allows for the confirmaton email to be sent instantly. [Figaro](https://github.com/laserlemon/figaro) was used to protect email credentials. 
* [Pundit](https://github.com/elabs/pundit) was used to handle authorization since we have different user roles (Standard is the default role).
* [Stripe](https://stripe.com/) was incorporated in order to be able to charge users.
* When users downgrade, the role is also changed from Premium back to Standard.
* [Redcarpet](https://github.com/vmg/redcarpet) was used to parse Markdown syntax. This will allow for further customization and overall better user experience when viewing wiki pages built with Markdown. 
* [will_paginate](https://github.com/mislav/will_paginate) was incorporated to unclutter All Wikis view. This posed a problem when we added an inner `Scope` class to our `wiki_policy.rb` file; the view was not paginating, and the wiki index was not showing. To fix this issue, we added an initializer like so:

**config/initializers/array_paginate.rb**<br />
 {% highlight ruby %}
  require 'will_paginate/array'
 {% endhighlight %}

### Screenshots 

![alt text][logo]

[logo]: https://s3-us-west-2.amazonaws.com/lgreen-screenshots-bloc/Screen+Shot+2015-09-28+at+5.41.21+PM.png "Blocipedia Screenshot 1"

![alt text][logo2]

[logo2]: https://s3-us-west-2.amazonaws.com/lgreen-screenshots-bloc/Screen+Shot+2015-09-28+at+5.36.00+PM.png "Blocipedia Screenshot 2"

![alt text][logo3]

[logo3]: https://s3-us-west-2.amazonaws.com/lgreen-screenshots-bloc/Screen+Shot+2015-09-28+at+5.42.30+PM.png "Blocipedia Screenshot 3"

[Link to Project](https://liz11-blocipedia.herokuapp.com/)