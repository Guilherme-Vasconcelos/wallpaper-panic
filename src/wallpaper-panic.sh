#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/wallpaper-panic"

# Ensure wallpaper-panic directory exists
mkdir -p $CONFIG_DIR

# Create status file and adds "current_is_temp=1" if does not exist yet
if [ ! -e "$CONFIG_DIR/status" ]
then
    echo "current_is_temp=1" > "$CONFIG_DIR/status"
fi
