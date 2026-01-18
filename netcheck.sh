#!/bin/bash
echo "----Starting check networks----"
echo "==============================="
list="google.com github.com fake-site.com"
for i in $list; do
	ping -c 1 "$i" > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "$i is online"
	else
		echo "$i is offline"
	fi
done
