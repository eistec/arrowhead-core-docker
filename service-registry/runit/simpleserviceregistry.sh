#!/bin/sh
# Start SimpleServiceRegistry
cd /opt/simpleserviceregistry/
chpst -u restuser java -jar SimpleServiceDiscovery_20160218.jar
