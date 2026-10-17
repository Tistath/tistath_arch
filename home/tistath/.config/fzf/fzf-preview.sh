#!/usr/bin/bash

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME[:LINENO]"
  exit 1
fi

file=${1/#\~\//$HOME/}
line=0

# 解析
if [[ ! -r $file && $file =~ ^(.+):([0-9]+)(:[0-9]+)?$ ]] && [[ -r ${BASH_REMATCH[1]} ]]; then
  file=${BASH_REMATCH[1]}
  line=${BASH_REMATCH[2]}
fi

type=$(file --brief --mime -- "$file")

# 图片
if [[ $type =~ ^image/ ]]; then
  if [[ $KITTY_WINDOW_ID ]] && command -v kitten >/dev/null; then
    dim="${FZF_PREVIEW_COLUMNS:-80}x${FZF_PREVIEW_LINES:-24}"
    kitten icat --clear --transfer-mode=memory --unicode-placeholder \
      --stdin=no --place="$dim@0x0" "$file" | sed '$d' | sed $'$s/$/\e[m/'
  else
    file "$file"
  fi
  exit
fi

# 二进制
if [[ $type =~ =binary ]]; then
  file "$file"
  exit
fi

# 文本
bat --style="${BAT_STYLE:-numbers}" --color=always --pager=never \
  --highlight-line="${line:-0}" --line-range=":500" -- "$file"
