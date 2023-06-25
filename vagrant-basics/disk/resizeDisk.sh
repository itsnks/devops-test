#!/bin/bash

ROOT_DISK_DEVICE="/dev/sda"
ROOT_DISK_DEVICE_PART="dev/sda1"
LV_PATH=`sudo lvdisplay -c  | sed -n 1p | awk -F ":" '{print $1;}'`
FS_PATH=`df | sed -n 2p | awk '{print $1;}'`
ROOT_FS_SIZE=`wr`
echo "The root file system (/) has a size of $ROOT_FS_SIZE"
ECHO "> iNCREASING DISK SIZE OF $ROOT_DISK_DEVICE to available maximum"
sudo fdisk $ROOT_DISK_DEVICE <<EOF
d
n
p



no
w
EOF
sudo pvresize $ROOT_DISK_DEVICE_PART
sudo lvextend -l +100%FREE $LV_PATH
sudo xfs_growfs $FS_PATH    #for red hat based systems
#sudo resize2fs -p $FS_PATH #use this if using debian based system