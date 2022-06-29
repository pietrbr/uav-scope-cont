#!/bin/bash
echo "add DNAT"
iptables -t nat -A PREROUTING -d 240.84.80.1 -j DNAT --to-destination 172.16.0.8
echo "run EPC script"
bash epcRun.sh &
sleep 4
echo "run ENB script"
tmux set-option remain-on-exit on
tmux split-window "bash enbRun.sh"

