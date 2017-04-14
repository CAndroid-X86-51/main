#!/bin/bash 
### Refer to http://www.android-x86.org/documents/customizekernel
. build/envsetup.sh
lunch android_x86-eng  
cp ./my_defconfig ./my_defconfig.old
cp ./my_defconfig $OUT/obj/kernel/.config
make -C kernel O=$OUT/obj/kernel ARCH=x86_64 menuconfig 
cp $OUT/obj/kernel/.config ./my_defconfig

if [[ $1 = "clean" ]]
then
 echo I am going to clean kernel objs for you since you give parameter $1
 make -C kernel distclean
 rm -rf $OUT/obj/kernel
fi
