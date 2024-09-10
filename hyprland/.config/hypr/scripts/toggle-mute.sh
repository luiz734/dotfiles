#!/bin/bash

CONFIG_FILE="/home/$USER/.config/swaync/config.json"
CSS_FILE="/home/$USER/.config/swaync/style.css"

MUTE_STATUS=$(pactl get-sink-mute @DEFAULT_SINK@ | grep 'yes')

if [ -n "$MUTE_STATUS" ]; then
    # MUTED -> NON MUTED
    sed -i 's/"label": "󰝟  Muted"/"label": "󰕾  Mute"/' "$CONFIG_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button>label { color: @crust; }/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button>label {}/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button { background: @pink; border: 2px solid @pink; }/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button {}/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button:hover>label {}/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button:hover>label { color: @pink; }/' "$CSS_FILE"
else
    # NON MUTED -> MUTED
    sed -i 's/"label": "󰕾  Mute"/"label": "󰝟  Muted"/' "$CONFIG_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button>label {}/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button>label { color: @crust; }/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button {}/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button { background: @pink; border: 2px solid @pink; }/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button:hover>label { color: @pink; }/.widget-buttons-grid>flowbox>flowboxchild:nth-child(2)>button:hover>label {}/' "$CSS_FILE"
fi

pactl set-sink-mute @DEFAULT_SINK@ toggle
swaync-client --reload-config
swaync-client --reload-css
