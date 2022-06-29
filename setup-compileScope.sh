#!/bin/bash

# If option 'cp' is passed, the modified files of scope are copied from this folder into the scope folders: scope_api and scope_code
if [[ $# -eq 0 ]];
    then printf 'Remember: if you first want to copy the edited scope files  or the tmux configuration file run again the command with the options "cp" or "tm" like:\n\tbash ./setup-compileScope.sh cp\n\x\n\tbash ./setup-compileScope.sh tm\n\n'
elif [[ $# -eq 1 && $1 == 'cp' ]];
    then print 'fCopying modified scope file\n\n'
    cp ./scheduler_metric.cc /root/radio_code/srsLTE/srsenb/src/stack/mac/
	cp ./.tmux.conf ~/
elif [[ $# -eq 1 && $1 == 'tm' ]];
    then print 'fCopying tmux configuration file\n\n'
    cp ./scheduler_metric.cc /root/radio_code/srsLTE/srsenb/src/stack/mac/
	cp ./.tmux.conf ~/
elif [[ $# -eq 1 && $1 != 'cp' ]];
    then printf 'No option like that... you wanted to write cp or tm?\n\n'
fi

# Compile scope
echo "Start to compile"
cd ~/radio_code/srsLTE/build

cmake ..

make -j 2

make install

ldconfig
 
