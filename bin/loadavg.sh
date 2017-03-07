#!/usr/bin/env bash

function read_cpu_values {
 local percentages

 eval "$(awk '/^cpu[0-9]/{print $1 "_idle=" $5 "; " $1 "_total=" $2+$3+$4+$5 }' /proc/stat)"

 for (( i=0; i<8; i++ )); do
   local idle="cpu${i}_idle" ; idle="${!idle}"
   local idle_previous="cpu${i}_idle_previous" ; idle_previous="${!idle_previous}"
   local total="cpu${i}_total" ; total="${!total}"
   local total_previous="cpu${i}_total_previous" ; total_previous="${!total_previous}"
   local diff=$(( total - ${total_previous:-0} ))
   local percentage=$(( 100 * (diff - (idle - ${idle_previous:-0})) / diff ))

   percentages="$percentages ${percentage}%"
 done

 echo "${percentages:1}"

 eval "$(awk '/^cpu[0-9]/{print $1 "_idle_previous=" $5 "; " $1 "_total_previous=" $2+$3+$4+$5 }' /proc/stat)"
}

function main {
   while true; do
      read_cpu_values
      sleep 1
   done
}

main "$@"
