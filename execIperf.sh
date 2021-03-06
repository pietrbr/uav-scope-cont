#!/bin/bash
cd ~/radio_code/srslte_config
sleep 15

# This script first reads the IP address of the UE container from
# the ip.log file, then starts iperf towards that ip address.
ip=$(< ip.log grep 'The ip is: ' | cut -d':' -f2 | cut -d' ' -f2)
echo $ip
iperf3 -c $ip -u -b 0.5M
