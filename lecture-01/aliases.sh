# handy aliases for working with the docker file
# and doing other stuff

source secrets.sh

alias bu='docker build . --build-arg linux_user_pwd=$RPW -t l1'
alias dr='docker run -v `pwd`:/home/rstudio -e PASSWORD=$RPW -it l1'
alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=$RPW -it l1 sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
alias b='docker run -v `pwd`:/home/rstudio -e PASSWORD=$RPW -it l1 sudo -H -u rstudio /bin/bash -c "cd ~/; /bin/bash"'
alias rss='docker run -p 8787:8787 -v `pwd`:/home/rstudio -e PASSWORD=$RPW -t l1'
alias hc='docker run -p 8000:8000 -v `pwd`:/home/rstudio -e PASSWORD=$RPW -t l1 sudo -H -u rstudio /bin/bash -c "cd ~/; hovercraft slides.rst"'
