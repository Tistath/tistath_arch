function fish_prompt
    set_color blue
    echo -n '╭─('
    
    set_color -o white
    echo -n (prompt_pwd)
    
    set_color blue
    echo ')'
    echo -n '╰─>'
    
    set_color normal
end
