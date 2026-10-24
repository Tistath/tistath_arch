#!/usr/bin/bash

ask() {
  local prompt="$1"
  local ans
  read -r -p "$prompt [Y/n] " ans
  ans="${ans:-y}"
  [[ "$ans" =~ ^[Yy]$ ]]
}

prompts=(
  "=== 更新密钥环 ==="
  "=== 更新 pacman 包 ==="
  "=== 更新 AUR 包 ==="
  "=== 更新 Oh My Zsh 插件 ==="
  "=== 更新 yazi 插件 ==="
  "=== 更新 lazy.nvim 插件 ==="
  "=== 编译 blink.cmp Rust 库 ==="
  "=== 更新 Treesitter parser ==="
)

cmds=(
  "sudo pacman -Sy --noconfirm archlinux-keyring"
  "sudo pacman -Syu --noconfirm"
  "paru -Sua --noconfirm"
  "/home/tistath/.oh-my-zsh/tools/upgrade.sh"
  "ya pkg upgrade"
  "nvim --headless '+Lazy! sync' +qa"
  "nvim --headless '+Lazy build blink.cmp' +qa"
  "nvim --headless '+TSUpdate' +qa"
)

for i in "${!prompts[@]}"; do
  if ask "${prompts[$i]}"; then
    ${cmds[$i]}
  fi
done
