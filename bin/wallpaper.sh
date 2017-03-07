#!/bin/bash
while :; do
	find ~/Pictures/Wallpapers/ -type f \( -name '*.*' \) -print0 | shuf -n1 -z | xargs -0 feh --bg-fill ; sleep 12h ; # append sleep <time> to automatically switch
done
