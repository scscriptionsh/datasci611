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

if [ "$MODE" == "sshd" ];
then
export R_PASS=$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo)
docker run --rm \
 -p 8722:22 \
 -e PASSWORD=$R_PASS\
 -v $(echo $HOME/.ssh):/home/rstudio/.ssh\
 -v $(pwd):/home/rstudio/bios611\
 -d\
 -t 611\
 /usr/sbin/sshd -D > /tmp/docker-output

export DOUT=$(cat /tmp/docker-output)

echo $DOUT

export CID=$(echo $DOUT | tail -1)

box_out 'ssh into the machine on port 8722'\
        'Username: rstudio'\
        "Password: $R_PASS"\
        'to kill the docker container'\
        "run \"docker kill $CID\""

fi





 
