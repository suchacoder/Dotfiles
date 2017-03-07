#!/bin/bash

. ~/bin/utils.sh

_pactl() {
    echo "= $FUNCNAME $*" >&2
    pactl -n i3block-control $*
}

_pactl_list() {
    echo "= $FUNCNAME $*" >&2
    _pactl list sinks
}

_pactl_list_short() {
    echo "= $FUNCNAME $*" >&2

    # output: card_id card_name c_module info status
    # formatted: card_name status
    _pactl list short sinks |
        grep -v hdmi | # ignore hdmi output
        awk -F '\t' '{ print $2, $5 }'
}

_pactl_get_next() {
    echo "= $FUNCNAME $*" >&2
    #      get RUNNING and next one
    next=$(_pactl_list_short | grep -A1 RUNNING | tail -1)
    if echo $next | grep -q RUNNING; then
        #      if the RUNNING one is last, get the first
        next=$(_pactl_list_short| head -1)
    fi
    echo $next | awk '{ print $1 }'
}

_pactl_get_current() {
    echo "= $FUNCNAME $*" >&2
    _pactl_list_short | grep RUNNING | awk '{ print $2 }'
}

_pactl_get_display_name() {
    echo "= $FUNCNAME $*" >&2
    if [[ $1 == "" ]]; then
        echo off;
        return
    fi

    _pactl_list |
        grep -A2 "$1" |
        tail -1 |
        awk -F ': ' '{ print $2 }' |
        sed 's/ Analog Stereo//'
}

_pactl_set() {
    echo "= $FUNCNAME $*" >&2
    if [[ $1 == "" ]]; then
        return
    fi

    # set new default sink
    pacmd "set-default-sink" "$1"

    # move currently playing streams to the new output
    _pactl list short sink-inputs | awk '{ print $1 }' | while read stream; do
        _pactl move-sink-input "$stream" "$1"
    done
}

case "$BLOCK_BUTTON" in
    1) run gnome-control-center sound ;;
    2|3|4|5) _pactl_set $(_pactl_get_next) ;;
esac

_pactl_get_display_name $(_pactl_get_current)
