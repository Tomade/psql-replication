A. OBJECTIVES:

 1. Enable PITR (point in time recovery) and demonstrate restore on a single server
 2. Set up asynchronous warm stand-by, demonstrate failover with promotion
 3. Set up asynchronous hot stand-by, demonstrate R/O access with promotion

B. STEPS
1. PITR setup
    - deploy instance with default config
    - set up WAL archiving, creating separate volume, modifying config and restarting
    - run a base backup (with "recovery.conf" option)
    - load test database: observe WAL log files being archived
    - make note of the current time
    - delete some rows in the middle of the foo table
    - stop server
    - manually restore the base backup, check recovery.conf
    - modify recovery.conf to execute a PITR recovery
    - restart server, observe recovery, check rows
    - notice that recovery.conf gets renamed
     
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
