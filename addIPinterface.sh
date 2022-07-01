#!/bin/bash
echo "Looking for IP address of the BS host, rerouting packets through the bridge network for the way back"
comm_ex="1"
while (($comm_ex!= "0"))
do

    ip=$(ifconfig tun_srsue | grep 'inet addr:' | cut -d':' -f2 | cut -d' ' -f1)
	echo $ip

	# IP RULES
	# 1 - reroute traffic going to gnb container LTE network
	#     through $IP

	# Matteo
    #ip route add 10.241.115.0/24 via $ip
	# Pietro
    ip route add 10.244.105.0/24 via $ip

	comm_ex=$(echo $?)
	echo $comm_ex
done

