#!/usr/bin/env bash

# "permanent wallpaper" means the one which the user actively uses (and wants to hide)
CONFIG_DIR="$HOME/.config/wallpaper-panic"
cd $CONFIG_DIR

set_wallpaper() {

}

# Identify which action should be taken
wallpaper_action=$( cat status )
if [ $wallpaper_action == 1 ]
then
    # replace permanent by temporary
    [ $( ls | grep permanent | wc -l ) != 1 ] && \
        echo "More than one wallpaper was found! Please go to $CONFIG_DIR" && \
        echo "and make sure you only have one permanent_wallpaper." && exit 1

    permanent_wallpaper=$( find permanent_wallpaper.* )
    set_wallpaper ./$permanent_wallpaper
    echo 0 > status
else
    # replace temporary by permanent
    [ $( ls | grep temporary | wc -l ) != 1 ] && \
        echo "More than one wallpaper was found! Please go to $CONFIG_DIR" && \
        echo "and make sure you only have one temporary_wallpaper." && exit 1

    temporary_wallpaper=$( find temporary_wallpaper.* )
    set_wallpaper ./$temporary_wallpaper
    echo 1 > status
fi
