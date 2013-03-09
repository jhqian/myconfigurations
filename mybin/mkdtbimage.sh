#!/bin/sh
board=$1 
combinedt=$2
if [ -z $board ]; then
	echo no board use sabresd as default
	board=sabresd
else 
	echo make image for $board board
fi

if [ -z $combinedt ]; then
	echo make uImage -j4 LOADADDR=0x10008000
	make uImage -j4 LOADADDR=0x10008000
else
	echo make zImage -j4
	make zImage -j4
fi

if [ ! $? -eq 0 ];then
	echo !!!!!!!!!!!!!!!!! make zImage failed
	exit 1
fi

make imx6q-$board.dtb
if [ ! $? -eq 0 ];then
	echo !!!!!!!!!!!!!!!!! make imx6q-${board}.dtb failed
	exit 1
fi

if [ -e arch/arm/boot/zImage ] && [ -e arch/arm/boot/imx6q-$board.dtb ]; then
	cat arch/arm/boot/zImage arch/arm/boot/imx6q-$board.dtb > arch/arm/boot/zImage_dtb
else
	echo !!!!!!!!!!!!!!!!! no zImage or dtb file
	exit 1
fi

if [ ! -z $combinedt ]; then
	if [ -e ../linux-2.6-imx/scripts/mkuboot.sh ]; then
		../linux-2.6-imx/scripts/mkuboot.sh -A arm -O linux -T kernel -C none -a 0x10008000 -e 0x10008000 -n 'dbg' -d arch/arm/boot/zImage_dtb arch/arm/boot/uImage
	else
		echo !!!!!!!!!!!!!!!!! no mkuboot.sh
		exit 1
	fi
else
	echo will not combine dtbfile
fi
