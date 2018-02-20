---
layout: post
date: July 14, 2017
title: Angular $apply
feature-img: "img/sample_feature_img_2.png"
short-description:
published: false
---

Overview

---

## $apply

Working with a library like `plyr` introduced some complications due to the fact that there were events occurring outside of the variables attached to the Angular `$scope`. It took some research to understand the way that Angular maintains awareness of variables values for binding to the view. When changes to variables escape this normal binding-awareness pattern, one must manually tell the `$scope` about these changes by using it's `$apply` method. In the case of BlocJams, I had to use this strategy to ensure the playback position of the player bar was updated when the `plyr` object emitted the `timeupdate` event in the browser. You'll see this behavior in the `AudioService` service.

---

## Section 2

<content>
