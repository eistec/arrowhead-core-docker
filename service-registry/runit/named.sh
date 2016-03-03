#!/bin/sh
# Start BIND name server as root, drop privileges and change to bind user, without forking
/usr/sbin/named -g -c /etc/bind/named.conf -u named
