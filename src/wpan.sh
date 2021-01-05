#!/usr/bin/env bash

# status conventions:
# 1 means that when the script (wpan.sh) is executed it will replace the user's permanent
# wallpaper with a temporary one. If the status file contains "0" instead, then it is the
# other way around.

# "permanent wallpaper" means the one which the user actively uses (and wants to hide)
CONFIG_DIR="$HOME/.config/wallpaper-panic"
cd $CONFIG_DIR

# Identify which action should be taken
wallpaper_action=$( cat status )

# TODO: set status to 0
[ $wallpaper_action == 1 ] && echo "Replacing wallpaper1"

# TODO: set status to 1
[ $wallpaper_action == 0 ] && echo "Replacing wallpaper0"

echo
