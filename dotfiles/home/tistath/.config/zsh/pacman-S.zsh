# pacman模糊安装
pacman-S() {
        local pkgs
        pkgs=$(pacman -Slq | fzf --multi --preview 'pacman -Si {1}' --preview-window 'right:50%:wrap')
        [[ -n "$pkgs" ]] || return
        sudo pacman -S ${(f)pkgs}
}
