# pacman模糊卸载
pacman-R() {
        local pkgs
        pkgs=$(pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' --preview-window 'right:60%:wrap')
        [[ -n "$pkgs" ]] || return
        sudo pacman -Rns ${(f)pkgs}
}
