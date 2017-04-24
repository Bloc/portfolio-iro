---
layout: post
title: Markdown is not a sale
---
 A sample of the formatting follows.

Tables have also been extended from Markdown:

<B>2016 Presidential Election Results</B>

Clinton              | √  Trump 
-------------------- | -------------
232 Electoral Votes  | 290 Electoral Votes
62,523,126 Votes     | 61,201,031 Votes

Here's an example of an image, which is from ruby file schema.rb :


{:.center}
![]({{ site.baseurl }}/img/schema.png)

Highlighting for code here from server.js file for BlocChat.

{% highlight js %}
var Hapi = require('hapi'),
    path = require('path'),
    port = process.env.PORT || 3000,
    server = new Hapi.Server(port),
    routes = {
        css: {
            method: 'GET',
            path: '/styles/{path*}',
            handler: createDirectoryRoute('styles')
        },
        js: {
            method: 'GET',
            path: '/scripts/{path*}',
            handler: createDirectoryRoute('scripts')
        },
        assets: {
            method: 'GET',
            path: '/assets/{path*}',
            handler: createDirectoryRoute('assets')
        },
        templates: {
            method: 'GET',
            path: '/templates/{path*}',
            handler: createDirectoryRoute('templates')
        },
        spa: {
            method: 'GET',
            path: '/{path*}',
            handler: {
                file: path.join(__dirname, '/dist/index.html')
            }
        }
    };

{% endhighlight %}

Code Wars code line 
$$var i=arr.length-1;i>=0;i--) $$ can be displayed inline.
