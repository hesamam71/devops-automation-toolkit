#!/bin/bash

if [ $(id -u) -ne 0 ]; then
        echo "Run as admin" && exit 1
fi
ram=$(free -m | awk '/Mem:/ {print $7}')
if [ $ram -lt 5000 ]; then
        echo "Critical, ram is low"
        echo "you have $ram meg space"
else
        echo "Ram is healthy"
        echo "you have $ram meg space"
fi
a=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')
if [ $a -ge 80 ]; then
        echo "Critical"
else
        echo "Disk is healthy"
fi
echo "current disk usage is $a%"
