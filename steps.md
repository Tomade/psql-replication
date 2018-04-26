
A. OBJECTIVES:

 1. Enable PITR (point in time recovery) and demonstrate restore on a single server
 2. Set up asynchronous warm stand-by, demonstrate failover with promotion
 3. Set up asynchronous hot stand-by, demonstrate R/O access with promotion


B. STEPS
1. PITR setup
    1. deploy instance with default config, connect & disconnect, bring it down
                
            docker-compose up --build -d
            docker-compose exec primary psql
            ^D
            docker-compose down -v            
            
    2. set up WAL archiving, creating separate volume, modifying config and restarting
    3. run a base backup (with "recovery.conf" option)
    4. load test database: observe WAL log files being archived
    5. make note of the current time
    6. delete some rows in the middle of the foo table
    7. stop server
    8. manually restore the base backup, check recovery.conf
    9. modify recovery.conf to execute a PITR recovery
    10. restart server, observe recovery, check rows
    11. notice that recovery.conf gets renamed
     
2. Warm stand-by setup
    - create new volume for a standby and restore the base backup from the primary
    - check recovery.conf, include connection info
    - deploy new instance 
    - observe sync
    - insert new rows, observe quick replication
    - notice that recovery.conf remains in place

3. Hot stand-by setup
    - edit postgresql.conf to change operating mode to hot-standby
    - bounce server
    - follow log, notice server going to read-only mode
