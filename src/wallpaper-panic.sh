#!/usr/bin/env bash

# "permanent wallpaper" means the one which the user actively uses (and wants to hide)
# TODO: PERMANENT_WALLPAPER_PATH only works with Xfce
CONFIG_DIR="$HOME/.config/wallpaper-panic"
PERMANENT_WALLPAPER_PATH=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/$(xrandr|awk '/\<connected/{print "monitor"$1}')/workspace0/last-image)

mkdir $CONFIG_DIR --parents
cd $CONFIG_DIR

# Create status file with content "1" if it does not exist yet
# Here "1" is just a convention, which means to replace the user
# permanent wallpaper by the temporary one. If status contains 0, then it
# is the other way around.
[ ! -e status ] && echo 1 > status

# Set up the wallpapers
REPLACE_PERM_WITH_TMP=$(cat status)
cp $PERMANENT_WALLPAPER_PATH ./permanent_wallpaper
[ ! -e temporary_wallpaper ] && echo "Move a file called temporary_wallpaper to $CONFIG_DIR" && exit 1

# [ $REPLACE_PERM_WITH_TMP == 1 ] && 
