#!/bin/bash

# Генерация цветовой палитры на основе текущих обоев
wal -i "$(hyprctl hyprpaper -j | jq -r '.current_wallpaper')"

# Применение цветов к Waybar
cp ~/.cache/wal/colors.json ~/.config/waybar/colors.json

# Перезагрузка Waybar
pkill waybar && waybar &
