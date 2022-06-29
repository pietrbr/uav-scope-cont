#!/bin/bash
echo "Run ue.config"
comm_ex="1"
while (($comm_ex!= "0"))
do
        ip=$(ifconfig tun_srsue | grep 'inet addr:' | cut -d':' -f2 | cut -d' ' -f1)
	echo $ip
        #ip route add 10.241.115.0/24 via $ip
        ip route add 10.244.105.0/24 via $ip
	comm_ex=$(echo $?)
	echo $comm_ex
done

