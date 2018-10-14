#!/bin/bash

# for MACOS

max_volume () {
    osascript -e "set Volume 10"
}

say_multiple () {
    local i=0
    while [ $i -le $1 ]
    do
        max_volume
        say -v $2 $3
        sleep $4s
        ((i++))
    done
}

say_once () {
    max_volume
    say -v $1 $2
}

is_time () {
    local curr_date=$(date | awk '{print $5}')
    if [ "$curr_date" = "$1" ]
    then
        $2 $3 $4
    fi
}

while true
do
    is_time "12:00:00" say_once "speaker_name" "something to say"
    is_time "12:15:00" say_multiple 5 "speaker_name" "somethong to say" 0.2
done
