#!/bin/bash

. ~/bin/utils.sh

case "$BLOCK_BUTTON" in
    1) xbacklight -set 5 ;;
    3) xbacklight -set 50 ;;
    2) xbacklight -set 80 ;;
    4) xbacklight -time 0 -inc 1 ;; # scroll up
    5) xbacklight -time 0 -dec 1 ;; # scroll down
esac

luminosity="$(percent "$(xbacklight -get)" 100)"

i3block_out "$luminosity" "" "" %

