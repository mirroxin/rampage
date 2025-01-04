#!/bin/bash
pkill -f waybar
sleep 0.5
nohup waybar >/dev/null 2>&1 &
