#!/bin/bash  
echo "Start to compile"
cd radio_code/srsLTE/build

cmake ..

make -j 2

make install

ldconfig
 
