#!/usr/bin/env bash

rm -rf /boot/*
rm -rf /lib/modules/*
rm -rf "/lib/firmware/`uname -r`/"

mv /tmp/boot/* /boot/
mv /tmp/root/lib/modules/* /lib/modules/
mv /tmp/root/lib/firmware/* /lib/firmware/

echo "kernel is installed, please reboot!"

