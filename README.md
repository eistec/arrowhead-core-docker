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

 - Docker, tested on Docker v1.10 (https://docs.docker.com/engine/installation/linux/ubuntulinux/)

## Settings

See the file `container-settings.sh` for some Docker settings.

Examine the included configuration files for fine-grained tuning.

## Building for ARM on x86

Configure binfmt-misc to run `/usr/bin/qemu-arm-cortex-a8` as the interpreter for arm binaries:

(tested on Gentoo w/ systemd)

/etc/binfmt.d/qemu-binfmt.conf:

    :arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\x00\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-cortex-a8:P

run

    systemctl restart systemd-binfmt.service

to apply the setting


Alternative temporary configuration directly in the terminal (untested):

    echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\x00\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-cortex-a8:P' > /proc/sys/fs/binfmt_misc/register
