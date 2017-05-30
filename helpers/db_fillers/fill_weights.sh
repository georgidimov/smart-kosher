#!/bin/bash

if [[ $# -ne 1 ]] ; then
    echo "Usage: $0"
    exit 2;
fi

source ./functions.sh

for weight in $(generate_samples $1 599) ; do
    id=$(($RANDOM % 100))
    mosquitto_pub -h host -t beehive/weight -m "{\"id\":$id, \"weight\":$weight}" -p 1883 -u username -P password

    sleep 1
done
