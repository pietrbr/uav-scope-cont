#!/bin/bash
echo "Looking for IP address of the BS host, rerouting packets through the bridge network for the way back"
comm_ex="1"
while (($comm_ex!= "0"))
do

    ip=$(ifconfig tun_srsue | grep 'inet addr:' | cut -d':' -f2 | cut -d' ' -f1)
	echo $ip

	# IP RULES
	# 1) reroute traffic going to gnb container LTE network
	# through $IP
	ip route add $IP_A0 via $ip
    
	comm_ex=$(echo $?)
	echo $comm_ex
done

