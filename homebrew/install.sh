#!/bin/bash 

set -e

[ -z $(which brew) ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

[ -z $(which zsh) ] && brew install zsh

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew tap homebrew/cask-fonts
brew tap homebrew/bundle

brew bundle --file=homebrew/Brewfile

brew link node
brew install yarn

exit 0
