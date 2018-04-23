FROM debian
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim less
RUN (echo "alias 'l=ls -l'" && echo "shopt -s autocd") >> /etc/bash.bashrc
ENV PGUSER=postgres
COPY recovery.conf /


