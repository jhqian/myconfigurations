#!/bin/bash

mon=`date +%m`
day=`date +%d`
year=`date +%Y`

section=b
tmp_dir=/tmp/ezmorning/${year}
output_directory=$HOME/Music
output_directory=${output_directory}/ezmorning/${year}

fname=ezm_${mon}${day}${section}.wma
tmp_file=${tmp_dir}/${fname}
out_file=${output_directory}/${fname}

if [ ! -d ${year} ];then
	mkdir -p ${output_directory}
fi

if [ ! -d ${tmp_dir} ];then
	mkdir -p ${tmp_dir}
fi

cvlc "mms://enmms.chinabroadcast.cn/fm91.5.wsx" --sout="${tmp_file}" --run-time=3000 vlc://quit --quiet

if [ -f "${tmp_file}" ];then
    mv "${tmp_file}" "${out_file}"
fi
