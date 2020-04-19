#!/usr/bin/env bash
#echo "$1" >> output.txt

FILENAME=$(echo "$1" | cut -f 2 | gsed -r 's/\.\./\./g')
#echo "$FILENAME"
LINE=$(echo "$1" | cut -f 5 | gsed -r 's/line://g')
#echo "$LINE"
PREV_COMMAND=$FZF_PREVIEW_COMMAND
#FZF_PREVIEW_COMMAND="bat {}"
export FZF_PREVIEW_COMMAND

#echo "File name:  $FILENAME" >> output.txt
#echo "Line number:    $LINE" >> output.txt

/Users/administrador/.vim/plugged/fzf.vim/bin/preview.sh "$FILENAME":"$LINE"
FZF_PREVIEW_COMMAND=$PREV_COMMAND
export FZF_PREVIEW_COMMAND
