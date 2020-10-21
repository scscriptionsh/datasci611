# handy aliases for working with the docker file
# and doing other stuff

source secrets.sh

alias bu='docker build . -t l17 --build-arg linux_user_pwd=$SECRET_PWD'
alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it l17 sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
alias rss='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -p 8787:8787 -t l17'
alias b='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it l17 sudo -H -u rstudio /bin/bash -c "cd ~/; /bin/bash"'
alias jl='docker run -p 8765:8765 -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it l17 sudo -H -u rstudio /bin/bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8765"'

start_shiny(){
    docker run -p $2:$2 -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it l17 sudo -H -u rstudio /bin/bash -c "cd ~/; PORT=$2 make $1"
}

alias rs='docker run '


