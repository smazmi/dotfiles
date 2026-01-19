#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Step 1: Ask user to choose monitor
monitor=$(hyprctl monitors | awk '/Monitor/ {print $2}' | wofi --dmenu --prompt "Choose Monitor")

# Exit if nothing selected
[[ -z "$monitor" ]] && exit

# Step 2: Ask user to choose wallpaper
wallpaper=$(ls "$WALLPAPER_DIR" | wofi --dmenu --prompt "Choose Wallpaper")

# Exit if nothing selected
[[ -z "$wallpaper" ]] && exit

fullpath="$WALLPAPER_DIR/$wallpaper"

# Step 3: Set wallpaper
hyprctl hyprpaper preload "$fullpath"
hyprctl hyprpaper wallpaper "$monitor,$fullpath"

# Optional: update hyprpaper.conf for persistence
# Remove old entries for this monitor
sed -i "/^wallpaper = $monitor,/d" ~/.config/hypr/hyprpaper.conf
sed -i "/^preload = $fullpath/d" ~/.config/hypr/hyprpaper.conf

# Add new entries
echo "preload = $fullpath" >>~/.config/hypr/hyprpaper.conf
echo "wallpaper = $monitor,$fullpath" >>~/.config/hypr/hyprpaper.conf

# Notify
notify-send "Wallpaper Set" "Monitor: $monitor"
