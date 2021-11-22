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


| Date            | Course Title                       | Material                                                 | Homework                         |
| ---             | ---                                | ---                                                      | ---                              |
| Mon 08/18/20201 | Introduction                       | [1][m1],[2][m2]                                          | [hw1][hw1] due: Wed 08/25/2021   |
| Mon 08/23/2021  | Compute Resources                  | [1][m3],[2][m4],[3][m5]                                  | [hw2][hw2] due: Mon 08/30/2021   |
| Wed 08/25/2021  | Unix                               | [1][m8],[2][m6],[3][m7]                                  | [hw3][hw3] due: Wed 09/08/2021   |
| Mon 08/30/2021  | Docker                             | [1][m9],[2][m4],[3][m5],[4][m10]                         | [hw4][hw4] due: Wed 09/15/2021   |
| Wed 09/01/2021  | git basics & github basics         | [1][m13],[2][m14],[3][m15],[4][m16]                      | [hw5][hw5] due: Mon 09/20/2021   |
| Mon 09/06/2020  | Labor Day 🍞🌹                     | [1][m12],[2][m16]                                        |                                  |
| Wed 09/08/2021  | How to Think about Programming & R | [1][m18],[2][m19]                                        | [hw6][hw6] due: Wed 09/27/2021   |
| Mon 09/13/2021  | More R                             | [1][m20],[2][m23]                                        |                                  |
| Wed 09/15/2021  | Tidyverse for Tidying & GGPlot     | [1][m22],[2][m24],[3][m25],[4][m26],[5][m27][6][m28]     |                                  |
| Mon 09/20/2021  | Make and Makefiles                 | [1][m29][2][m30]                                         |                                  |
| Wed 09/22/2021  | git concepts and practices         | [1][m31][2][m32][3][m33]                                 |                                  |
| Mon 09/27/2021  | Project Organization               | [1][m34][2][m35][3][m36]                                 |                                  |
| Wed 09/29/2021  | ~~~~                               |                                                          |                                  |
| Mon 10/04/2021  | Dimensionality Reduction           | [1][m37][2][m38][3][m39][4][m40]                         | [hw7][hw7] due: Mon 10/11/2021   |
| Wed 10/06/2021  | Clustering                         | [1][m41][2][m42][3][m43][4][m44]                         | [hw8][hw8] due: Wed 10/13/2021   |
| Mon 10/11/2021  | Classification                     | [1][m45][2][m46][3][m47][4][m48][5][m49][6][m50][7][m51] | [hw9][hw9] due: Mon 10/18/2021   |
| Wed 10/13/2021  | Model Validation and Selection     | [1][m52][2][m53]                                         |                                  |
| Mon 10/18/2021  | Shiny                              | [1][m54][2][m55][3][m56][4][m57][5][m58][6][m59]         | [hw10][hw10] due: Mon 10/25/2021 |
| Wed 10/20/2021  | Introduction to Scientific Python  | [1][m60][2][m61]                                         | [hw11][hw11] due: Wed 10/27/2021 |
| Mon 10/25/2021  | SQL (and pandas, dplyr)            | [1][m11][2][m62][3][m63]                                 |                                  |
| Wed 10/27/2021  | Pandas & SQL                       | [1][m64][2]                                              | [hw12][hw12] due: Wed 11/03/2021 |
| Fri 10/29/2021  |                                    |                                                          | Mid Term Project Review          |
| Mon 11/01/2021  | SKLearn Introduction               |                                                          |                                  |
| Wed 11/03/2021  | Training Neural Networks           |                                                          |                                  |
| Mon 11/08/2021  | Bokeh                              |                                                          |                                  |
| Wed 11/10/2021  | Browser Based Visualization w/ d3  | [1][m65][2][m66]                                         |                                  |
| Mon 11/15/2021  | Data Science Ethics                | [1][m67][2][m68]                                         |                                  |
| Wed 11/17/2021  | Panel Discussion                   |                                                          |                                  |
| Mon 11/22/2021  | Web Scraping                       | [1][m69]                                                         |                                  |
| Wed 11/24/2021  | Feedback Day                       |                                                          |                                  |
| Mon 11/29/2021  | Class Presentations I              |                                                          |                                  |
| Wed 12/01/2021  | Class Presentations II             |                                                          | ---                              |
| ---             |                                    |                                                          |                                  |


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
[m17]:https://liyanxu.blog/2017/02/12/install-git-on-windows-and-set-up-ssh-keys/
[m18]:https://learnxinyminutes.com/docs/r/
[m19]:http://adv-r.had.co.nz/
[m20]:http://adv-r.had.co.nz/Computing-on-the-language.html
[m21]:https://dplyr.tidyverse.org/articles/programming.html
[m22]:https://www.popularmechanics.com/science/a22577/genetics-papers-excel-errors/
[m23]:https://dplyr.tidyverse.org/
[m24]:https://tidyr.tidyverse.org/
[m25]:https://readr.tidyverse.org/
[m25]:https://ggplot2.tidyverse.org/
[m26]:https://magrittr.tidyverse.org/
[m27]:https://r4ds.had.co.nz/tidy-data.html
[m28]:https://www.interaction-design.org/literature/article/preattentive-visual-properties-and-how-to-use-them-in-information-visualization
[m29]:https://www.gnu.org/software/make/
[m30]:https://learnxinyminutes.com/docs/make/
[m31]:https://www.man7.org/linux/man-pages/man1/diff.1.html
[m32]:https://man7.org/linux/man-pages/man1/patch.1.html
[m33]:https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging
[m34]:https://github.com/virkud/bios611-project1
[m35]:https://www.latex-project.org/
[m36]:https://bookdown.org/yihui/rmarkdown-cookbook/install-latex.html
[m37]:https://en.wikipedia.org/wiki/Manifold_hypothesis
[m38]:https://en.wikipedia.org/wiki/Vector_space
[m39]:https://en.wikipedia.org/wiki/T-distributed_stochastic_neighbor_embedding
[m40]:https://scikit-learn.org/stable/modules/manifold.html
[m41]:https://https://scikit-learn.org/stable/auto_examples/cluster/plot_cluster_comparison.html
[m42]:https://rstudio.github.io/reticulate/
[m43]:https://en.wikipedia.org/wiki/K-means_clustering
[m44]:https://en.wikipedia.org/wiki/Spectral_clustering
[m45]:https://en.wikipedia.org/wiki/Linear_discriminant_analysis
[m46]:https://en.wikipedia.org/wiki/AdaBoost
[m47]:https://www.rdocumentation.org/packages/gbm/versions/2.1.8
[m48]:https://en.wikipedia.org/wiki/Receiver_operating_characteristic
[m49]:https://en.wikipedia.org/wiki/Linear_discriminant_analysis
[m50]:https://en.wikipedia.org/wiki/Logistic_regression
[m51]:https://en.wikipedia.org/wiki/F-score
[m52]:https://topepo.github.io/caret/model-training-and-tuning.html
[m53]:https://en.wikipedia.org/wiki/Cross-validation_(statistics)
[m54]:https://www.geeksforgeeks.org/difference-between-127-0-0-1-and-0-0-0-0/
[m55]:https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview
[m56]:https://en.wikipedia.org/wiki/HTML
[m57]:https://en.wikipedia.org/wiki/JavaScript
[m58]:https://shiny.rstudio.com/
[m59]:https://plotly.com/r/
[m60]:https://learnxinyminutes.com/docs/python/
[m61]:https://numpy.org/
[m62]:https://sqlite.org/index.html
[m63]:https://www.sqlite.org/windowfunctions.html
[m64]:https://predictivehacks.com/dplyr-like-pipes-for-data-manipulation-in-python-using-pandas/ 
[m65]:https://github.com/d3/d3/blob/main/API.md
[m66]:https://bl.ocks.org/
[m67]:https://www.hhs.gov/ohrp/regulations-and-policy/belmont-report/index.html
[m68]:https://theconvivialsociety.substack.com/p/the-questions-concerning-technology
[m69]:https://en.wikipedia.org/wiki/Web_scraping

[hw1]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/01-course-intro-data-scientist/homework.md
[hw2]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/X-02-vcl/homework.md
[hw3]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/02-unix/homework.md
[hw4]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/03-Docker/homework.md
[hw5]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/04-git-basics/homework.md
[hw6]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/05-Programming-and-Programming-in-R/homework-p1.md
[hw7]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/10-dimensionality-reduction/homework.md
[hw8]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/11-clustering/homework.md
[hw9]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/12-classification/homework.md
[hw10]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/14-shiny/shiny-homework.md
[hw11]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/15-python/python-homework.md
[hw12]:https://github.com/Vincent-Toups/datasci611/blob/main/lectures/17-pandas-sklearn/sql-pandas-homework.md
