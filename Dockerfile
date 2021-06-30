FROM rocker/verse 
RUN wget https://deb.nodesource.com/setup_16.x 
RUN bash setup_16.x
RUN apt-get install -y nodejs
RUN R -e "devtools::install_github('gastonstat/arcdiagram')"


