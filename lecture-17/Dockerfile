FROM rocker/verse
MAINTAINER Vincent Toups <toups@email.unc.edu>
ARG linux_user_pwd
RUN echo Hello World
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
RUN R -e "install.packages(c('shiny','plotly'))";


