FROM rocker/verse 
RUN wget https://deb.nodesource.com/setup_16.x 
RUN bash setup_16.x
RUN apt update && apt-get install -y nodejs
RUN apt update && apt-get install -y emacs openssh-server python3-pip
RUN pip3 install --pre --user hy
RUN pip3 install beautifulsoup4 theano keras sklearn pandas numpy pandasql 
RUN ssh-keygen -A
RUN mkdir -p /run/sshd
RUN sudo usermod -aG sudo rstudio
RUN R -e "devtools::install_github('gastonstat/arcdiagram')"
RUN R -e "install.packages(c('matlab','Rtsne'));"
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4-terminal gnome-terminal


