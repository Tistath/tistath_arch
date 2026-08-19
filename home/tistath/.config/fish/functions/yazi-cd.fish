function yazi-cd
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    set cwd (cat "$tmp")
    if test -n "$cwd"; and test "$cwd" != "$PWD"; and test -d "$cwd"
        cd "$cwd"
    end
    rm -f "$tmp"
end
# 让使用yazi-cd命令打开yazi时，关闭后自动cd最后的目录
