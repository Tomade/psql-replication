FROM postgres:9.6
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim less
RUN (echo "alias 'l=ls -l'" && echo "shopt -s autocd") >> /etc/bash.bashrc

ENV PGUSER=postgres

COPY postgresql-default.conf /etc/postgresql/postgresql.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]