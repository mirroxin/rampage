#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-16'

wallpapers=$HOME/wallpaper
image="$(ls $wallpapers | rofi -dmenu -i -p "  Select wallpaper: " -theme ${dir}/${theme}.rasi)"
wallpaper=$wallpapers/$image

if [[ $image == "" ]]; then
    exit 1
fi

if [[ -d $wallpapers/$image ]]; then
    echo "$wallpapers/$image is a directory"
    wallpaper_temp="$image"
    sleep2
    wallpaper_location="$(ls $wallpapers/$image | wofi -n --show dmenu -k "/dev/null")"
elif [[ -f $wallpapers/$image ]]; then
    echo "$wallpapers/$image is a file"
else
    echo "$wallpapers/$image is not valid"
    exit 1
fi

swww img $wallpaper --transition-type fade
sleep 1.25
wal -i "$wallpaper" 
pkill waybar 
waybar
walogram