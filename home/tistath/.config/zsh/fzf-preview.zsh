# fzf预览窗口

fzf-preview() {

        if [[ $# -ne 1 ]]; then
                echo "usage: fzf-preview FILENAME[:LINENO][:IGNORED]" >&2
                return 1
        fi

        local file=${1/#\~\//$HOME/}
        local center=0

        if [[ ! -r $file ]]; then
                if [[ $file =~ ^(.+):([0-9]+)\ *$ ]] && [[ -r $match[1] ]]; then
                        file=$match[1]
                        center=$match[2]
                elif [[ $file =~ ^(.+):([0-9]+):[0-9]+\ *$ ]] && [[ -r $match[1] ]]; then
                        file=$match[1]
                        center=$match[2]
                fi
        fi

        local type=$(file --brief --dereference --mime -- "$file")

        if [[ ! $type =~ image/ ]]; then
                if [[ $type == *=binary* ]]; then
                        file "$1"
                        return
                fi

                local batname
                if command -v batcat > /dev/null; then
                        batname="batcat"
                elif command -v bat > /dev/null; then
                        batname="bat"
                else
                        cat "$1"
                        return
                fi

                ${batname} --style="${BAT_STYLE:-numbers}" --color=always --highlight-line="${center:-0}" -- "$file"
                return
        fi

        local dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}

        if [[ $dim == x ]]; then
                dim=$(stty size < /dev/tty | awk '{print $2 "x" $1}')
        elif [[ ! $KITTY_WINDOW_ID ]] && ((FZF_PREVIEW_TOP + FZF_PREVIEW_LINES == $(stty size < /dev/tty | awk '{print $1}'))); then
                dim=${FZF_PREVIEW_COLUMNS}x$((FZF_PREVIEW_LINES - 1))
        fi

        if [[ $KITTY_WINDOW_ID ]] || [[ $GHOSTTY_RESOURCES_DIR ]] && command -v kitten > /dev/null; then
                kitten icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no --place="$dim@0x0" "$file" | sed '$d' | sed $'$s/$/\e[m/'
        elif command -v chafa > /dev/null; then
                chafa -s "$dim" "$file"
                echo
        elif command -v imgcat > /dev/null; then
                imgcat -W "${dim%%x*}" -H "${dim##*x}" "$file"
        else
                file "$file"
        fi
}
