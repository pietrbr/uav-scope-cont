#!/bin/bash

# If option 'cp' is passed, the modified files of scope are copied from this folder into the scope folders: scope_api and scope_code
if [[ $# -eq 0 ]];
    then printf 'Remember: if you first want to copy the edited scope files run again the command with the option 'compile':\n\tbash ./setup-compileScope.sh cp\n'
elif [[ $# -eq 1 && $1 == 'cp' ]];
    then echo 'Copying modified scope file'
    cp ./scheduler_metric.cc /root/radio_code/srsLTE/srsenb/src/stack/mac/
elif [[ $# -eq 1 && $1 != 'cp' ]];
    then echo 'No option like that... you wanted to write cp?'
fi

## Compile scope
#echo "Start to compile"
#cd ~/radio_code/srsLTE/build
#
#cmake ..
#
#make -j 2
#
#make install
#
#ldconfig
# 
