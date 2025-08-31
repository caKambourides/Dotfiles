#!/usr/bin/env bash
#usb auto mount
udiskie &

swww-daemon &
swww img ~/Pictures/papes/1743295573265018.png

nm-applet --indicator &

waybar &

#dunst 
dunst
