FROM rocker/verse
ARG linux_user_pwd
RUN echo Hello World
RUN R -e "install.packages('gridExtra')"
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
COPY deps.R /
RUN R -e "install.packages('plotly')"
RUN R -e "install.packages('MLmetrics')"
RUN R -e "install.packages(c('gbm','pdp'))"
 
