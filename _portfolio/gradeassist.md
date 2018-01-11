---
layout: post
title: GradeAssist
feature-img: "img/hubble_img.jpg"
thumbnail-path: "img/gradeassist/gradeassist_class_overview.png"
short-description: A rails app created to aide ESL teachers at QCC.

---
Good teachers spend most of their time preparing lessons and working with students. They should spend as little time as possible on recording and compiling grades. That is where GradeAssist comes in. GradeAssist is a record keeping app designed to make grading as efficient as possible so that teachers can get back to teaching.

**Try it out here** [GradeAssist](https://gradeassist.herokuapp.com/)

**Github Repository** [SJl149/grade-assist](https://github.com/SJl149/grade-assist)

{:.center}
![]({{ site.baseurl }}/img/gradeassist/gradeassist_landing.png)

## Explanation
GradeAssist was developed specifically for the Port of Entry(POE) ESL program at Queensborough Community College(QCC). I created this project out of personal necessity and pity. I noticed that the teachers in the program constantly felt rushed and overworked gathering and compiling all of the grades for the end of the semester grade reports. As a teacher in this program, I experienced this problem firsthand and decided to build GradeAssist. I created this app with some help from my mentor, Charlie Gaines, and presented it to the other teachers, several of which found a significant time savings from using GradeAssist.

## Problem
Grading and record keeping can be a time-consuming activity. Teachers in the POE program encountered these problems:
+ Keeping track of attendance
+ Recording daily grades(participation, homework, quizzes, final exams/projects)
+ Having a way to check students progress quickly
+ Averaging grades and producing grade reports
This is why I decided to create GradeAssist.

{:.center}
![Teacher Dashboard]({{ site.baseurl }}/img/gradeassist/gradeassist_dashboard.png)

## Solution
GradeAssist solves these problems. Built with Rails 4, it is a web app accessible to anyone with internet access. Bootstrap and Sass allow for easy styling. Devise is used to manage users.

Features include:
+ A **Teacher's Dashboard** as the home page with quick access to daily grades and course overview pages.

+ Attendance, participation, and homework (three categories that are record every day) are accessed from the teacher's dashboard. The closest current day's records are displayed with buttons to make recording as quick as possible.

+ The **Course Overview** page displays absences/lates, averaged grades by category, and a note for comments. This page allows teachers to see the overall performance of each student.

+ Detailed student records can be accessed from the **Course Overview** page.

+ A `.xls` file can be downloaded allowing teachers to easily format grade reports.

{:.center}
![]({{ site.baseurl }}/img/gradeassist/gradeassist_attendance.png)

## Results
GradeAssist was used during the fall semester of 2017. Most teachers who used it found that it greatly eased the burden of grade reporting. One teacher commented, "It saved me a lot of time recording attendance and homework. When a student asked how they were doing in the class, I could tell them with just a few clicks on the app. It saved so much time at the end of the semester!"

{:.center}
![]({{ site.baseurl }}/img/gradeassist/gradeassist_class_overview.png)

## Conclusion
GradeAssist not only helped solve problems at work it also taught me much about the process of developing software. It was the first Rails app that I built on my own from scratch. I needed to think about how to organize the schema, design the structure of the app, and meet the needs of the users. The last part was the most challenging. While I did solve the problems mentioned above, not all of the teachers found the app to their liking. I am currently working on a newer version of GradeAssist to address their concerns and improve on the initial design.

When I first started this app, I didn't feel comfortable using Rails or software development in general. I doubted my skills and whether I could create my own app. I faced many challenges along the way, but in the end, with lots of hard work, found that I was able to do it.
