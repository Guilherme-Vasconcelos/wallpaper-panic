# Wallpaper Panic [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A script which allows you to temporarily switch your wallpaper.

There are two scripts: setup.sh (used during the installation) and wpan.sh (the wallpaper-panic itself).

### Installation

Download the src/setup.sh file and execute it with: `chmod +x setup.sh && ./setup.sh`.

Not all steps are automated, but the script will guide you for manual steps.

### Usage

Run `wpan.sh` to change your wallpaper. Then run it again to change it back.

It is recommended to set a keyboard shortcut to execute it without having to open a terminal
(e.g. you can set something such as super + w to execute `wpan.sh`). This depends on your desktop
environment, so this part I will leave to you.

### Compatibility

wallpaper-panic is written in bash, which is installed by default in most (if not all) Unix-based
operating systems.

Currently only works for Xfce.

### License
wallpaper-panic's is licensed under the MIT license. Please refer to LICENSE for more details.
