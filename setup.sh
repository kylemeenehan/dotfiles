#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo $DIR

declare -A links=(
  ["vim/ftplugin"]="$HOME/.vim/ftplugin"
  [""]="$HOME/."
  [""]="$HOME/."
  [""]="$HOME/."
  [""]="$HOME/."
  [""]="$HOME/."
  [""]="$HOME/."
)

for link in "${!links[@]}"; do
  # echo "linking $DIR/$link  ${links[$link]}";
  echo $DIR/$link ${links[$link]}
  unlink ${links[$link]}
  ln -s $DIR/$link ${links[$link]}
done

# ln -s $DIR/vim/ftplugin $HOME/.vim/ftplugin
