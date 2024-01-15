#!/usr/bin/bash

function get_total_time_milli() {
    local time_start time_end time_total
    time_end="$(date +%s%N)"
    time_start="$1"
    time_total=$(( ("$time_end" - "$time_start") / 1000000 ))
    echo $time_total
}
