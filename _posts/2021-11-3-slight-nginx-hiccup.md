---
layout: post
title: NGINX snafu linked to letsencrypt?
---

Clearly I have things running, given that the previous, and this current, post are both up and running.

However, I did run into some NGINX issues. Or rather, NGINX config issues that stemmed from a letsencrypt update.

Letsencrypt recently had a certificate issue. The gist of it is, one of their root CA certs expired, which basically made all the certs that were signed by this cert to be invalid and need to be reissued. This issue did not affect this website, as it seems that the version of `certbot` that I had used was new enough that it had correctly addressed this issue.

However... It had been quite some time since the package had been installed on the debian server. In fact, I had installed it via `backports`.

Package mantainers sometimes add  packages that have made it into unstable, and then add them to the `backports` repo so you may leverage some more up to date packages on the `stable` branch of debian. This is important, and I've used the following packages off of backports when I was using debian `stable` as my main distro. Things such as `linux-kernel-headers`, `linux-kernel-image`, and `nvidia-drivers`. Given that these move ahead quite quickly, and even the kernel may have some new modules that might benefit a desktop user.

Getting back to `certbot`, it *used* to be in the `stable` branch's backports, but as of late, [that has changed](https://certbot.eff.org/lets-encrypt/debiantesting-nginx). Seems the way to install it is via a `snap` package.

 Not gonna lie, I don't like to add snap packages if I can avoid them.

Snap packages are supposed to be version, distro agnostic. This of course *sounds* really cool, and does have it's benefits. But.... unfortunately, from what I've read, you also install a lot of extra packages into the snap environment that runs the program you're installing, and well... creates a bit of bloat. Though I would hope that the bloat won't go into the main system, given that I would assume that the snap environment is isolated form the main distro's environment, but I don't know enough of this just yet to say it is one way or another.

Anyway, lets assume the best, and that the snap environment is just going to use some more storage space up on my server. Fine. Price paid.

The bigger issue that I haven't figured out yet is how to upgrade the package so that it's up to date without my intervention.

So... with debian, I could always do unattended upgrades. Which, typically I only enabled unattended upgrades on security patches/upgrades. But, not sure how to go about doing something unattended on a snap that is housing the `cerbot` package.

Though, now that I think about it, the `unattended-upgrade` packages would not activate the certbot package from what I recall, given that the `certbot` package was part of `backports`. I don't believe that backports is in `unattended-upgrades` unless you made it. Which I didn't, mainly because you never know when a package upstream might bork something downstream.

Anyway.... I had to bite this bullet for the short term, and as I get familiar with the way this goes, maybe long term. We'll see.

Either way, NGINX was working, then after updating certbot, it wasn't. It seems that the `certbot` snap package would modify the nginx config files for the sites incorrectly. grrr.

Anyway, after brushing up on my nginx-ese, I realized that certbot was adding a couple of lines where not needed, and creating a serverblock where not needed. With this, would generate some bad URL routing and basically take my site offline.

grrr.

Was able to fix this and get it working, and I'm better for it because I updated my nginx config for this website! Yay!

For the time being, will keep the certbot snap package, but am not very convinced, nor really wanting, to move to having a snap on a debian system. Kinda defeats the point to add bloat, when the reason when I installed debian was to avoid any (slight) Ubuntu bloat. 

**UPDATE: as I write this, I realize that the [debian documentation](https://wiki.debian.org/LetsEncrypt) now points to using the certbot that comes with `stable` now. So, Will probably migrate to that in order to not muck around with snaps.**

**UPDATE-2: I did end up using the packages from debian. So much easier to manage, and I also know that the security part is going to be just fine to manage via `unattended-upgrades` **
