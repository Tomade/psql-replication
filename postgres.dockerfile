FROM postgres:9
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim less
RUN (echo "alias 'l=ls -l'" && echo "shopt -s autocd") >> /etc/bash.bashrc
ENV PGUSER=postgres
USER postgres
COPY postgresql.conf /var/lib/postgresql/data
COPY pg_hba.conf /var/lib/postgresql/data