#!/bin/bash 

function box_out()
{
  local s=("$@") b w
  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done
  tput setaf 3
  echo " -${b//?/-}-
| ${b//?/ } |"
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 4)" "-$w" "$l" "$(tput setaf 3)"
  done
  echo "| ${b//?/ } |
 -${b//?/-}-"
  tput sgr 0
}

docker build . -t 611

MODE=$1

if [ -z "$MODE" ] || [ "$MODE" == "rstudio" ];
then
export R_PASS=$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo)
docker run --rm \
 -p 8787:8787 \
 -p 8722:22 \
 -p 8080:8080\
 -e PASSWORD=$R_PASS\
 -v $(pwd):/home/rstudio/bios611\
 -d\
 -t 611 > /tmp/docker-output

export DOUT=$(cat /tmp/docker-output)

echo $DOUT

export CID=$(echo $DOUT | tail -1)

box_out 'Log into RStudio on port 8787'\
        'Username: rstudio'\
        "Password: $R_PASS"\
        'to kill the docker container'\
        "run \"docker kill $CID\""

fi

if [ "$MODE" == "term" ];
then
x11docker --clipboard --share ~/.ssh --share $(pwd) --share ~/.emacs.d --share ~/.emacs-trash 611 /bin/xfce4-terminal
fi

if [ "$MODE" == "emacs" ];
then
    xhost +SI:localuser:$(whoami) 
    docker run -p 8888:8888 \
       -p 8787:8787 \
       -v /home/toups/.emacs.d:/home/rstudio/.emacs.d \
       -v /home/toups/.emacs-trash:/home/rstudio/.emacs-trash \
       -v $(pwd):/home/rstudio/work \
       --user rstudio \
       --workdir /home/rstudio/work\
       -e DISPLAY=:0\
       -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0\
       -v $HOME/.Xauthority:/home/rstudio/.Xauthority\
       -it 611\
       emacs /home/rstudio/work
fi

if [ "$MODE" == "jupyterlab" ];
then
    export R_PASS=$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo)
    docker run \
           -p 8765:8765 \
           -p 8766:8766 \
           -v `pwd`:/home/rstudio/project \
           -e PASSWORD=$R_PASS \
           -it 611 sudo -H -u rstudio /bin/bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8765 --no-browser"
fi

if [ "$MODE" == "shell" ];
then
    docker run \
           -v `pwd`:/home/rstudio/project \
           -it 611 sudo -H -u rstudio /bin/bash 
fi


