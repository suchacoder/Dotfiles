#! /bin/bash
#
# haltusbpower init script
#
# chkconfig: 345 99 20
# description: A script to act as a workaround for the bug in the runtime power management module, which causes my acer aspire v5-571 laptop to restart after shutting down.
#
### BEGIN INIT INFO
# Provides: haltusbpower
# Default-Stop: 0 1 3 5
# Short-Description: Halt USB Powersave mode
# Description: A script to halt usb power control.
### END INIT INFO

# Source function library.
. /etc/init.d/functions

# Bus list for the runtime power management module.
buslist="usb"

# See how we were called.
case "$1" in
  start)
    echo "USB bug fix active"
    #no-op on startup
    ;;
  stop)
    echo "Turning off USB Power Control"
    for bus in $buslist; do
        for i in /sys/bus/$bus/devices/*/power/control; do
            echo on > $i
            done
    done
    ;;
  *)
    echo "Usage: /etc/init.d/haltusbpower {start|stop}"
    exit 1
    ;;
esac
exit 0
