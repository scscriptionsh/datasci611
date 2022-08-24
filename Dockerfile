FROM rocker/verse
RUN wget https://sqlite.org/snapshot/sqlite-snapshot-202110132029.tar.gz
RUN tar xvf sqlite-snapshot-202110132029.tar.gz
WORKDIR sqlite-snapshot-202110132029
RUN ./configure && make && make install
WORKDIR /
RUN wget https://deb.nodesource.com/setup_16.x 
RUN bash setup_16.x
RUN apt update && apt-get install -y nodejs
RUN apt update && apt-get install -y openssh-server python3-pip
RUN pip3 install --pre --user hy
RUN pip3 install beautifulsoup4 theano tensorflow keras sklearn pandas numpy pandasql 
RUN ssh-keygen -A
RUN mkdir -p /run/sshd
RUN sudo usermod -aG sudo rstudio
RUN R -e "devtools::install_github('gastonstat/arcdiagram')"
RUN R -e "install.packages(c('matlab','Rtsne'));"
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4-terminal gnome-terminal dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x
RUN git clone git://git.kernel.org/pub/scm/git/git.git
WORKDIR /git
RUN make configure &&\
 ./configure --prefix=/usr &&\
 make all doc info &&\
 make install 
WORKDIR /
RUN R -e "install.packages(c(\"shiny\",\"deSolve\",\"signal\"))"
RUN R -e "install.packages(\"Rcpp\")";
RUN R -e "install.packages(\"reticulate\")";
RUN R -e "install.packages(\"ppclust\")";
RUN R -e "install.packages(\"gbm\")";
RUN R -e "install.packages(\"rdist\")";
RUN R -e "install.packages(\"caret\")";
RUN R -e "install.packages(c(\"shiny\",\"plotly\"))";
RUN pip3 install jupyter jupyterlab
RUN R -e "devtools::install_github(\"r-lib/ellipsis\");"
RUN R -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))"
RUN R -e "devtools::install_github(\"IRkernel/IRkernel\"); IRkernel::installspec(user=FALSE);"
RUN R -e "install.packages('RSQLite')";
RUN pip3 install matplotlib plotly bokeh plotnine dplython
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository ppa:kelleyk/emacs
RUN DEBIAN_FRONTEND=noninteractive apt update && DEBIAN_FRONTEND=noninteractive apt install -y emacs28
