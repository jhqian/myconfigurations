#!/bin/bash

mon=`date +%m`
day=`date +%d`
year=`date +%Y`

output_directory=$HOME/Music
output_directory=${output_directory}/ezmorning/${year}

if [ ! -d ${year} ];then
	mkdir -p ${output_directory}
fi

#echo cvlc "mms://enmms.chinabroadcast.cn/fm91.5.wsx" --sout="${output_directory}/ezm_${mon}${day}${sect}.wma" --runtime-time 10860 vlc://quit --quiet
cvlc "mms://enmms.chinabroadcast.cn/fm91.5.wsx" --sout="${output_directory}/ezm_${mon}${day}${sect}.wma" --run-time=11100 vlc://quit --quiet
#mimms -t 180  mms://enmms.chinabroadcast.cn/fm91.5 ${output_directory}/ezm_${mon}${day}${sect}.wma &
#mimms -t 60  mms://enmms.chinabroadcast.cn/fm91.5 ${output_directory}/ezm_${mon}${day}${sect}_a.wma
#mimms -t 60  mms://enmms.chinabroadcast.cn/fm91.5 ${output_directory}/ezm_${mon}${day}${sect}_b.wma
#mimms -t 60  mms://enmms.chinabroadcast.cn/fm91.5 ${output_directory}/ezm_${mon}${day}${sect}_c.wma
