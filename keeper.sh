#!/bin/bash

while true; do
	echo "Service is alive at $(date)" >> /tmp/alive.log && sleep 5
done
