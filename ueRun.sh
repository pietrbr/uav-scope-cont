#!/bin/bash
echo "add DNAT"

# IP RULES
# 1) This DNAT configuration command reroutes traffic directed to 
# the ue container to the ue host
# 2) This SNAT configuratio command change pckt source, all the pckts going 
# to the BS host changes their source to the container host. This allows the ping of 
# the BS host from the UE host. 
#Pietro
#iptables -t nat -A PREROUTING -d 172.16.0.8 -j DNAT --to-destination 10.76.105.1
#iptables -t nat -A POSTROUTING -d 10.241.115.1 -j SNAT --to-source 172.16.0.8

#Matteo
iptables -t nat -F
iptables -t nat -A PREROUTING -d 172.16.0.8 -j DNAT --to-destination 10.228.150.1
iptables -t nat -A POSTROUTING -d 10.241.115.1 -j SNAT --to-source 172.16.0.8

#echo "Run server Iperf"
#tmux split-window "iperf3 -s"
echo "Add IP route to Gnb"
tmux split-window "bash addIPinterface.sh"
echo "Run ue.config" 
cd ~/radio_code/srslte_config
sudo srsue ue.conf

