FROM rocker/verse
ARG linux_user_pwd
RUN echo Hello World
RUN R -e "install.packages('gridExtra')"
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
COPY deps.R /
COPY setup14.x /
RUN apt update && apt install -y gpg-agent
RUN cat /setup14.x | sudo -E bash -
RUN apt install -y nodejs
RUN npm install -y -g @marp-team/marp-cli
RUN apt update && apt install -y python3-pip
RUN pip3 install hovercraft
