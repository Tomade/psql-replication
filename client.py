from time import sleep

import psycopg2 as pg

sleep(10)
db = pg.connect(host='primary', user='postgres', database='stuff')
db.autocommit = True
c = db.cursor()

# try:
#     db = pg.connect(host='primary', user='postgres', database='stuff')
#     db.autocommit = True
#     c = db.cursor()
# except:
#     db = pg.connect(host='primary', user='postgres')
#     db.autocommit = True
#     c = db.cursor()
#     c.execute("create database stuff")
#
#     db = pg.connect(host='primary', user='postgres', database='stuff')
#     db.autocommit = True
#     c = db.cursor()
#     c.execute("create table foo (id serial primary key, dtm_created timestamp)")

for _ in range(2000000):
    c.execute('insert into foo (dtm_created) values (current_timestamp )')
    sleep(0.1)
