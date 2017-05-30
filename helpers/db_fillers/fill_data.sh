#!/bin/bash

if [[ $# -ne 1 ]] ; then
    echo "Usage: $0"
    exit 2;
fi

source ./functions.sh

for i in $(seq 1 $1) ; do
    id=$(($RANDOM % 100))
    temp_in=$(generate_samples 1 4500 5)
    temp_out=$(echo "$temp_in - $(generate_samples 1 999 5)" | bc -l | sed 's/^\./0./' | cut -c 1-5)
    humidity_in=$(($RANDOM % 100))
    humidity_out=$(($humidity_in - $((RANDOM % 10))))
    bees_count=$(shuf -i 200-4500 -n 1)

    mosquitto_pub -h host -t beehive/data -m "{\"id\":$id, \"temp_in\":$temp_in, \"temp_out\":$temp_out, \"humidity_in\":$humidity_in, \"humidity_out\":$humidity_out, \"bees_count\":$bees_count}" -p port -u username -P password
    
    #timestamp is the primary key, so we should wait some time
    sleep 1
done
