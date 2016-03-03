#
# Arrowhead service registry Dockerfile
#
FROM phusion/baseimage:0.9.18

MAINTAINER Joakim Nohlgård <joakim.nohlgard@eistec.se>

ENV DEBIAN_FRONTEND noninteractive

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y \
    bind9 \
    default-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# DNS server
# Copy default settings
COPY bind9/etc/bind /etc/bind/
# Seed the zone file with some default DNS-SD entries
RUN mkdir -p /var/cache/bind /var/run/named && chown bind:bind /var/cache/bind /var/run/named
COPY bind9/db.arrowhead.seed /var/cache/bind/db.arrowhead.localtest
# Allow the bind user to update the arrowhead zone
RUN chown bind:bind /var/cache/bind/db.arrowhead.localtest
# Install startup script
RUN mkdir -p /etc/service/bind9
COPY runit/named.sh /etc/service/bind9/run

# HTTP/CoAP frontend
RUN mkdir -p /opt/simpleserviceregistry
# install the jar and settings
COPY simpleserviceregistry/SimpleServiceRegistry20160218/ /opt/simpleserviceregistry
# will run as unprivileged restuser
RUN useradd -r -d /opt/simpleserviceregistry -s /usr/sbin/nologin -U restuser
# chown so that the restuser can create the log file and the lock file
RUN touch /opt/simpleserviceregistry/SimpleServiceRegistry.log && \
    chown restuser:restuser /opt/simpleserviceregistry/SimpleServiceRegistry.log && \
    rm -f /opt/simpleserviceregistry/SimpleServiceRegistry.lck && \
    chown restuser:restuser /opt/simpleserviceregistry/

# Install startup script
RUN mkdir -p /etc/service/simpleserviceregistry
COPY runit/simpleserviceregistry.sh /etc/service/simpleserviceregistry/run