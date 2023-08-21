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

| Date       | Topic                                   | Time         | Reading Materials                        |
|------------|-----------------------------------------|--------------|------------------------------------------|
| 2023-08-21 | Introduction                            | 3:35-4:50 pm | [m1], [m2]                               |
| 2023-08-22 | Lab                                     | 2-3 pm       |                                          |
| 2023-08-23 | Compute Resources                       | 3:35-4:50 pm | [m3]                                     |
| 2023-08-28 | Unix                                    | 3:35-4:50 pm | [m6], [m7], [m8]                         |
| 2023-08-29 | Lab                                     | 2-3 pm       |                                          |
| 2023-08-30 | Docker                                  | 3:35-4:50 pm | [m4], [m5], [m9], [m10]                  |
| 2023-09-04 | Labor Day                               | None         |                                          |
| 2023-09-05 | Well Being Day                          | None         |                                          |
| 2023-09-06 | git basics & github basics              | 3:35-4:50 pm | [m13], [m14], [m15], [m17]               |
| 2023-09-11 | How to Think about Programming & More R | 3:35-4:50 pm | [m18], [m19], [m20]                      |
| 2023-09-12 | Lab                                     | 2-3 pm       |                                          |
| 2023-09-13 | Tidyverse for Tidying & GGPlot          | 3:35-4:50 pm | [m21], [m23], [m24], [m25], [m26], [m27] |
| 2023-09-18 | Make and Makefiles                      | 3:35-4:50 pm | [m29], [m30]                             |
| 2023-09-19 | Lab                                     | 2-3 pm       |                                          |
| 2023-09-20 | git concepts and practices              | 3:35-4:50 pm | [m33]                                    |
| 2023-09-25 | Well Being Day                          | None         |                                          |
| 2023-09-26 | Lab                                     | 2-3 pm       |                                          |
| 2023-09-27 | Markdown, RMarkdown, Notebooks, L       | 3:35-4:50 pm | [m35], [m36]                             |
| 2023-10-02 | Project Organization                    | 3:35-4:50 pm |                                          |
| 2023-10-03 | Lab                                     | 2-3 pm       |                                          |
| 2023-10-04 | Dimensionality Reduction                | 3:35-4:50 pm | [m37], [m38], [m39], [m40]               |
| 2023-10-09 | Clustering                              | 3:35-4:50 pm | [m41], [m43], [m44]                      |
| 2023-10-10 | Lab                                     | 2-3 pm       |                                          |
| 2023-10-11 | Classification                          | 3:35-4:50 pm | [m45], [m46]                             |
| 2023-10-16 | Model Validation and Selection          | 3:35-4:50 pm | [m48], [m49], [m50], [m51], [m52]        |
| 2023-10-17 | Lab                                     | 2-3 pm       |                                          |
| 2023-10-18 | Shiny                                   | 3:35-4:50 pm | [m58]                                    |
| 2023-10-23 | Introduction to Scientific Python       | 3:35-4:50 pm | [m60], [m61]                             |
| 2023-10-24 | Lab                                     | 2-3 pm       |                                          |
| 2023-10-25 | SQL (and pandas, dplyr)                 | 3:35-4:50 pm | [m62], [m63], [m64]                      |
| 2023-10-30 | Pandas & SQL                            | 3:35-4:50 pm | [m64]                                    |
| 2023-10-31 | Lab                                     | 2-3 pm       |                                          |
| 2023-11-01 | SKLearn Introduction                    | 3:35-4:50 pm |                                          |
| 2023-11-06 | Training Neural Networks                | 3:35-4:50 pm |                                          |
| 2023-11-07 | Lab                                     | 2-3 pm       |                                          |
| 2023-11-08 | Bokeh                                   | 3:35-4:50 pm |                                          |
| 2023-11-13 | Browser Based Visualization w/ d3       | 3:35-4:50 pm | [m65], [m66]                             |
| 2023-11-14 | Lab                                     | 2-3 pm       |                                          |
| 2023-11-15 | Data Science Ethics                     | 3:35-4:50 pm | [m67], [m68]                             |
| 2023-11-20 | Panel Discussion                        | 3:35-4:50 pm |                                          |
| 2023-11-21 | Lab                                     | 2-3 pm       |                                          |
| 2023-11-22 | Thanksgiving                            | None         |                                          |
| 2023-11-27 | Web Scraping                            | 3:35-4:50 pm | [m69]                                    |
| 2023-11-28 | Lab                                     | 2-3 pm       |                                          |
| 2023-11-29 | Feedback Day                            | 3:35-4:50 pm |                                          |
| 2023-12-04 | Class Presentations I                   | 3:35-4:50 pm |                                          |
| 2023-12-05 | Lab                                     | 2-3 pm       |                                          |
| 2023-12-06 | Class Presentations II                  | 3:35-4:50 pm |                                          |


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
