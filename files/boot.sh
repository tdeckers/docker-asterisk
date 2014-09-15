#!/bin/bash

######################
# Decide how to launch

ETH0_FOUND=`grep "eth0" /proc/net/dev`

function launch {
  service asterisk restart
  # Wait for asterisk to boot.
  sleep 5
  #exec tail -f /var/log/asterisk/messages
  exec asterisk -rvvv
}

if [ -n "$ETH0_FOUND" ] ;
then 
  # We're in a container with regular eth0 (default)
  launch
else 
  # We're in a container without initial network.  Wait for it...
  /usr/local/bin/pipework --wait
  launch
fi
