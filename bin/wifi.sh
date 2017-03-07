#!/bin/bash

. ~/bin/utils.sh

status=$(nmcli radio wifi)
case "$BLOCK_BUTTON" in
"1")
    run gnome-control-center network ;;
"2" | "3")
    # toggle
    [[ $status == "disabled" ]] && nmcli radio wifi on || nmcli radio wifi off ;;
esac

if [[ $status == "disabled" ]]; then
    i3block_out down $red
    exit
fi

network=$(nmcli -t --fields active,signal device wifi | grep ^yes: | grep -v ^no:)
if [[ $? == 0 ]]; then
    signal=$(split_and_get "$network" 2)
    #ip=$(curl --http2 -s -m 1.5 https://bendem.be/ip)

    i3block_out "$signal" $blue "" %
    #if [[ $? == 0 ]]; then
        #i3block_out "$signal" $blue "" %
    #else
        #i3block_out "no internet / $signal" $orange "" %
    #fi

else
    i3block_out "not connected" $orange
fi
