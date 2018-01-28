#!/bin/bash

set -e

varnishd -f /etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:6082
# HACK: wait for varnish
sleep 5
varnishlog
