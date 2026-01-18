#!/bin/bash

echo "---Start checking---"
echo "===================="
if [ $(id -u) -ne 0 ]; then
	echo "Run as root"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "file $1 not found"
	exit 1
fi

while read  site; do
	ping -c 1 $site > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "Site $site is up"
		else
			echo "Site $site is offline"
		fi
done < "$1"
