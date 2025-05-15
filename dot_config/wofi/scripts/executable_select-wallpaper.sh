#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/select-wall-config"

WALLPAPERS_PATH=$HOME/Wallpaper

NEW_WALL=$(
    find $WALLPAPERS_PATH -type f |
    sed 's/^/img:/' |
    wofi -n --conf ${CONFIG}
)

if [ -n "$NEW_WALL" ]; then
    abspath=${NEW_WALL#img:}

    ln -sf $abspath /home/misha/.current-wallpaper &
    wal -i "$abspath" &

    killall hyprpaper &
    hyprctl dispatch exec hyprpaper &
    hyprctl hyprpaper preload "$abspath" &
    hyprctl hyprpaper wallpaper ", $abspath" &

    pkill waybar;
    hyprctl dispatch exec waybar
fi

