#!/bin/bash

echo "keyRepeat settings"
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1

echo "install xcode-select"
xcode-select -v >/dev/null 2>&1 || xcode-select --install

echo "install homebrew"
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update --verbose

echo "run homebrew bundle"
brew bundle -v --file=Brewfile

echo "all done."
