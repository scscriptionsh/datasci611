Welcome to UNC BIOS 611
=======================
Introduction to Data Science
----------------------------

This repository contains course materials for BIOS 611 (Introduction
to Data Science) typically taught during the Fall Semester at UNC
Chapel Hill in the Department of Biostatistics.

The intent of the course is to provide an intensive introduction to
the technical material and skills that a data scientist needs in order
to do repeatable, reliable research.

It covers basic linux tools like bash and make, Docker, git
(extensively) and serves as an introduction to R and Python including
how one goes about organizing a research project and an R or Python
library.

Along the way we will become informally familiar with some analytical
techniques: classification, regression and clustering. The emphasis
here is practical: how to use the methods while avoiding common
pitfalls.

Course Syllabus and Schedule
============================

Class is at 3:35 pm - 4:50 pm on MW. There is a lab session from 2:00
pm to 3:00 pm on Tuesdays.

Class is held in: McGavran-Greenberg PH-Rm 2308
Lab is held in: McGavran-Greenberg PH-Rm 2308


| Date            | Course Title                       | Material                         | Homework                       |
| ---             | ---                                | ---                              | ---                            |
| Mon 08/18/20201 | Introduction                       | [1][m1],[2][m2]                  | [hw1][hw1] due: Wed 08/25/2021 |
| Mon 08/23/2021  | Compute Resources                  | [1][m3],[2][m4],[3][m5]          | [hw2][hw2] due: Mon 08/30/2021 |
| Wed 08/25/2021  | Unix                               | [1][m8],[2][m6],[3][m7]          | [hw3][hw3] due: Wed 09/08/2021 |
| Mon 08/30/2021  | Docker                             | [1][m9],[2][m4],[3][m5],[4][m10] | [hw4][hw4] due: Wed 09/13/2021 |
| Wed 09/01/2021  | git basics & github basics         | [1][m13],[2][m14],[3][m15]       |                                |
| Mon 09/06/2020  | Labor Day 🍞🌹                     | [1][m12],[2][m16]                         |                                |
| Wed 09/08/2021  | How to Think about Programming & R |                                  |                                |
| Mon 09/13/2021  | More R                             |                                  |                                |
| Wed 09/15/2021  | Tidy Data & GGPlot                 |                                  |                                |
| Mon 09/20/2021  | Make and Makefiles                 |                                  |                                |
| Wed 09/22/2021  | git concepts and practices         |                                  |                                |
| Mon 09/27/2021  | Project Organization               |                                  |                                |
| Wed 09/29/2021  | Dimensionality Reduction           |                                  |                                |
| Mon 10/04/2021  | Clustering                         |                                  |                                |
| Wed 10/06/2021  | Classification                     |                                  |                                |
| Mon 10/11/2021  | Model Validation and Selection     |                                  |                                |
| Wed 10/13/2021  | Publishing Results                 |                                  |                                |
| Mon 10/18/2021  | Shiny                              |                                  |                                |
| Wed 10/20/2021  | Docker Recap and Shiny             |                                  |                                |
| Mon 10/25/2021  | Introduction to Scientific Python  |                                  |                                |
| Wed 10/27/2021  | SQL (and pandas, dplyr)            | [1][m11]                         |                                |
| Mon 11/01/2021  | SKLearn Introduction               |                                  |                                |
| Wed 11/03/2021  | Training Neural Networks           |                                  |                                |
| Mon 11/08/2021  | Bokeh                              |                                  |                                |
| Wed 11/10/2021  | Browser Based Visualization w/ d3  |                                  |                                |
| Mon 11/15/2021  | Data Science Ethics                |                                  |                                |
| Wed 11/17/2021  | Panel Discussion                   |                                  |                                |
| Mon 11/22/2021  | Thanksgiving 🦃                    |                                  |                                |
| Wed 11/24/2021  | Feedback Day                       |                                  |                                |
| Mon 11/29/2021  | Class Presentations I              |                                  |                                |
| Wed 12/01/2021  | Class Presentations II             |                                  |                                |
| ---             | ---                                | ---                              |                                |


There is also a lab held every Tuesday. This will be generally
unstructured time where you will be able to work on projects and ask
me questions. Sometimes we will use this time to cover material.

Working With This Stuff
=======================

I provide a Docker container which you can use to hack on these
lectures and the associated materials. Some lectures may have their
own Docker container. But to work on most of them:


    ./start-env.sh
    
This will start an RStudio Instance.

* * * 

[m1]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/01-course-intro-data-scientist/course-intro-data-scientist.org
[m2]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/01-course-intro-data-scientist/slides.Rpres
[m3]:https://its.unc.edu/research-computing/longleaf-cluster/
[m4]:https://docs.docker.com/docker-for-windows/install/
[m5]:https://docs.docker.com/engine/install/ubuntu/
[m6]:https://www.gnu.org/software/bash/manual/bash.html
[m7]:https://learnxinyminutes.com/docs/bash/
[m8]:https://github.com/Vincent-Toups/datasci611/tree/main/lectures/02-unix
[m9]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/03-Docker/docker.org
[m10]:https://learnxinyminutes.com/docs/docker/
[m11]:https://tomaugspurger.github.io/dplry-pandas.html
[m12]:https://en.wikipedia.org/wiki/Labor_Day
[m13]:https://git-scm.com/book/en/v2
[m14]:https://docs.github.com/en/get-started
[m15]:https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
[m16]:https://hyperallergic.com/313435/an-illustrated-guide-to-guy-debords-the-society-of-the-spectacle/
[hw1]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/01-course-intro-data-scientist/homework.md
[hw2]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/X-02-vcl/homework.md
[hw3]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/02-unix/homework.md
[hw4]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/03-Docker/homework.md
