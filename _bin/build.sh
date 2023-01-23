#!/usr/bin/env bash
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make zImage -j4
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make dtbs -j4
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make modules -j4
