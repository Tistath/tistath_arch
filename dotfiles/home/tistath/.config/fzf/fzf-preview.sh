#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME[:LINENO]"
  exit 1
fi

raw="$1"
file=${1/#\~\//$HOME/}
line=0

# 解析 file:line:col 或 file:line:content
if [[ ! -r $file && $file =~ ^(.+):([0-9]+): ]] && [[ -r ${BASH_REMATCH[1]} ]]; then
  file=${BASH_REMATCH[1]}
  line=${BASH_REMATCH[2]}
fi

# 目录
if [[ -d $file ]]; then
  printf '%s\n\n' "$file"
  eza --tree --level=2 --color=always --icons --group-directories-first "$file"
  exit 0
fi

# 非文件（历史命令、管道内容）
if [[ ! -e $file ]]; then
  printf '%s\n' "$raw" | bat --style="${BAT_STYLE:-plain}" --color=always --pager=never
  exit 0
fi

# 文件
printf '%s\n\n' "$file"

type=$(file --brief --dereference --mime -- "$file")

# 图片
if [[ $type =~ ^image/ ]]; then
  if [[ $KITTY_WINDOW_ID ]] && command -v kitten >/dev/null; then
    dim="${FZF_PREVIEW_COLUMNS:-80}x${FZF_PREVIEW_LINES:-24}"
    kitten icat --clear --transfer-mode=memory --unicode-placeholder \
      --stdin=no --place="$dim@0x0" "$file" | sed '$d' | sed $'$s/$/\e[m/'
  else
    file "$file"
  fi
  exit 0
fi

# 二进制
if [[ $type =~ =binary ]]; then
  file "$file"
  exit 0
fi

# 文本
  bat --style="${BAT_STYLE:-numbers}" --color=always --pager=never \
    --highlight-line="${line:-0}" --line-range=":512" -- "$file"
