#!/bin/echo source me

if [ ! -e "external/lxc" ]
then
 cd external
 git clone https://github.com/tcwu2005/platform_external_lxc -b Android-x86-5.1 lxc
 cd ..
fi

cd external/lxc
mm clean-liblxc
mm
cd ../..
