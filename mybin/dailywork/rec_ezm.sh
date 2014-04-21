#!/bin/bash

mon=`date +%m`
day=`date +%d`
year=`date +%Y`

output_directory=$HOME/Music
output_directory=${output_directory}/ezmorning/${year}

if [ ! -d ${output_directory} ];then
	mkdir -p ${output_directory}
fi

cvlc "mms://enmms.chinabroadcast.cn/fm91.5.wsx" --sout="${output_directory}/ezm_${mon}${day}${sect}.wma" --run-time=10900 vlc://quit --quiet
