#!/bin/bash

mon=`date +%m`
day=`date +%d`
year=`date +%Y`

output_directory=$HOME/Music
output_directory=${output_directory}/feelgoodinc/${year}

if [ ! -d ${year} ];then
	mkdir -p ${output_directory}
fi

cvlc "mms://enmms.chinabroadcast.cn/fm91.5.wsx" --sout="${output_directory}/fgi_${mon}${day}${sect}.wma" --run-time=3700 vlc://quit --quiet
