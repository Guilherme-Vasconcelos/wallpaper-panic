#!/usr/bin/env bash

# "permanent wallpaper" means the one which the user actively uses (and wants to hide)
CONFIG_DIR="$HOME/.config/wallpaper-panic"

# Set up the wallpapers
REPLACE_PERM_WITH_TMP=$(cat status)
cp $PERMANENT_WALLPAPER_PATH ./permanent_wallpaper
[ ! -e temporary_wallpaper ] && echo "Move a file called temporary_wallpaper to $CONFIG_DIR" && exit 1

# [ $REPLACE_PERM_WITH_TMP == 1 ] && 
