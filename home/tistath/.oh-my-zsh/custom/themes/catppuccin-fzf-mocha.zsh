# fzf的catppuccin-mocha配色以及预览窗口设置
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4

--preview 'zsh -c \"source ~/.config/zsh/fzf-preview.zsh; fzf-preview {}\"'
"

# 搜索命令时无预览窗口
export FZF_CTRL_R_OPTS="--no-preview"
