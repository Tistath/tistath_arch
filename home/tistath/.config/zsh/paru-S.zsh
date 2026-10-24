# paru模糊安装
paru-S() {
        local pkgs
        pkgs=$({ pacman -Slq | sed 's/^/repo /'; paru -Slq aur | sed 's/^/aur /'; } | fzf --multi --with-nth=2 --preview 'paru -Si {2}' --preview-window 'right:60%:wrap' | awk '{print $2}')
        [[ -n "$pkgs" ]] && echo "$pkgs" | xargs -r paru -S
}
