#!/bin/bash

# Assign IP addresses to variables
echo "Set IP variables in bash"
bash addIPvars.sh

echo "add DNAT and SNAT"

# IP RULES
# 1) This DNAT configuration command reroutes traffic directed to 
# the ue container to the ue host
# 2) This SNAT configuratio command change pckt source, all the pckts going 
# to the BS host changes their source to the container host. This allows the ping of 
# the BS host from the UE host. 

iptables -t nat -F
iptables -t nat -A PREROUTING -d $IP_B2 -j DNAT --to-destination $IP_C1
iptables -t nat -A POSTROUTING -d $IP_A1 -j SNAT --to-source $IP_B2

# echo "Run server Iperf"
# tmux split-window "iperf3 -s"
echo "Add IP route to Gnb"
tmux split-window "bash addIPinterface.sh"
echo "Run ue.config" 
cd ~/radio_code/srslte_config
sudo srsue ue.conf

