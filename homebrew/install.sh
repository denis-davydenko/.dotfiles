#!/bin/bash 

# Enable verbose output and exit on error
set -ex

[ -z "$(which brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Immediately configure PATH for this session
if [ -z "$(which brew)" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[ -z "$(which zsh)" ] && brew install zsh

# Make sure we're using the latest Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae
echo "Upgrading installed formulae..."
brew upgrade

echo "Running brew bundle..."
brew bundle --file=homebrew/Brewfile --verbose

echo "Linking node..."
brew link node

echo "Script completed successfully!"

exit 0