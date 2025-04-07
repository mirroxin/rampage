#!/bin/bash
WAYBAR_DIR="$HOME/.config/waybar"
STYLECSS="$WAYBAR_DIR/style.css"
CONFIG="$WAYBAR_DIR/config"
ASSETS="$WAYBAR_DIR/assets"
THEMES="$WAYBAR_DIR/themes"
menu() {
    find "${ASSETS}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}
main() {
    choice=$(menu | wofi -c ~/.config/wofi/waybar -s ~/.config/wofi/style-waybar.css --show dmenu --prompt "  Select Waybar (Scroll with Arrows)")
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    echo $selected_wallpaper
    if [[ "$selected_wallpaper" == "$ASSETS/simple.png" ]]; then
        cat $THEMES/simple/style-simple.css > $STYLECSS
        cat $THEMES/simple/config-simple.jsonc > $CONFIG
        pkill waybar && waybar
    elif [[ "$selected_wallpaper" == "$ASSETS/default.png" ]]; then
        cat $THEMES/default/style-default.css > $STYLECSS
        cat $THEMES/default/config-default.jsonc > $CONFIG
        pkill waybar && waybar
    fi

}
main
