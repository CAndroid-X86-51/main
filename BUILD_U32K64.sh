#!/bin/bash -x
FILE_MYDEFCONFIG=./my_defconfig
. build/envsetup.sh
lunch android_x86-eng
cd kernel ; git checkout x86/kernel-4.0 ; cd ..
if [ ! -f "$FILE_MYDEFCONFIG" ] 
then 
 echo CUSTOMIZE KERNEL CONFIG NOT EXISTING, BUILD ISOIMAGE BY DEFAULT
 make -j4 iso_img TARGET_KERNEL_ARCH=x86_64 | tee LOG-U32K64-`date +%F-%T`
else
 echo FOUND $FILE_MYDEFCONFIG , BUILD CUSTOMIZED KERNEL ISOIMAGE
 make -j4 iso_img TARGET_KERNEL_ARCH=x86_64 TARGET_KERNEL_CONFIG=./my_defconfig | tee LOG-U32K64-CUSTOMIZED-`date +%F-%T`
fi

