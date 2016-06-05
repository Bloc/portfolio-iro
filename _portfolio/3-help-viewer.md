---
layout: case_study
title: Help Viewer
feature-img: "img/ng-help-viewer-dark.png"
thumbnail-path: "img/ng-help-viewer_thumbnail.jpg"
short-description: Product help pages.
demo-url: http://ng-help-viewer.herokuapp.com

---
At Bloc, the final project of the course is the Capstone, where you apply everything you learned to build an application of your choosing. I decided to develop a portal or viewer for product help topics. The idea was to add an authoring environment with two roles (author and reader) and user authentication (via Firebase or Amazon Web Services) but time ran out to do all the features I wanted. As it stands, the application currently only includes the viewer (reader role).

### Method

I did the project in four main phases: requirements, design, implementation, and deployment. These are all described below. It's developed as a JavaScript application in the Angular framework, and connects with the [Firebase](https://www.firebase.com/) API to store help content.

I also purchased a feature-rich Bootstrap CSS framework but for intellectual property reasons cannot offer the code in a public repository (hence no repository button for this project).

### Challenge

This project gave me the opportunity to learn more about requirements and design, especially wireframing. The project had time constraints but I could leverage knowledge about JavaScript and Firebase from other projects.

### Solution

The Help Viewer application displays help topics for a given product.

{:.center}
![]({{ site.baseurl }}/img/ng-viewer-parts.png)

1. Product dropdown: choosing a product displays the relevant topics in the left sidebar.
2. Topic list: topics in the left sidebar are organized by **category**. When you click a category to select it, it's highlighted in blue and shows a - sign. Its topics are displayed beneath it (accordion menu).
3. Topic & sections: each topic consists of at least one section (e.g., "Products" and "Who uses the system" as shown in the screenshot above).


#### 1. Requirements

My Bloc mentor encouraged me to use GitHub Issues for user stories, bugs, etc. This is a user-friendly tool for collaboration and I fully embraced it.
{:.center}
![]({{ site.baseurl }}/img/ng-help-viewer-issues.png)

So the requirements phase consisted of writing a dozen user stories for both help topic readers and authors, then breaking these down into individual tasks.

One requirement was for content storage and retrieval, and I wanted to try the idea of storing all help content in a third-party cloud using an API. Firebase fit the bill perfectly. They offer an impressive 10MB per child node in a tree, so I was able to store an entire topic (with sections and markup) in Firebase and display it in the app when required by the reader.

Images however are stored with the app itself, which understandably increases its overall size. The markup in Firebase only references the images (with `href`). My mentor and I discussed several possible solutions, from using Dropbox or even using Amazon Web Services. The latter would have been easier for topic authors, but more challenging to implement.

I also provided a list of possible enhancements, should I ever return to extend this app's functionality.

#### 2. Design

I learned about the benefits of using [Moqups](https://moqups.com/) for wireframing.
{:.center}
![]({{ site.baseurl }}/img/ng-help-viewer-moqups.png)

One can pay a subscription to Moqups for extra features like exporting to PNG but the free version is sufficient for sketching up some initial wireframes. The free version also lets you share your design with team collaborators. With Moqups it was far easier to wireframe than I had anticipated, so the design phase was an enjoyable experience.

#### 3. Implementation

During the implementation phase I coded user stories and tasks one after the other, closing them when done. Having already described the requirements and designed the UI in the previous phases, I found implementation work to be a little easier than otherwise.

I was pleasantly surprised by how easily I could store help topics in all their HTML glory in Firebase, then retrieve them again in the app. I wrote separate Angular factories for each list in Firebase: `Product.js`, `Category.js`, `Topic.js`, and `Section.js` to provide the content to any controller.

In the `home` template of the app, I use Angular directives like `ngShow` and `ngRepeat` to correctly display relevant help topic content stored in Firebase.

Once enhancement that interested me was the possibility of printing topics. Implementing a print feature is apparently much easier on the server side so I would be challenged to write one for a client-side app like this one. My mentor recommended trying out [DocRaptor](https://docraptor.com/). I was looking forward to adding client-side printing but unfortunately had issues implementing the DocRaptor API in Angular. There is no guidance on the DocRaptor site for using their API with Angular (only with jQuery and other scripting languages).

Search was also something I wanted to add but unfortunately time ran out.

#### 4. Deployment

When using Heroku to deploy the app I found a little issue with the display of the + and - icons used for denoting active and inactive categories in the left sidebar accordion menu. The app on Heroku wasn't displaying these properly because Heroku prevented the CDN for ionicons from loading due to `http` (instead of `https`) being used. This is apparently a security concern so I changed all such references to `https`.

### Conclusions

It was quite an experience implement a frontend application through all the different phases - from user stories to the final product. Though minimal, this app or one like it could be used for product documentation. The main thing that's missing - and can implemented - is an "author view" to author help topics in markdown or HTML. One powerful feature is the ability to store content using a third-party cloud solution like Firebase. This, combined with JavaScript's dynamic features, makes the app very fast and responsive.
