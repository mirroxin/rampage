#!/bin/bash
WALLPAPER_DIR="$HOME/wallpaper/"
ICON="$HOME/.config/swaync/icons/wallpaper.png"

menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}

main() {
    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Выберите обои:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    
    if [[ -n "$selected_wallpaper" && -f "$selected_wallpaper" ]]; then
        swww img "$selected_wallpaper" --transition-type simple
        wal -i "$selected_wallpaper"
        notify-send -i "$ICON" "Обои обновлены" "$( "$selected_wallpaper")"
        walogram
        pkill waybar 
        waybar
        pkill swaync
        swaync 
    fi
}
main

