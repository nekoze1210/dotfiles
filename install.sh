#!/bin/sh

DOTPATH=~/.dotfiles
dotfiles=".??*"
for f in $dotfiles; do
  if [ -f "$f"=".git" ]
  then
    continue
  fi

  ln -snfv "$DOTPATH"/"$f" "$HOME"/"$f"
done

