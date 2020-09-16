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
RUN R -e "install.packages('ggfortify')"
RUN R -e "install.packages('pracma')"
RUN R -e "install.packages('Rtsne')"
RUN apt update -y && apt install -y python3-pip && pip3 install keras
RUN R -e "install.packages('keras'); reticulate::install_miniconda();"
RUN R -e "install.packages('tensorflow'); tensorflow::install_tensorflow();"
RUN R -e "install.packages('cluster')"
RUN R -e "install.packages('kernlab')"
