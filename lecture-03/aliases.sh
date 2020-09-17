# handy aliases for working with the docker file
# and doing other stuff

alias bu='docker build . -t l3'
alias hc='docker run -p 8711:8000 -v `pwd`:/host -it l3 hovercraft /host/slides.rst'
alias hcb='docker run -v `pwd`:/host -it l3 hovercraft /host/slides.rst /host/html_presentation'

alias bur='docker build . -f RDockerfile --build-arg linux_user_pwd=not_important -t l3r'
alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=not_important -it l3r sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
