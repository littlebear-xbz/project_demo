#!/bin/sh

#get daemon_tomcat status
function status {
    path_status=`pwd`/daemon.sh
	ps -ef | grep $path_status | grep -v 'grep'
    src_status=$?
	echo $src_status
    if [ $src_status -eq 0 ]
    then
        echo 'daemon is running'
        return 1
    else
        echo "daemon stopped"
        return 2
    fi
}

#start daemon_tomcat
function start {
    path_ps=`pwd`/daemon.sh
    status
    a=$?
    if [ $a -eq 1 ]
    then
        echo 'daemon is running'    
    else
        rm -rf nohup.out
        nohup sh $path_ps &
        status
    fi
}

#stop daemon_tomcat jptomcat
function stop {
	path_ps=`pwd`
	echo $path_ps
    status
    if [ $? -eq 2 ]
    then
		src_pid=`ps aux | grep ${path_ps}/../src | grep -v 'grep' | awk '{print $2}'`
        kill -9 $src_pid
    else
        daemon_pid=`ps aux | grep ${path_ps}/daemon.sh | grep -v 'grep' | awk '{print $2}'`
        kill -9 $daemon_pid
        echo "daemon status <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        status
        src_pid=`ps aux | grep ${path_ps}/../src | grep -v 'grep' | awk '{print $2}'`
        kill -9 $src_pid
    fi
}

# check arguments
COMMAND=$1
case $COMMAND in
    "status")
        status
        ;;
    "start")
        start
        ;;
    "stop")
        stop
        ;;
esac

