#!/bin/bash  
echo "add DNAT"

# IP RULES
# This DNAT configuration command should be always the same: it
# reroutes traffic directed to ue host through the ue container
iptables -t nat -A PREROUTING -d 240.84.80.1 -j DNAT --to-destination 172.16.0.8

echo "Run enb.config"
cd ~/radio_code/srslte_config

sudo srsepc epc.conf
