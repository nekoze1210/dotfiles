#!/bin/bash

echo "keyRepeat settings"
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1

echo "install xcode-select"
xcode-select -v >/dev/null 2>&1 || xcode-select --install

echo "install homebrew"
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "run brew doctor "
which brew >/dev/null 2>&1 && brew doctor
echo "run brew update --verbose"
which brew >/dev/null 2>&1 && brew update --verbose

echo "run homebrew bundle"
brew bundle -v --file=Brewfile --no-lock

echo "install vundle"
[ -d ~/.dotfiles/.vim/bundle/Vundle.vim ]  || git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/.vim/bundle/Vundle.vim

echo "import Karabiner-Elements Settings"
brew info karabiner-elements >/dev/null 2>&1 && cp "$(pwd)/karabiner/config.json" ~/.config/karabiner/karabiner.json

echo "download iterm2 color presets"
curl -o ~/Downloads/iTerm2Color/Hardcore.itermcolors  https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Hardcore.itermcolors --create-dirs
echo "downloaded iterm2 color presets at ~/Downloads/iTerm2Color/"
echo "[notice] You can change color presets by clicking import at Preferences > profiles > colors."

echo "all done."
