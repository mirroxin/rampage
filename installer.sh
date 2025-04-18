#!/bin/bash


echo "Вы уверены, что хотите установить всё? (y/n)"
read -p "Введите ваш выбор: " choice

if [[ $choice != "y" ]]; then
  echo "Вы выбрали не устанавливать. Удаляю систему..."
  exit 1
fi


# пакеьи пакмаен
sudo pacman -S --needed --noconfirm git base-devel waybar hyprlock kitty rofi fastfetch firefox gtk3 gtk-layer-shell broadcom-wl fish sxiv cava cmatrix pamixer

# гетхабек
git clone https://github.com/mirroxin/rampage.git
git clone https://aur.archlinux.org/yay.git ~/yay-installer
cd ~/yay-installer
makepkg -si --noconfirm
yay -S --noconfirm swww pywal swaync wofi ttf-monocraft noto-fonts-cjk otf-codenewroman-nerd nautilus telegram-desktop code python-pywalfox walogram hyprshot wttrbar bluez bluez-utils blueman broadcom-bt-firmware apple-fonts

# приход
cd ~/rampage

# капирование
cp -r .config ~/
cp -r Downloads ~/
cp -r wallpaper ~/

# да ъуйнчя с валлпаперамим
wal -i /home/mirroxin/wallpaper/morg.jpg


# После завершения установки
echo "Установка завершена! Хотите перезагрузить компьютер? (y/n)"
read -p "Введите ваш выбор: " reboot_choice

if [[ $reboot_choice == "y" ]]; then
  echo "Перезагружаю..."
  sudo reboot
else
  echo "Перезагрузка отменена."
fi
