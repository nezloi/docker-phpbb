#!/bin/sh
sysctl net.ipv6.conf.all.disable_ipv6=1
sysctl net.ipv6.conf.default.disable_ipv6=1
sysctl net.ipv6.conf.lo.disable_ipv6=1
exit 0
