#!/bin/bash

# DOES NOT WORK. Script works, but either does not get called, 
# or something is different during greeting

# in /etc/lightdm/lightdm.conf point "display-setup-script" to this script
# and make it executable

until [ xrandr ]; do sleep 1; done
xrandr --output DP-1 --primary
xrandr --output DP-2 --left-of DP-1 --rotate left --auto
exit 0
