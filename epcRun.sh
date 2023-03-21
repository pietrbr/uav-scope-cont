#!/bin/bash

# Assign IP addresses to variables
echo "Set IP variables in bash"
bash addIPvars.sh

echo "add DNAT"
# IP RULES
# This DNAT configuration command should be always the same: it
# reroutes traffic directed to ue host through the ue container
iptables -t nat -A PREROUTING -d $IP_C1 -j DNAT --to-destination $IP_B2

echo "Run enb.config"
cd ~/radio_code/srslte_config

sudo srsepc epc.conf
