#!/bin/sh

. "`dirname $0`/container-settings.sh"

# This will create a named container for use as a persistent storage of the DNS data
docker create -v /var/cache/bind --name "${SERVICEREGISTRY_DATA_CONTAINER_NAME}" "${SERVICEREGISTRY_CONTAINER_TAG}" /bin/true
