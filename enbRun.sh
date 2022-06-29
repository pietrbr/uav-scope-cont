#!/bin/bash
echo "Run enb.config"
tmux set-option remain-on-exit on
tmux split-window "bash execIperf.sh"
cd ~/radio_code/srslte_config
sudo srsenb enb.conf | tee ip.log
