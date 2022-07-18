#!/bin/bash
prev=$(cat /sys/class/backlight/intel_backlight/brightness)
new=$prev
INTERVAL=5000
if [ "$1" = "+" ] ; then
	new=$((prev + INTERVAL))
elif [ "$1" = "-" ] ; then
	new=$((prev - INTERVAL))
else
	new="$1"
fi	
echo $new > /sys/class/backlight/intel_backlight/brightness
