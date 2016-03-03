#!/bin/sh

MACHINE_TYPE=`uname -m`
if [ x${MACHINE_TYPE} == 'xarmv7l' ]; then
  # for ARM machines, use a different tag
  export SERVICEREGISTRY_CONTAINER_TAG=eistec/arrowhead-serviceregistry:armv7l
else
  # default to x86
  export SERVICEREGISTRY_CONTAINER_TAG=eistec/arrowhead-serviceregistry:latest
fi

export SERVICEREGISTRY_DATA_CONTAINER_NAME=arrowhead-serviceregistry-store
