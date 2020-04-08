#!/bin/bash

set -e
[ -z $(which brew) ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

[ -z $(which zsh) ] && brew install zsh

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

brew tap homebrew/bundle

brew bundle --file=homebrew/Brewfile

brew link node
brew install yarn

exit 0