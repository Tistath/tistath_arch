# pacman模糊卸载
pacman-R() {
        local pkgs
        pkgs=$(pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' --preview-window 'right:50%:wrap')
        [[ -n "$pkgs" ]] || return
        sudo pacman -R ${(f)pkgs}
}
