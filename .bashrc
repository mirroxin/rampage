fastfetch --kitty-direct /home/mirroxin/Downloads/ponos.png
wal -i /home/mirroxin/wallpaper/sakura.jpg > /dev/null 2>&1
random_emoji() {
  local emojis=("😀" "🔥" "💻" "🖥️" "🔧" "🌐" "🖊")
  echo ${emojis[RANDOM % ${#emojis[@]}]}
}

PS1='\[\e[0;34m\]╭─\[\e[1;32m\]\u@\h \[\e[1;36m\]\w $(random_emoji)\n\[\e[0;34m\]╰─📂 \[\e[0m\]'



