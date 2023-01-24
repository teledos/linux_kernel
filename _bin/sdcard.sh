#!/usr/bin/env bash

BASEPATH=$(dirname "$0")
SD_CARD_PATH=$(readlink -f "$BASEPATH/../../sdcard")
BOOT_PARTITION=$SD_CARD_PATH/boot
ROOT_PARTITION=$SD_CARD_PATH/root

rm -rf "$SD_CARD_PATH"
mkdir -p "$SD_CARD_PATH/boot"
mkdir -p "$SD_CARD_PATH/boot/dts"
mkdir -p "$SD_CARD_PATH/root"

cp arch/arm/boot/zImage "$BOOT_PARTITION"
cp arch/arm/boot/dts/*.dtb "$BOOT_PARTITION/dts"
cp .config "$BOOT_PARTITION/config"
cp System.map "$BOOT_PARTITION/System.map"
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make firmware_install modules_install INSTALL_MOD_PATH=$ROOT_PARTITION
find "$ROOT_PARTITION/lib/modules/" -type l -name "source" -exec rm "{}" \;
find "$ROOT_PARTITION/lib/modules/" -type l -name "build" -exec rm "{}" \;

cd "$SD_CARD_PATH"
tar -cvzf ./teledos-udo-neo-kernel.tgz ./boot ./root
