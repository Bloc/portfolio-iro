---
layout: post
title: Working with Jenkins
---

Now comes the bit part. Many bits and bobs, but will try to capture all the steps required to install Jenkins as well as setup a repo together with the key links that helped me along the way.

# Install Jenkins, lets start from the top

So, Jenkins install. Easy, instructions found [here](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu). 

Below is the code block to install the LTS version of Jenkins on Debian. LTS because we don't want to get constant updates on our Jenkins environment and having us micromanage our CI/CD software at a possibly much more granular level. We want to aim for "set it and forget it" for the most part.

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

**One thing worth mentioning as we did just install jenkins, all jenkins processes _will be run_ as the `jenkins` user, which is why we installed the RVM and ruby environemnt on the `jenkins` user as described in the [RVM and Jekyll install for Jenkins](https://www.xavierjortiz.com/2022/03/26/rvm.html) post**

I'm paraphrasing, but on first login, you'll be asked to "install commonly used plugins". It's highly recommended that you do this.

# Installing Github Multibranch GitSCm plugin

Make sure you have the `Git Branch Source Plugin`. This will allow you to add a webhook to your git repo, so that any change that is uploaded would get sensed by Jenkins, and it's process would get kicked off.
![Multibranch Plugin](/assets/img/jenkins-installed/pipeline_4.png)


# Setting up a pipeline for Jekyll portfolio sourced from github
After logging into Jenkins, click on new Pipeline here.
![New Item](/assets/img/jenkins-installed/pipeline_1.png)

Select Multibranch Pipeline, and fill in a meaningful name, like shown below
![enter Item](/assets/img/jenkins-installed/pipeline_2.png)

Select Github as the branch source and input the repository. notice that the `Blue Ocean` credentails were input. This automagically got added once when I added the repo on BlueOcean. However, I don't know how to remove it. You can use credentials as "none" for the time being, and not have any additional issues, as this repo is public. 

At a later date, I'll find a way to generate the proper token or auth manually, as I would like to move off of the Blue Ocean credentials.
![Github source](/assets/img/jenkins-installed/pipeline_3.png)

Since we installed the `Git Branch Source Plugin`, you can now add the webhook for github so that it will trigger Jenkins to pull and run it's configured build process.

Select the `Scan by webhook` and input a token of your choosing. You'll need to use this token and add it to github when creating the webhook later on.

I added a value for `Periodically if not otherwise run`, once a day, just in case the webhook breaks for whatever reason. Not required.

![adding webhook](/assets/img/jenkins-installed/pipeline_5.png)

Scroll to the bottom and hit save!

Voila, it's done!

# Webhook on Github
So, we've configured the webhook token on Jenkins. Lets create the webhook on Github. Remember, you will need the token you created on the pipeline creation.

Go to your repo, and select your repo's settings.
![github repo settings](/assets/img/jenkins-installed/pipeline_6.png)

Then on the left pane, select webhooks and `Add webhook`.

Under the Manage webhook view, specify the `Payload URL` like so: `JENKINS_URL/multibranch-webhook-trigger/invoke?token=[Trigger token]` and set the `Content type` as `application/json`. You can then set all the rest of the settings as you would like. I'd recommend that SSL verification be setup, but you may need to set up your workload to be served via `https`. 

![Manage Webhooks](/assets/img/jenkins-installed/pipeline_7.png)

Congratz! You're now going to let Jenkins run this pipeline once one of your repositories is updated.

# Home Stretch, creating and understanding the `Jenkinsfile`

In 
