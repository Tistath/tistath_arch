# pacman模糊安装
pacman-S() {
        local pkgs
        pkgs=$(pacman -Slq | fzf --multi --preview 'pacman -Si {1}' --preview-window 'right:60%:wrap')
        [[ -n "$pkgs" ]] && echo "$pkgs" | xargs -r sudo pacman -S
}
