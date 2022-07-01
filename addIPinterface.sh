#!/bin/bash
echo "Looking for IP address of the BS host, rerouting packets through the bridge network for the way back"
comm_ex="1"
while (($comm_ex!= "0"))
do

    ip=$(ifconfig tun_srsue | grep 'inet addr:' | cut -d':' -f2 | cut -d' ' -f1)
	echo $ip

	# IP RULE
	# The IP to add is the one of the network between bng host e bng container

	# Matteo
    #ip route add 10.241.115.0/24 via $ip
	# Pietro
    ip route add 10.244.105.0/24 via $ip

	comm_ex=$(echo $?)
	echo $comm_ex
done

