#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo $DIR

declare homelinks=( "eslintrc.json"
  "agignore"
  "alacritty.yml"
  "gitconfig"
  "ideavimrc"
  "tmux.conf"
  "vimrc"
  "zshrc"
)

for link in "${homelinks[@]}"; do
  echo linking $DIR/$link to $HOME/.$link
  echo linking $DIR/$link to $HOME/.$link
  ln -sf "$DIR/$link" "$HOME/.$link"
  # unlink $HOME/.$link
done

ln -sf "$DIR/vim/ftplugin" "$HOME/.vim/ftplugin"
