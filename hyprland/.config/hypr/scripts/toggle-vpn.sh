#!/bin/bash
CONFIG_FILE="/home/$USER/.config/swaync/config.json"
CSS_FILE="/home/$USER/.config/swaync/style.css"
VPN_TARGET_NAME=$(nmcli con | grep "vpn" | awk '{print $1}')
VPN_STATUS=$(nmcli con show --active | grep -i 'vpn')

if [ -n "$VPN_STATUS" ]; then
    # if it's connected
    nmcli con down id $VPN_TARGET_NAME
    sed -i 's/"label": "  Connected"/"label": "  VPN"/' "$CONFIG_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button>label { color: @crust; }/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button>label {}/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button { background: @pink; border: 2px solid @pink; }/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button {}/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button:hover>label {}/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button:hover>label { color: @pink; }/' "$CSS_FILE"
else
    nmcli con up id $VPN_TARGET_NAME
    sed -i 's/"label": "  VPN"/"label": "  Connected"/' "$CONFIG_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button>label {}/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button>label { color: @crust; }/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button {}/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button { background: @pink; border: 2px solid @pink; }/' "$CSS_FILE"
    sed -i 's/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button:hover>label { color: @pink; }/.widget-buttons-grid>flowbox>flowboxchild:nth-child(4)>button:hover>label {}/' "$CSS_FILE"
fi

swaync-client --reload-config
swaync-client --reload-css
