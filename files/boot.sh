#!/bin/bash

######################
# Decide how to launch

ETH0_FOUND=`grep "eth0" /proc/net/dev`

if [ -n "$ETH0_FOUND" ] ;
then 
  # We're in a container with regular eth0 (default)
  service asterisk start
  exec tail -f /var/log/asterisk/messages
else 
  # We're in a container without initial network.  Wait for it...
  /usr/local/bin/pipework --wait
  service asterisk start
  exec tail -f /var/log/asterisk/messages
fi
