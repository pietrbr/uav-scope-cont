#!/bin/bash
echo "add DNAT"
iptables -t nat -A PREROUTING -d 172.16.0.8 -j DNAT --to-destination 240.84.80.1
echo "Run server Iperf"
#tmux split-window "iperf3 -s"
echo "Add IP route to Gnb"
tmux split-window "bash addIPinterface.sh"
echo "Run ue.config" 
cd ~/radio_code/srslte_config
sudo srsue ue.conf
