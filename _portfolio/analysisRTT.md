---
layout: post
title: AnalysisRTT
feature-img: "img/sample_feature_img.png"
thumbnail-path: "https://d13yacurqjgara.cloudfront.net/users/3217/screenshots/2030966/blocjams_1x.png"
short-description: Python code that collects JSON encoded info, and plots relevant data

---
This program was made for Cedexis, as I was tasked to collect .gz JSON S3 bucket information saved locally on a hard disk. Then, unzip, read, parse, and create a list that would allow plotting. Specifically for this task, the data parsed was organized in such as way that would allow easy data manipulation to plot the difference in roundtrip times between 2 CDN providers across a time period. The data object is saved in an easily retrievable file The before plotting, the time chunks for aggregation could be specified. 
