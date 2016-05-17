#!/bin/bash


copy_conf=`cp ./data/remind/lsd.conf /etc/init/`
copy_etc=`cp ./data/remind/lsd.conf /etc/`
reboot=`reboot`

echo "$copy_conf"
echo "$copy_etc"
echo "$reboot"
echo "Server Reboted"
