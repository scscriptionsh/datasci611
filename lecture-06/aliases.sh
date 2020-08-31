# handy aliases for working with the docker file
# and doing other stuff

alias bu='docker build . -t l6 --build-arg linux_user_pwd=not_important'
alias hc='docker run -p 8711:8000 -v `pwd`:/host -it l6 hovercraft /host/slides.rst'
alias hcb='docker run -v `pwd`:/host -it l6 hovercraft /host/slides.rst /host/html_presentation'

alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=not_important -it l6 sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
