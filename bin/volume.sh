#!/bin/bash

. ~/bin/utils.sh

case "$BLOCK_BUTTON" in
    1) run gnome-control-center sound ;;
    3) amixer -q sset Master toggle ;;
    4) amixer -q sset Master 5%+ ;;
    5) amixer -q sset Master 5%- ;;
esac

state=$(awk -F"[][]" '/%/ { print $4 }' <(amixer sget Master) | head -1)
volume=$(awk -F"[][]" '/%/ { print $2 }' <(amixer sget Master) | head -1)
color=$white
text=${volume/%%/}

if [[ $state == "off" ]]; then
    color=$yellow
    prefix="~"
fi

i3block_out $text $color "$prefix" %
