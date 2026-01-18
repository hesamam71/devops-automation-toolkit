#!/bin/bash
echo "----welcome to toolkit----"
echo "1. Disk checking...."
echo "2. Network checking...."
function disk_check(){
read -p "enter your exact location that you want to know about size: " location
if [ -z "$location" ]; then
	echo "you enter nothing, so I tell you about root directory "
	df -h / | tail -1
else
	df -h "$location" | tail -1
fi
}

function net_check(){
read -p "enter your server list file: " server
if [ ! -f "$server" ]; then
	echo "File $server doesn't exist"
	exit 1
fi
while read list; do
	ping -c 1 $list > /dev/null 2>&1
	if [ $? -eq 0 ]; then echo "site $list is up"; else echo "$list is DOWN"; fi
done < "$server"
}

read -p "Enter your choice: " choice
case $choice in
	1)
		disk_check
		;;
	2)
		net_check
		;;
	*)
		echo "Invalid input"
		exit 1
		;;
esac

