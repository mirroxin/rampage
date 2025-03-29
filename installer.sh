#!/bin/bash

# Установка необходимых пакетов
sudo pacman -S --needed git base-devel sudo pacman -S waybar hyprlock kitty rofi fastfetch

# Клонирование твоих дотов
git clone https://github.com/mirroxin/rampage.git
git clone https://aur.archlinux.org/yay.git ~/yay-installer
cd ~/yay-installer
makepkg -si --noconfirm
yay -S swww pywal swaync wofi

# Переход в папку с конфигами
cd ~/rampage

# Копирование конфигов в нужные места
cp -r .config ~/
cp .bashrc ~/
cp -r Downloads ~/

echo "Установка завершена!"
