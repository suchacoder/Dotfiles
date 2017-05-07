#!/bin/sh
echo "Introduzca la IP"
read ipgeo
location=`pwd`
url="http://www.geoiptool.com/en/?IP="
lynx -dump $url$ipgeo > $location/tmp
cat $location tmp | sed -n '/Host Name/,/Postal code/p'
rm $location/tmp
unset ipgeo
unset location
exit 0
