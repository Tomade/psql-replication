#!/usr/bin/env bash

echo "create database foo;" | psql

\connect foo

c