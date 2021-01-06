#!/usr/bin/env bash

# "permanent wallpaper" means the one which the user actively uses (and wants to hide)
CONFIG_DIR="$HOME/.config/wallpaper-panic"
cd $CONFIG_DIR

set_wallpaper () {
    # each desktop environment is analyzed individually
    case $DESKTOP_SESSION in
        xfce)
            xfconf-query \
                -c xfce4-desktop \
                -p /backdrop/screen0/$(xrandr|awk '/\<connected/{print "monitor"$1}')/workspace0/last-image \
                -s $1
            ;;
        *)
            echo "It seems your desktop environment is not supported yet!"
            exit 1
    esac
}

[ $(ls | grep wallpaper | wc -l) != 2 ] && \
    echo "Invalid number of wallpapers! Please go to $CONFIG_DIR" && \
    echo "and make sure you have one permanent and one temporary wallpaper." && exit 1

# Identify which action should be taken
wallpaper_action=$(cat status)
if [ $wallpaper_action == 1 ]
then
    # replace permanent by temporary
    permanent_wallpaper=$(find permanent_wallpaper.*)
    set_wallpaper $CONFIG_DIR/$permanent_wallpaper
    echo 0 > status
else
    # replace temporary by permanent
    temporary_wallpaper=$(find temporary_wallpaper.*)
    set_wallpaper $CONFIG_DIR/$temporary_wallpaper
    echo 1 > status
fi
