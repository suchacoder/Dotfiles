#!/bin/bash
# Dylan's lemonbar workspace script

# Variables that don't need to be in the loop.
focus="$HOME/.config/openbox/scripts/musicfoc.sh"
bg=$red
bgfoc=$cyan

startbutton() {
	echo "%{A:~/.config/openbox/scripts/startbutton.sh:}    %{A}"
}

workspace() {
    query=$(wmctrl -d | awk '/\*/ {printf $1}')

	case $query in
		0 )
			echo "%{B#$bgfoc}  cmd  %{B}%{B#$bg}%{A:$focus 1:}  www  %{A}%{B}%{B#$bg}%{A:$focus 2:}" ;;
		1 )
			echo "%{B#$bg}%{A:$focus 0:}  cmd  %{A}%{B}%{B#$bgfoc}  www  %{B}%{B#$bg}%{A:$focus 2:}" ;;
		2 )
			echo "%{B#$bg}%{A:$focus 0:}  cmd  %{A}%{B}%{B#$bg}%{A:$focus 1:}  www  %{A}%{B}%{B#$bgfoc}" ;;
		3 )
			echo "%{B#$bg}%{A:$focus 0:}  cmd  %{A}%{B}%{B#$bg}%{A:$focus 1:}  www  %{A}%{B}%{B#$bg}%{A:$focus 2:}" ;;
		* )
			echo "%{B#$bg}%{A:$focus 0:}  cmd  %{A}%{B}%{B#$bg}%{A:$focus 1:}  www  %{A}%{B}%{B#$bg}%{A:$focus 2:}" ;;
	esac
}

windowtitle() {
	title=$(xdotool getactivewindow getwindowname | cut -c 1-75)
	echo "%{F#$white}  $title%{F}"
}

while :; do
	echo "$(startbutton)$(workspace) $(windowtitle)"
	sleep .03s
done |

lemonbar -g "970x$barheight" -f "drift" -f "xbmicons" -B "#00$black" -F "#$white" | bash
