#!/usr/bin/env bash

# "permanent wallpaper" means the one which the user actively uses (and wants to hide)
CONFIG_DIR="$HOME/.config/wallpaper-panic"
cd $CONFIG_DIR

set_wallpaper () {
    echo xfconf-query -c xfce4-desktop -p /backdrop/screen0/$( xrandr|awk '/\<connected/{print "monitor"$1}' )/workspace0/last-image -s $1
    case $DESKTOP_SESSION in
        xfce)
            xfconf-query -c xfce4-desktop -p /backdrop/screen0/$( xrandr|awk '/\<connected/{print "monitor"$1}' )/workspace0/last-image -s $1
            ;;
        *)
            echo "It seems your desktop environment is not supported yet!"
            exit 1
    esac
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
    set_wallpaper $CONFIG_DIR/permanent_wallpaper
    echo 0 > status
else
    # replace temporary by permanent
    [ $( ls | grep temporary | wc -l ) != 1 ] && \
        echo "More than one wallpaper was found! Please go to $CONFIG_DIR" && \
        echo "and make sure you only have one temporary_wallpaper." && exit 1

    temporary_wallpaper=$( find temporary_wallpaper.* )
    set_wallpaper $CONFIG_DIR/$temporary_wallpaper
    echo 1 > status
fi
