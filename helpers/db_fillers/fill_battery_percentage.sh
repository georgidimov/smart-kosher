#!/bin/bash

if [[ $# -ne 1 ]] ; then
    echo "Usage: $0"
    exit 2;
fi

for i in $(seq 1 $1) ; do
    id=$(($RANDOM % 100))
    battery=$(($RANDOM % 99));
    mosquitto_pub -h host -t beehive/battery_percentage -m "{\"id\":$id, \"battery_percentage\":$battery}" -p port -u username -P password

    sleep 1
done
