#!/bin/bash
if [ $(id -u) -ne 0 ]; then
	echo "Run as root"
	exit 1
fi
if [ ! -f "$1" ]; then
	echo "File not found"
	exit 1
fi
file="$1"
while IFS=, read -r user group
do
    [ -z "$user" ] && continue
    echo "Processing: User=$user | Group=$group"
	if ! getent group "$group" > /dev/null; then
		echo " group not exist, "$group" creating ..."
		groupadd $group
	else
		echo "group "$group" exists.skip!!!!!!!!!!!!"
	fi
	if ! id $user >/dev/null 2>&1; then
		echo " user "$user" is creating ..."
		useradd -m -g "$group" -s /bin/bash "$user"
	else
		echo "user "$user" exists, skip!!!!!!!!!!!!!!!111"
	fi

done < "$file"
