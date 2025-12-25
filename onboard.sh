#!/bin/bash
# 1. ROOT CHECK
if [ $(id -u) -ne 0 ]; then
	echo "Run as root"
	exit 1
fi
# The command 'id -u' returns 0 if you are root.
# TODO: Write an if statement: If 'id -u' is NOT equal to 0, print "Run as root" and exit.
# 2. FILE CHECK
# The CSV file is passed as argument $1.
# TODO: Wr'ite an if statement: If file $1 does NOT exist, print "File not found" and exit.
if [ ! -f "$1" ]; then
	echo "File not found"
	exit 1
fi
file="$1"
# 3. THE LOOP
# This reads the CSV file line by line
while IFS=, read -r user group
do
    # Skip empty lines if any
    [ -z "$user" ] && continue
    echo "Processing: User=$user | Group=$group"
    # 4. GROUP LOGIC
    # 'getent group $group' checks if a group exists. 
    # TODO: Write an if statement: 
    # IF the group does NOT exist (command fails), THEN create it using 'groupadd $group'.
	if ! getent group "$group" > /dev/null; then
		echo " group not exist, "$group" creating ..."
		groupadd $group
	else
		echo "group "$group" exists.skip!!!!!!!!!!!!"
	fi
    # 5. USER LOGIC
    # 'id $user' checks if a user exists.
    # TODO: Write an if statement:
    # IF the user does NOT exist, THEN create them using:
	if ! id $user >/dev/null 2>&1; then
		echo " user "$user" is creating ..."
		useradd -m -g "$group" -s /bin/bash "$user"
	else
		echo "user "$user" exists, skip!!!!!!!!!!!!!!!111"
	fi

done < "$file"
