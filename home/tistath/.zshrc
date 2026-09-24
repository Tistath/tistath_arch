# Oh My Zsh 安装路径
export ZSH="$HOME/.oh-my-zsh"

# 补全时-和_不敏感
HYPHEN_INSENSITIVE="true"

# 启用命令自动纠错
ENABLE_CORRECTION="true"

# catppuccin-mocha语法高亮配色
source ~/.oh-my-zsh/custom/themes/catppuccin-mocha.zsh

# 启用的插件列表
plugins=(
  git                          # Git 别名与提示符支持
  zsh-autosuggestions          # 根据历史自动建议命令
  zsh-syntax-highlighting      # 命令语法高亮
  zsh-history-substring-search # 历史子串搜索（按上/下键循环匹配）
  fzf                          # 模糊搜索
  ohmyzsh-full-autoupdate      # 自动更新自定义插件
)

# 加载Oh My Zsh
source $ZSH/oh-my-zsh.sh

# fzf 集成
source <(fzf --zsh)

# man手册搜索路径
export MANPATH="/usr/local/man:$MANPATH"

# 默认语言环境
export LANG=en_US.UTF-8

# 默认编辑器
export EDITOR='nvim'

# 编译标志：根据当前架构设置
export ARCHFLAGS="-arch $(uname -m)"

# 禁用提示音
unsetopt beep

# 历史子串搜索结果去重
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Git分支与状态提示
git_prompt_branch() {
    # 不在 Git 仓库内则直接返回
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        return
    fi

    local branch status_symbol

    # 获取当前分支名
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # 判断工作区是否有改动
    if [[ -z $(git status --porcelain 2>/dev/null) ]]; then
        status_symbol="!"
    else
        status_symbol="="
    fi

    # 输出
    echo "%F{blue}${status_symbol}%f [%F{blue}${branch}%f]"
}

# 左侧提示符
PROMPT=$'\n %~'$'\n %F{blue}╰─>%f'

# 右侧提示符
RPROMPT='$(git_prompt_branch)'

# yazi退出时保留路径
function yazi-cd() {
    local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
    command rm -f -- "$tmp"
}
