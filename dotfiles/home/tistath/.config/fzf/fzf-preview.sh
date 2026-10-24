#!/usr/bin/env bash

# 展开
printf '%s\n\n' "$1"

# 目录
if   [[ -d $1 ]]; then
        eza -TL 1 --color always --icons --group-directories-first -- "$1"

# 文件
elif [[ -e $1 ]]; then

        case "$(file -bLi -- "$1")" in

                # 图片
                *image*)
                        kitten icat --clear --transfer-mode=memory --stdin=no --unicode-placeholder --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" -- "$1"
                ;;

                 # 二进制
                *binary*)
	                file -b "$1"
                ;;

                # 文本
                *)
                        bat --style numbers --line-range ":64" -- "$1"
                ;;
        esac
fi
