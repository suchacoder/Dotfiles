#!/bin/sh

sensors -A | awk '/temp1/ {print $2}'

while :
do
	sleep 9
done
