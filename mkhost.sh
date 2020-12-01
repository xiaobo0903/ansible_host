#!/bin/bash

#判读本地是否有host.temp文件
if [ -f "./host.temp" ]; then
    cp -rf ./host.temp ./host
else
    echo -e "\n\n*************************************************\n\n没有发现host模版文件，请确认本目录下是否有host.temp文件！！\n\n*************************************************\n\n"
    exit
fi
if [ -f "$1" ]; then
    echo ""
else
    echo -e "\n\n*************************************************\n\nusage: bash mkhost.sh <setfile>\n\n*************************************************\n\n"
    exit
fi
cat $1|while read line
do
#如果开头为#则忽略
    l1=`echo $line |tr -d " "`
    if [[ $l1 =~ '#*' || $l1 == '' ]]; then
        continue       
    fi
    OLD_IFS="$IFS"
    IFS="="
    arr=($l1)
    IFS="$OLD_IFS"
    echo ${arr[0]}
    echo ${arr[1]}
    cmd=`sed -i "s/\\$${arr[0]}/${arr[1]}/g" ./host`
done
echo -e "\n\n*************************************************\n\n处理完成，请查看生成的 host 文件\n\n*************************************************\n\n"
