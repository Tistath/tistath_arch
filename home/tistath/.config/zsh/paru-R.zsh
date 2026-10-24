# paru模糊卸载
paru-R() {
        local pkgs
        pkgs=$(paru -Qq | fzf --multi --preview 'paru -Qi {1}' --preview-window 'right:60%:wrap')
        [[ -n "$pkgs" ]] && echo "$pkgs" | xargs -r paru -Rns
}
