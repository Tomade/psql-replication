#!/bin/bash

psql -v --username "$POSTGRES_USER" <<-EOSQL
    CREATE database stuff;
    \connect stuff
    CREATE table foo (id SERIAL PRIMARY KEY, dtm_created TIMESTAMP);
EOSQL