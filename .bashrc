fastfetch --kitty-direct /home/mirroxin/Downloads/um.png
random_emoji() {
  local emojis=("😀" "🔥" "💻" "🖥" "🔧" "🌐" "🖊")
  echo ${emojis[RANDOM % ${#emojis[@]}]}
}

PS1='> '

export PATH=/home/mirroxin/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
