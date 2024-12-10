#!/bin/env bash

CONFIG="/home/$USER/.config/hypr/wofi/config"
STYLE="/home/$USER/.config/hypr/wofi/style.css"
DATABASE="/home/$USER/Drive/passwords/Database.kdbx"

# Kill other wofi instances
[[ ! $(pidof wofi) ]] || pkill wofi

# Prompt password
# I don't know if its necessary, but just in case
# disable bash history
set +o history
PASSWORD=$(wofi --dmenu --conf="$CONFIG" --style="$STYLE" \
    --password --hide-scroll \
    --height=60 \
)

# Quit if user abort
[[ -z "$PASSWORD" ]] && exit 1

# List all entries, including subgroups
# Items from subgroups have paddings
# Subgroups are in format MySubgrou/
# So we need to parse the output
RAW_ENTRIES=$(keepassxc-cli ls "$DATABASE"\
    --recursive\
    <<< "$PASSWORD")

# Quit if there is no entires
# Can be empty database or wrong credentials
[[ -z "$RAW_ENTRIES" ]] && exit 1

# Remove leading spaces
PARSED_ENTRIES=$(awk '{$1=$1;print}' <<< "$RAW_ENTRIES" |\
# Remove empty lines
awk '!/^[[:space:]]*$/' |\
# Remove lines with / or [
awk '$0 !~ /[\/\[].*/')
# Add more regex if you want

# Prompt valid entries
PICK=$(echo "$PARSED_ENTRIES" |\
    wofi --dmenu --conf="$CONFIG" --style="$STYLE")

# Handle user abort again
[[ -z "$PICK" ]] && exit 1

# Copy to clipboard
keepassxc-cli clip "$DATABASE" "$PICK" <<< "$PASSWORD"

# Also clear just in case
unset PASSWORD
set -o history

