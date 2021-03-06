#!/bin/bash

# Color directory
CD="$HOME/.Xresources"

# Fetch the Colors
BG=$(cat ${CD} | grep -i background | head -n 1 | awk '{print $2}')
FG=$(cat ${CD} | grep -i foreground | head -n 1 | awk '{print $2}')

BLACK=$(cat ${CD} | egrep "^*color8" | tail -c 8)
RED=$(cat ${CD} | egrep "^*color9" | tail -c 8)
GREEN=$(cat ${CD} | egrep "^*color10" | tail -c 8)
YELLOW=$(cat ${CD} | egrep "^*color11" | tail -c 8)
BLUE=$(cat ${CD} | egrep "^*color12" | tail -c 8)
MAGENTA=$(cat ${CD} | egrep "^*color13" | tail -c 8)
CYAN=$(cat ${CD} | egrep "^*color14" | tail -c 8)
WHITE=$(cat ${CD} | egrep "^*color15" | tail -c 8)

# Fonts
FONT="Droid Sans Mono:bold:pixelsize=15"

# Panel
PW=1920
PH=20
PX=0
PY=0



#Actions
VOLT="amixer sset Master toggle"
VOLU="amixer sset Master 2%+"
VOLD="amixer sset Master 2%-"
TMUS="mpc toggle"
NMUS="mpc next"
#POW="~/scripts/power"

# Functions

#Workspace number

#ws(){
#	ws=$(i3-msg -t get_outputs | sed 's/.*"current_workspace":"\([^"]*\)".*/\1/')
#	echo "%{F$WHITE}${ws}"
#}

music() {
    music=$(n=$(mpc current); if [ -z "$n" ] ; then echo; else echo " $n"; fi)
	echo "%{F$CYAN}${music}"
}

cpu(){
	cpu=$(mpstat -P ALL 1 1 | awk '(NR>11) {print $3+$5}' | paste -d " " - - - -)
	echo "%{F$YELLOW} ${cpu}"
}

net(){
	 ip=$(ip addr | awk '/inet /{print substr($2,1)}' | head -n 1)
	 if [ ! "$ip" ]; then ip=$(echo "No Connection");fi
#	ip=$(ip=$(/sbin/ifconfig | grep wlan0 -A 5 | sed '/inet\ addr/!d;s/.*addr:\([0-9.]*\).*/\1/'); if [ ! -z $ip ]; then echo $ip ;else ip=$(/sbin/ifconfig | grep
#   enp2s0 -A 5 | sed '/inet addr:/!d;s/.*addr:\([0-9.]*\).*/\1/'); if [ ! -z "$ip" ]; then echo "$ip"; else echo "No ip";fi;fi)
	ping=$(pn=$(timeout .8 ping 185.40.64.65 -c 1 -s 24 | sed '2!d;s/.*time=\([0-9]*\).*/\1/'); if [ -z $pn ] ; then echo "No Connection"; else echo "${pn}ms"; fi)
	echo "%{F$GREEN} ${ip}"
}

#mail() {
#	mailcount=$(~/scripts/getmail.sh)
#	echo "%{F$YELLOW} ${mailcount}"
#}

ram(){
	ram=$(free -h | grep -i mem | awk '{print $3}' | free -h | grep -i mem | awk '{print $3}')
	echo "%{F$YELLOW} ${ram}"
}

temp(){
  temp=$(sensors | grep temp1 | sed '1d;s/.*+\([0-9]*\).*/\1/')
	echo "%{F$YELLOW} ${temp}C"
}

clock(){
  clock=$(date "+%d %b %Y  %H:%M")
	echo "%{F$MAGENTA}${clock}"
}

#xmas() {
#	xmasday=$(date -d "Dec 25 2015" +%s)
#	now=$(date +%s)
#	expr="(${xmasday} - ${now}) / 86400"
#	daysuntil=$(echo ${expr} | bc)
#	echo "%{F$MAGENTA} ${daysuntil} sleeps until xmas!"
#}

vol(){
  vol=$(amixer get 'Master' | grep Mono: | sed 's/ *Mono: .* \[\([^ ]*\)\] \[[^ ]*\] \[\([^ ]*\)\]/\1 \2/;s/.*off/off/;s/\([^ ]*\).*/\1/')
	echo "%{F$YELLOW} ${vol}"
}

#pow(){
#	FOLD="/sys/class/power_supply"
#	val=$(if [ -d $FOLD/BAT0 ]; then cat $FOLD/BAT0/capacity; fi)
#	pow=$(if [ $(cat $FOLD/AC0/online) = 1 ]; then if [ ! -d $FOLD/BAT0 ]; then echo ""; else echo "";fi; else if [[ $val < 12 ]]; then echo ""; else if [[ $val >
#90 ]]; then echo ""; else echo "";fi; fi;fi)
#	echo "%{F$YELLOW}${pow}"
#}

while :; do
	echo "   %{c}%{A1:$TMUS:}%{A3:$NMUS:}$(music)%{A}%{A}  $(mail) $(net)  %{A:$VOLT:}%{A4:$VOLU:}%{A5:$VOLD:}$(vol) %{A}%{A}%{A}  $(clock)   "
	 sleep .5
done | lemonbar -g ${PW}x${PH}+${PX}+${PY} -f "$FONT" -B "$BG" -F "$FG" -p -d | \
    while :; do read line; eval $line; done &
