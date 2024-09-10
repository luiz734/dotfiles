#!/usr/bin/env bash

CONFIG="$HOME/.config/hypr/wofi/config"
STYLE="$HOME/.config/hypr/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi
