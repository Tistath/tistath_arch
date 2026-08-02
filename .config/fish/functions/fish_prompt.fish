function fish_prompt
    set -l color (test $status = 0; and echo blue; or echo red)
    
    set_color $color
    echo -n '╭─('
    
    set_color -o white
    echo -n (prompt_pwd)
    
    set_color $color
    echo ')'
    echo -n '╰─>'
    
    set_color normal
end
