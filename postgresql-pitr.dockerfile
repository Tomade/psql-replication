FROM postgres:9.6
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim less
RUN (echo "alias 'l=ls -l'" && echo "shopt -s autocd") >> /etc/bash.bashrc
ENV PGUSER=postgres
COPY postgresql-archiving.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/pg_hba.conf
RUN mkdir /archive && chown postgres /archive
RUN mkdir /backup && chown postgres /backup
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "hba_file=/etc/postgresql/pg_hba.conf"]