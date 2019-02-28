#!/bin/sh

rm -rf nohup.out
path_ps=`pwd`
while true
do
    ps -ef | grep $path_ps/../src/ | grep -v 'grep'
    src_status=$?
    if [ $src_status -eq 1 ]
    then
        nohup python $path_ps/../src/main.py >/dev/null 2>&1 &
        echo 'program is restart'
    else
        echo 'program is runing' 
    fi
    sleep 2
done
