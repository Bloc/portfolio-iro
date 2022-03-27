---
layout: post
title: Deploying React, Angular apps, as well as Wordpress on a VM
---

Before starting, I'd like to provide some background. My last post on contributing to Open Source was made before actually writing a single line of code towards a project. I've run into a couple of hurdles here and there. I did make a contribution to a well known project called Angular. It initially was supposed to be updating a library's way of calling an error message, but unfortunately, the issue that I had chosen was slated for deprecation. So, alas, my work had to be discarded, but I did have the pleasure of adding a single comment to the project's repository. 

Afterwards, I did search for other projects, and did write some code to a project called Better_Errors. I jumped on because the maintainers seemed to have been doing some work during the end of year holiday season. It was around that time that I put in some work for this, but unfortunately, it seemed like the project maintainers/devs have been silent shortly after my contribution.

So, I took a bit of a break from attempting to meaningfully contribute to open source. I regrouped and reviewed some long forgotten things from webdev.
One thing that I've learned is how easily I forget certain particularities of a language if I don't use it often. CSS, Bootstrap, HTML had been very well learned and a year ago. At that time, I felt very strong in these areas. I couldn't say the same thing right now. I reviewed Bootsrap, CSS, and also reviewed Angular. Also, past couple of weeks, I created a chat app using React as the framework (which I actually prefer to Angular currently), and am using firebase in the backend to house the chatrooms and the messages within. I did this mainly to actually write code, review old concepts that were stale, and start to build my protfolio to the world!

And that's the part that stuck. That is, a need to build things and put them out there in the world! I had this blog, previously accessible via github pages. It basically is my main Jekyll blog site, housed on github, which was previously CNAME'd to my main domain at [www.xavierjortiz.com](www.xavierjortiz.com).

The problem with having this site on github was that I could not setup secure SSL connections to www.xavierjortiz.com. The way github pages works would not allow a certificate to be properly bestowed to _my_ particular domain name. In other words, if I CNAME'd my www.xavierjortiz.com site to xavier-j-ortiz.github.io, and tried to fetch content from https://www.xavierjortiz.com (note the **https** prepended before the website's domain name), the browser would throw an error due to name mismatch on the certificate. This would be because github pages would provide a certificate for it's domain name, which is _github.io_, when the browser would expect a certificate from the site www.xavierjortiz.com to have a a name of _www.xavierjortiz.com_, or a wildcard cert _*.xavierjortiz.com_. For me to properly setup a certificate for my website would require me to create my own server, host the site from there, and use a service like [www.letsencrypt.org](www.letsencrypt.org) to create a self signed certificate for my particular website.

Given that for my portfolio, I now had 2 webapps that I had created, a chatroom, and a calculator app, it seemed like it would merit taking some time to figure this out. I had backlogged setting this up my website on my own hosted server with SSL long enough. 

Time to man up! It's time for the rubber to meet the road!

So, I paid for a service on Linode. A Virtual Machine that cost like 5 bucks a month. My initial thought was, setup this Jekyll blog up, host it on my site using regular http. Make sure it works. Then use nginx to serve the site up. Then figure out how to create the certificate via letsencrypt, host it, and serve my content via the coveted https!

First off, I had read a couple of articles regarding a couple of Tier 2 VM providers. Amoungst them, Digital Ocean, and Vultr. I looked at stats, and in reality Digital Ocean and Linode always seemed to be playing in the same ballpark. Checking historical articles, if one provider had an edge in one moment, the next moment the other provider would have a slight edge in terms of VM capacity or performance. And vice versa.

I ended up choosing Linode because it's website seemed less slick when compared to Digital Ocean or Vultr. I guess my thought was, _real_ SysAdmins don't look to make things flashy on the front end, they bulk up things on the back end and provide a better technical product. Completly unbiased... I know. :)

I've currently created a couple of simple apps by using React, Jekyll, as well as Angular. Funny enough, deploying these sites were really not that difficult, and all share the same core concepts once you're happy with the finished product, and are ready to put the site into production.

Once ready, you have to run a script that will actually build "the site" that is ready/worthy for production. 

For the technologies I'm using, building the sites are actually not disimilar than some commands used to run the production server. For example, for this Jekyll site, in order to properly create the production site, I had to use `bundle exect jekyll build`. For creating the react site, I had to run `npm build`. To create the Angular site, I had to use the command `ng build --prod --build-optimizer`.

Typically the result of building the site will be a set of files ready to be hosted by a program such as Apache or nginx. These files are typically placed in a folder called `dist`, `_site`, or `build`. The content from these folders is what a program like nginx will use to serve the sites.

After generating these files, it was a matter of copying them to a folder within my brand new VM. I chose to host each set of project files in their own separate folders within the `~/apps` location on the server.

On the VM, I chose Debian Stretch, which is the current stable branch of Debian, and am using whichever was the most up-to-date Linode kernel provided. When I set up the server initially, I wanted to track as much of the software on the server as possible from the Debian repositories. I didn't want to add any external repositories if possible, as I am quite trusting of the timely security updates provided by Debian. Keeping a single point of upgrade in terms of administration of the server and it's assets would make it easy. I could have the server update via a package called _unattended-upgrades_, which would allow the server to install security updates as soon as they are available. That way, I really would only need to log into the system to reboot from time to time if there's a kernel upgrade or a kernel vulnerability that would require a restart. However, I'm not sure if Linode is managing this already or not.

In terms of kernel version, as long as it's being updated with security patches and whatnot, I'm pretty much happy with that. I would have preferred to have the default Debian stable kernel as it's tracing an LTS version of the linux kernel, however, will give this Linode kernel 4.14 kernel a try. They have different versions of "current" kernels. I would interpret current as kernels who's updates are current. I'm not sure if the VM will track this kernel for updates or patches directly via apt, or if the patches come automatically from a level above pertaining to Linode admins. Also not sure if they are patching directly and have any live or hotfix patching in place. Will need to look into this.

Continuing on, I installed nginx as I would need this to serve my content for a browser. I installed this via `apt-get install nginx` using Debian's stable repository.

I first setup my main site, just to make sure that everything was running correctly on my server, make sure it's IP Address is publicly accessible once assigned from my domain name.

I created a symbolic link from my main site's location it was copied into, which was `~/apps/main`, to where Debian would typically house web content to, which is '/var/www/html/main'.

I setup the nginx config file to serve this folder as the main site, and voila! [www.xavierjortiz.com](www.xavierjortiz.com) has landed!

The nginx file I created is shown below. It is located under `/etc/nginx/sites-available/www.xavierjortiz.com` and I symbolic linked it to `/etc/nginx/sites-enabled/www.xavierjortiz.com`. The reason for this symbolic link is because nginx allows you to setup separate configs for each site you plan on hosting under `/etc/nginx/sites-available/`. Once you put the site under production, you symbolicly link the config for the site into `/etc/nginx/sites-enabled`.

```
server {
  listen 80;
  listen [::]:80;
  server_name www.xavierjortiz.com;
  root /var/www/html/main;

  location / {
    index index.html index.htm index.php;
  }
}

```

Feeling kinda tired after posting this. I didn't think this was going to be a multi part blog post. I promise I'll finish this multi-parter.

What needs to be covered next is setting up a separate site on the same domain, however serving it one folder down, i.e.: `www.xavierjortiz.com/chatroom/`, setting up SSL configuration, and how to set both of these things up to be correctly served by nginx!
