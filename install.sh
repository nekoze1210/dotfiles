#!/bin/bash

DOTPATH=~/.dotfiles
dotfiles=".??*"
for f in $dotfiles; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".gitconfig.local.template" ] && continue
  [ "$f" = ".require_oh-my-zsh" ] && continue
  [ "$f" = ".gitmodules" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  
  ln -snfv "$DOTPATH"/"$f" "$HOME"/"$f"
done
