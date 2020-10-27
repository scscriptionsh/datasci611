FROM rocker/verse
MAINTAINER Vincent Toups <toups@email.unc.edu>
ARG linux_user_pwd
RUN echo Hello World
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas sklearn plotnine matplotlib pandasql bokeh
RUN apt update -y && apt install -y apt-utils
RUN apt update -y && apt install -y texlive-latex-extra
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt update -y && apt install -y nodejs 
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install @bokeh/jupyter_bokeh
RUN pip3 install tensorflow keras

