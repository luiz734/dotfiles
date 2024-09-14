#!/usr/bin/env bash
SCRIPTS_DIR="/home/$USER/.config/hypr/scripts"

sleep 2

# Desktop 1: Firefox
workspace=1
hyprctl dispatch workspace $workspace
firefox & sleep 1

# Desktop 2: Two Alacritty terminals, one 80% top, one 20% bottom
workspace=2
hyprctl dispatch workspace $workspace
alacritty & sleep 1
alacritty & sleep 1
hyprctl dispatch togglesplit & sleep 1
hyprctl dispatch resizeactive exact 1920 850
hyprctl dispatch movefocus u 

# Desktop 3: Two terminals, split horizontally (50% each)
workspace=3
hyprctl dispatch workspace $workspace
alacritty & sleep 1
alacritty & sleep 1

# Desktop 4: Spotify
workspace=4
hyprctl dispatch workspace $workspace
$($SCRIPTS_DIR/run-spotify.sh) & sleep 1

# Desktop 5: Empty
workspace=5
hyprctl dispatch workspace $workspace & sleep 1
# $($SCRIPTS_DIR/run-kopia.sh) & sleep 1

hyprctl dispatch workspace 2
