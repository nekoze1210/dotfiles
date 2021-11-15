#!/bin/bash
brew bundle dump -f --no-lock --file ./Brewfile
echo "homebrew backup completed"

cp ~/.config/karabiner/karabiner.json ./karabiner/config.json
echo "Karabiner-Elements backup completed"
