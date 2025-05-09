#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/select-wall-config"

WALLPAPERS_PATH=$HOME/Wallpaper

NEW_WALL=$(
    find $WALLPAPERS_PATH -type f |
    sed 's/^/img:/' |
    wofi --conf ${CONFIG}
)

abspath=${NEW_WALL#img:}

killall hyprpaper &
hyprctl dispatch exec hyprpaper &
hyprctl hyprpaper preload "$abspath" &
hyprctl hyprpaper wallpaper ", $abspath" &
ln -sf $abspath /home/misha/.current-wallpaper &
wal -i "$abspath"

