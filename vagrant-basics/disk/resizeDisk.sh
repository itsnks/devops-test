#!/bin/bash

ROOT_DISK_DEVICE="/dev/sda"
ROOT_DISK_DEVICE_PART="/dev/sda2"
LV_PATH=`sudo lvdisplay -c  | sed -n 1p | awk -F ":" '{print $1;}'`
FS_PATH=`df / | sed -n 2p | awk '{print $1;}'`
echo "The root file system (/) has a size of $ROOT_FS_SIZE"
ECHO "> iNCREASING DISK SIZE OF $ROOT_DISK_DEVICE to available maximum"
sudo fdisk $ROOT_DISK_DEVICE <<EOF
d
2
n
p
2


no
t
2
8e
w
EOF
sudo pvresize $ROOT_DISK_DEVICE_PART
sudo lvextend -l +100%FREE $LV_PATH
/usr/sbin/partprobe
/usr/sbin/xfs_growfs -d $FS_PATH
#sudo xfs_growfs $FS_PATH    #for red hat based systems
#sudo resize2fs -p $FS_PATH #use this if using debian based system