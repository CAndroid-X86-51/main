#!/bin/echo source this file

. build/envsetup.sh
lunch android_x86-eng
cd kernel; git checkout 1ba3566; cd ..
m -j6 iso_img TARGET_KERNEL_ARCH=x86_64 2>&1 | tee LOG-U32K64-KERNEL44-`date +%F-%T`
