# handy aliases for working with the docker file
# and doing other stuff

source secrets.sh

alias bu='docker build . -t l10 --build-arg linux_user_pwd=$SECRET_PWD'
alias hc='docker run -p 8711:8000 -v `pwd`:/host -it l10 hovercraft /host/slides.rst'
alias hcb='docker run -v `pwd`:/host -it l10 hovercraft /host/slides.rst /host/html_presentation'

alias r='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it l10 sudo -H -u rstudio /bin/bash -c "cd ~/; R"'
alias rss='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -p 8787:8787 -t l10'
alias b='docker run -v `pwd`:/home/rstudio -e PASSWORD=$SECRET_PWD -it l10 sudo -H -u rstudio /bin/bash'
