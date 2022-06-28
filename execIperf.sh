#!/bin/sh
cd ~/radio_code/srslte_config
sleep 15
ip=$(< ip.log grep 'The ip is: ' | cut -d':' -f2 | cut -d' ' -f2)
echo $ip
iperf3 -c $ip -u -b 0.5M
