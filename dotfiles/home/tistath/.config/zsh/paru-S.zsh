# paru模糊安装
paru-S() {
        local pkgs
        pkgs=$({ pacman -Slq ; paru -Slq aur } | fzf --multi --preview 'paru -Si {1}' --preview-window 'right:50%:wrap')
        [[ -n "$pkgs" ]] || return
        paru -S ${(f)pkgs}
}
