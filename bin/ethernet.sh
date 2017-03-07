#!/bin/bash

. ~/bin/utils.sh

status=$(nmcli -t --fields type,state device | grep ethernet)
case "$BLOCK_BUTTON" in
"1")
    run gnome-control-center network ;;
"2" | "3")
    nmcli radio wifi off
    run nmcli device connect enp1s0 ;;
esac

case "$(split_and_get $status 2)" in
"unavailable")
    i3block_out down $red ;;
"connected")
    i3block_out up $blue ;;
*)
    i3block_out "not connected" $orange ;;
esac
