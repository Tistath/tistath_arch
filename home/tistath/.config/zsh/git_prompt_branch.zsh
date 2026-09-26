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
