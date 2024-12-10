#!/usr/bin/env bash

CONFIG="$HOME/.config/hypr/wofi/config"
STYLE="$HOME/.config/hypr/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then

    ps -e -o pid,cmd --sort=-%mem \
        | wofi --dmenu --prompt "Running Processes" \
        --conf "${CONFIG}" --style "${STYLE}" | awk '{printf "%s", $1}' | wl-copy
else
    pkill wofi
fi
