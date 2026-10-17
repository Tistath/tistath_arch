#!/usr/bin/sh

# 一步成功才会接着执行
set -e

read -rp "commit message(默认'update'): " msg
msg="${msg:-update}"

files=(
"/etc/environment"
"$HOME/.zshrc"
"$HOME/.config/bat/"
"$HOME/.config/copyq/themes/"
"$HOME/.config/dunst/"
"$HOME/.config/fastfetch/"
"$HOME/.config/fcitx5/"
"$HOME/.config/fontconfig/"
"$HOME/.config/fzf/"
"$HOME/.config/htop/"
"$HOME/.config/imv/"
"$HOME/.config/kitty/"
"$HOME/.config/mpv/"
"$HOME/.config/niri/"
"$HOME/.config/nvim/"
"$HOME/.config/swaylock/"
"$HOME/.config/waybar/"
"$HOME/.config/yazi/"
"$HOME/.config/zathura/"
"$HOME/.config/zsh/"
"$HOME/.local/share/fcitx5/rime/default.custom.yaml"
"$HOME/.local/share/fcitx5/themes/"
"$HOME/.local/share/icons/"
"$HOME/.oh-my-zsh/custom/themes/"
"$HOME/Documents/arch_install.md"
)

for f in "${files[@]}"; do
    rsync -av --delete "$f" "$HOME/tistath_arch/$f"
done

pacman -Qqen > ~/tistath_arch/pkglist-official.txt
pacman -Qqem > ~/tistath_arch/pkglist-aur.txt

cd ~/tistath_arch
git add .
git commit -m "$msg"
git push -u origin main
