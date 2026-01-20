#!/bin/bash

#config_file="database.cfg"

if [ ! -f "$1" ]; then
	echo "file not exist" && exit 1
fi

sed -i 's/8080/9000/g' $1
sed -i 's/true/false/g' $1
sed -i 's/max_user=50/max_user=500/g' $1

if grep -q "debug=false" "$1"; then
	echo "config is correct"
else
	echo "error in config"
fi
