#!/bin/bash

DOTPATH="$HOME/.dotfiles"

# Link dotfiles directly under the home directory
dotfiles="$DOTPATH/.??*"
for f in $dotfiles; do
  fname=$(basename "$f")

  case "$fname" in
    ".git" | ".gitignore" | ".gitconfig.local.template" | ".require_oh-my-zsh" | ".gitmodules" | ".DS_Store" | ".config" | ".zsh_history" | ".node_repl_history")
      continue
      ;;
  esac

  ln -snfv "$f" "$HOME/$fname"
done

# Link .config directory to $HOME/.config
CONFIG_PATH="$DOTPATH/.config"
if [ -d "$CONFIG_PATH" ]; then
  mkdir -p "$HOME/.config"
  shopt -s dotglob
  for item in "$CONFIG_PATH"/*; do
    basename_item=$(basename "$item")
    target="$HOME/.config/$basename_item"

    # Remove the target if it already exists
    if [ -e "$target" ] || [ -L "$target" ]; then
      rm -rf "$target"
    fi

    ln -snfv "$item" "$target"
  done
fi
