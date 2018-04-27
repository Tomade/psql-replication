# Introduction to PostgreSQL replication

This tutorial will guide you through a progressive series of steps, illustrating how to go from a stock single-server
 installation of PostgreSQL 9.6.8 to a fully real-time replicated two-server setup, with sub-second propagation times. 
In the process, we will also show how to enable Point-In-Time-Recovery (PITR) restore capabilities, which allow us to
 go back in time at an arbitrary point.
  
 
## Prerequisites
-  You will need a current version of [Docker](https://store.docker.com/search?type=edition&offering=community) 
 installed on your workstation, inclusive of `docker-compose`. Download it, install it and get it running. The 
 `docker-compose` utility is typically bundled with the base distribution, Mac users can also install it with
 Homebrew.

- Clone this repository into a new directory to immediately have access to the various PostgreSQL 
configuration files, and the various Docker files used to generate and run the container images used in this 
tutorial.
    
- Keep this window open and navigate the tutorial following the links in it, while keeping a terminal window open 
with an administrative shell ready for commands, after changing directory to where you cloned the repository.

Next: [Run single PostgreSQL with stock configuration](docs/01.md)
    





