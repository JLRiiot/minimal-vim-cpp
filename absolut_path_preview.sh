#!/usr/bin/env bash

FILENAME=$(echo "$1" | cut -f 2 | gsed -r 's/\.\./\./g')
LINE=$(echo "$1" | cut -f 5 | gsed -r 's/line://g')
PREV_COMMAND=$FZF_PREVIEW_COMMAND
FZF_PREVIEW_COMMAND="cat {}"
export FZF_PREVIEW_COMMAND
"$HOME/.vim/plugged/fzf.vim/bin/preview.sh" "$FILENAME":"$LINE"
FZF_PREVIEW_COMMAND=$PREV_COMMAND
export FZF_PREVIEW_COMMAND
