FROM ubuntu:20.04
COPY setup14.x /
RUN apt update && apt install -y gpg-agent sudo
RUN cat /setup14.x | sudo -E bash -
RUN apt install -y nodejs
RUN npm install -y -g @marp-team/marp-cli
RUN apt update && apt install -y python3-pip
WORKDIR /host
RUN pip3 install hovercraft
