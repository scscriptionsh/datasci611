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
Lab is held in: McGavran-Greenberg PH-Rm 2306

|----------------------|-------------|---------------------------------------|-----------------------------------------------------------------------------------|
| Date                 | Time        | Subject                               | Reading                                                                           |
|----------------------|-------------|---------------------------------------|-----------------------------------------------------------------------------------|
| Monday 2022-08-15    | 3:35-4:50pm | Introduction                          | [1][m1],[2][m2]                                                                   |
| Tuesday 2022-08-16   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-08-17 | 3:35-4:50pm | Compute Resources                     | [1][m3],[2][m4],[3][m5]                                                           |
| Monday 2022-08-22    | 3:35-4:50pm | Unix                                  | [1][m5],[2][m6],[3][m7],[4][m8]                                                   |
| Tuesday 2022-08-23   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-08-24 | 3:35-4:50pm | Docker                                | [1][m9][2][m10]                                                                   |
| Monday 2022-08-29    | 3:35-4:50pm | git basics & github basics            | [1][m13][2][m15][3][m17][4][m14]                                                  |
| Tuesday 2022-08-30   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-08-31 | 3:35-4:50pm | How to Think about Programming & R    | [1][m18][2][m19][3][m20][4][m21][5][m22][6][m23][7][m24][8][m25][9][m26][10][m27] |
| Monday 2022-09-05    | No Class    | 🍞 🌹 Labor Day                       |                                                                                   |
| Tuesday 2022-09-06   | No Class    | 🥰 🥰 Well-being Day                  |                                                                                   |
| Wednesday 2022-09-07 | 3:35-4:50pm | More R                                |                                                                                   |
| Monday 2022-09-12    | 3:35-4:50pm | Tidyverse for Tidying & GGPlot        |                                                                                   |
| Tuesday 2022-09-13   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-09-14 | 3:35-4:50pm | Make and Makefiles                    |                                                                                   |
| Monday 2022-09-19    | 3:35-4:50pm | git concepts and practices            |                                                                                   |
| Tuesday 2022-09-20   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-09-21 | 3:35-4:50pm | Markdown, RMarkdown, Notebooks, Latex |                                                                                   |
| Monday 2022-09-26    | No Class    | 🥰 🥰 Well-being Day                  |                                                                                   |
| Tuesday 2022-09-27   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-09-28 | 3:35-4:50pm | Project Organization                  |                                                                                   |
| Monday 2022-10-03    | 3:35-4:50pm | Dimensionality Reduction              |                                                                                   |
| Tuesday 2022-10-04   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-10-05 | 3:35-4:50pm | Clustering                            |                                                                                   |
| Monday 2022-10-10    | 3:35-4:50pm | Classification                        |                                                                                   |
| Tuesday 2022-10-11   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-10-12 | No Class    | 🤔 🎓 University Day                  |                                                                                   |
| Monday 2022-10-17    | 3:35-4:50pm | Model Validation and Selection        |                                                                                   |
| Tuesday 2022-10-18   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-10-19 | 3:35-4:50pm | Shiny                                 |                                                                                   |
| Monday 2022-10-24    | 3:35-4:50pm | Introduction to Scientific Python     |                                                                                   |
| Tuesday 2022-10-25   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-10-26 | 3:35-4:50pm | SQL (and pandas, dplyr)               |                                                                                   |
| Monday 2022-10-31    | 3:35-4:50pm | Pandas & SQL                          |                                                                                   |
| Tuesday 2022-11-01   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-11-02 | 3:35-4:50pm | SKLearn Introduction                  |                                                                                   |
| Monday 2022-11-07    | 3:35-4:50pm | Training Neural Networks              |                                                                                   |
| Tuesday 2022-11-08   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-11-09 | 3:35-4:50pm | Bokeh                                 |                                                                                   |
| Monday 2022-11-14    | 3:35-4:50pm | Browser Based Visualization w/ d3     |                                                                                   |
| Tuesday 2022-11-15   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-11-16 | 3:35-4:50pm | Data Science Ethics                   |                                                                                   |
| Monday 2022-11-21    | 3:35-4:50pm | Panel Discussion                      |                                                                                   |
| Tuesday 2022-11-22   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-11-23 | No Class    | 🦃 🦃 Thanksgiving                    |                                                                                   |
| Monday 2022-11-28    | 3:35-4:50pm | Web Scraping                          |                                                                                   |
| Tuesday 2022-11-29   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-11-30 | 3:35-4:50pm | Feedback Day                          |                                                                                   |
| Monday 2022-12-05    | 3:35-4:50pm | Class Presentations I                 |                                                                                   |
| Tuesday 2022-12-06   | 2:00-3:00pm | Lab                                   |                                                                                   |
| Wednesday 2022-12-07 | 3:35-4:50pm | Class Presentations II                |                                                                                   |



Lab will be generally unstructured time where you will be able to work
on projects and ask me questions. Sometimes we will use this time to
cover material.

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
