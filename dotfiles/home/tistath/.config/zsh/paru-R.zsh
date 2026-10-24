# paru模糊卸载
paru-R() {
        local pkgs
        pkgs=$(paru -Qq | fzf --multi --preview 'paru -Qi {1}' --preview-window 'right:50%:wrap')
        [[ -n "$pkgs" ]] || return
        paru -R ${(f)pkgs}
}
