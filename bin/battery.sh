#!/bin/bash

. ~/bin/utils.sh

if [[ $BLOCK_BUTTON != "" ]]; then
    run gnome-control-center power
fi

eval $(cat /sys/class/power_supply/BAT0/uevent)

case "$POWER_SUPPLY_STATUS" in
"Discharging")
    label="🔋" ;;
"Charging")
    label="🔌" ;;
"Full")
    label="⚡" ;;
*)
    label="?" ;;
esac

text+="$POWER_SUPPLY_CAPACITY"

if [[ $POWER_SUPPLY_STATUS == "Discharging" ]]; then
    case "$POWER_SUPPLY_CAPACITY_LEVEL" in
    "Normal")
        color=$white ;;
    "Low")
        color=$yellow ;;
    "Critical")
        color=$red ;;
    *)
        color=$blue ;;
    esac
fi

# TODO Monitor and warn when low?

i3block_out "$text" "$color" "$label" "%"
