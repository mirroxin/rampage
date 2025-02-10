#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-4"
theme='style-3'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown='⏻'
reboot=''
lock='🔒'
suspend=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        if [[ -x '/usr/bin/hyprlock' ]]; then
        hyprlock
        elif [[ -x '/usr/bin/i3lock' ]]; then
            i3lock
        fi
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        if [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
            hyprland_exit
        elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
            bspc quit
        elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
            i3-msg exit
        elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
            qdbus org.kde.ksmserver /KSMServer logout 0 0 0
        fi
        ;;
esac