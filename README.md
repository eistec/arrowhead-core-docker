# Arrowhead Core services
This repository contains Dockerfiles and scripts to run the Arrowhead core services inside Docker containers.

## Quick start guide

    git clone https://github.com/eistec/arrowhead-core-docker.git
    cd arrowhead-core-docker

### Service registry

    cd service-registry
    # Create a data volume to keep the service registry state between restarts
    ./create-volumes.sh
    # Start the services
    ./run-server.sh

## Prerequisites

 - Docker (Ubuntu: `sudo apt-get install docker.io`), tested on Docker v1.10

## Settings

See the file `container-settings.sh` for some Docker settings.

Examine the included configuration files for fine-grained tuning.
