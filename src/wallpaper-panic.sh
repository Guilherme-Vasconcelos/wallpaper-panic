#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/wallpaper-panic"

# Ensure wallpaper-panic directory exists
mkdir -p $CONFIG_DIR

# Create status file and adds "current_is_tmp=1" if does not exist yet
if [ ! -e "$CONFIG_DIR/status" ]
then
    echo "current_is_tmp=1" > "$CONFIG_DIR/status"
fi

if [ $DESKTOP_SESSION == "xfce" ]
    # Get current wallpaper's path: xfconf-query -c xfce4-desktop -p /backdrop/screen0/$(xrandr|awk '/\<connected/{print "monitor"$1}')/workspace0/last-image
fi
