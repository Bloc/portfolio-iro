---
title: AnalysisRTT
layout: collection
header:
  image: img/RTT_12_1_2016_24_hour_10min_chunk.png
  teaser: img/RTT_12_1_2016_24_hour_10min_chunk.png
---
This program was made for Cedexis, as I was tasked to collect .gz JSON S3 bucket information saved locally on a hard disk. Then, unzip, read, parse, and create a list that would allow plotting. Specifically for this task, the data parsed was organized in such as way that would allow easy data manipulation to plot the difference in roundtrip times between 2 CDN providers across a time period. The data object is saved in an easily retrievable file. Before plotting, the time chunks for aggregation could be specified. 

Github source can be found here: https://github.com/Xavier-J-Ortiz/AnalyzeRTT
