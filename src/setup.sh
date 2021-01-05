#!/usr/bin/env bash

wait_for_return () { echo -n "Press hit return (enter) when you are ready. We will wait. "; read; }

CONFIG_DIR="$HOME/.config/wallpaper-panic"
mkdir $CONFIG_DIR --parents
cd $CONFIG_DIR

# Create status file with content "1" if it does not exist yet. Here "1" is
# just a convention, which means that when the script (wpan.sh) is executed
# it will replace the user's permanent wallpaper with a temporary one. If
# the file contains "0" instead, then it is the other way around.
[ ! -e status ] && echo 1 > status

clear
cat << EOF
Please, move your permanent wallpaper (the one you actually want to use
for most of the time) to $CONFIG_DIR. It MUST be named "permanent_wallpaper"
(without quotes) plus any extension.

Example: permanent_wallpaper.jpg
EOF

wait_for_return
[ ! -e permanent_wallpaper.* ] && echo "Permanent wallpaper not found." && exit 1
echo

clear
cat << EOF
Permanent wallpaper was successfully detected. Now please move your temporary
wallpaper (the one which will be swapped to when you run the wpan script) to
$CONFIG_DIR too. It MUST be named "temporary_wallpaper" (without quotes) plus
any extension.

Example: temporary_wallpaper.jpg
EOF

wait_for_return
[ ! -e temporary_wallpaper.* ] && echo "Temporary wallpaper not found." && exit 1
echo

clear
cat << EOF
Temporary wallpaper was successfully detected. Now please install Nitrogen.

Here are some quick ways to install it:
For Debian-based distributions: sudo apt install nitrogen
For Arch-based distributions: sudo pacman -S nitrogen

If the above commands are not enough for you, you can check out their GitHub
for build instructions: https://github.com/l3ib/nitrogen or check your
distribution's manual to check if it is in the official repositories.
EOF

wait_for_return
echo

cat << EOF
One last step: where would you like to place the wpan script?
EOF

# TODO
