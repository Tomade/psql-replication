FROM postgres:9
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim less
RUN (echo "alias 'l=ls -l'" && echo "shopt -s autocd") >> /etc/bash.bashrc

ARG role
RUN mkdir -p /archive/primary && chown postgres /archive/primary
RUN mkdir -p /archive/standby && chown postgres /archive/standby
ENV PGUSER=postgres

COPY seed.sh /docker-entrypoint-initdb.d/
COPY postgresql-${role}.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "hba_file=/etc/postgresql/pg_hba.conf"]