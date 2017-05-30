#!/bin/bash

if [[ $# -ne 1 ]] ; then
    echo "Usage: $0"
    exit 2;
fi

source ./functions.sh

for i in $(seq 1 $1) ; do
    id=$(($RANDOM % 100))
    long=$(generate_samples 1 5999 12)
    lat=$(generate_samples 1 5999 12)

    mosquitto_pub -h host -t beehive/location -m "{\"id\":$id, \"longitude\":$long, \"latitude\":$lat}" -p port -u username -P password

    sleep 1
done
