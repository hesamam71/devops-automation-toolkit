#!/bin/bash
Log_file="$1"
if [ -z "$Log_file" ]; then
	echo "Usage: ./analyze_logs.sh access.log"
	exit 1
fi
if [ ! -f "$Log_file" ]; then
	echo "File not found"
	exit 1
fi
echo " scanning $Log_file for suspicious acrtivity..."
echo " ----------------------------------------------"
echo " count | IP Address "
echo " ----------------------------------------------"
cat "$Log_file" | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5
echo " ----------------Failed Requests---------------"
cat "$Log_file" | awk '$7 != "200" { print $1, $7 }' | sort | uniq -c | sort -nr
