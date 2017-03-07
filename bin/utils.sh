#!/bin/bash

export cyan='#00CCCC'
export black='#121212'
export white='#CCCCCC'
export yellow='#FFCC00'
export orange='#990000'
export red='#CC0000'
export blue='#0099CC'
export green='#00CC00'

run() {
    setsid $@&
}

compute() {
    code="print('%.2f' % ($@))"
    python3 -c "$code"
}

percent() {
    [[ $# != 2 ]] && return 1
    if [[ $2 == 100 ]]; then
        numfmt --format '%.0f' $1
        return
    fi
    p=$(compute "$1 / $2 * 100")
    python3 -c "print(round($p))"
}

split_and_get() {
    echo $1 | awk "{ split(\$0, a, \":\"); print a[$2] }"
}

i3block_out() {
    template='%s<span color="%s">%s</span>%s\n'
    text=$1
    color=${2:-$white}
    if [[ $# > 2 ]] && [[ $3 != "" ]]; then
        prefix="$3 "
    fi
    if [[ $# > 3 ]] && [[ $4 != "" ]] ; then
        postfix=" $4"
    fi
    printf "$template" "$prefix" "$color" "$text" "$postfix"
}
