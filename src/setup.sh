#!/usr/bin/env bash

wait_for_return () { echo -n "Press hit return (enter) when you are ready. We will wait. "; read; }

CONFIG_DIR="$HOME/.config/wallpaper-panic"
mkdir $CONFIG_DIR --parents
cd $CONFIG_DIR

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

clear
cat << EOF
One last step: if you would like the script wpan.sh to be globally accessible,
move it to ~/.local/bin/ or some other directory that is in your path.
EOF

# TODO: move the wpan script
