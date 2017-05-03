#!/bin/bash
/sbin/ip route|awk '/default/ { print $3 " docker1" }' >> /etc/hosts
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
