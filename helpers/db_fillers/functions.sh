#!/bin/bash

#works fine up to 999
#generate_samples samples_count upper_limit
function generate_samples {

    if [[ -z $3 ]] ; then
        precision=4
    else
        precision=$3
    fi

    upper_limit=5.0
    for i in $(seq 1 $1) ; do
        random=$(($RANDOM % $2))
        echo "$random / 100" | bc -l | sed 's/^\./0./' | cut -c1-$precision
    done
}
