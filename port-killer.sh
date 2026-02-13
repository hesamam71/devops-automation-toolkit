#!/bin/bash
read -p "enter your port " TARGET_PORT

if [ -z $TARGET_PORT ];then
	echo "enter port number !"
	exit 1
fi

echo "hunting for process on port $TARGET_PORT"
PID=$(lsof -i:$TARGET_PORT| grep "LISTEN" | awk '{print $2}')

if [ -z $PID ];then
	echo "there is no $PID pid"
else
	echo "found pid"
	echo "it is killed..."
	kill -9 $PID
	echo "terminated"
fi
