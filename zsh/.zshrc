# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export TERM_PROGRAM=Warp.app
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Custom folder for zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh

# vim
export MYVIMRC="$HOME/.dotfiles/.vimrc"
export VIMINIT="source $MYVIMRC"

# Configure Homebrew PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

#spaceship-prompt
SPACESHIP_DOCKER_SHOW="false"
SPACESHIP_NODE_SHOW="false"
SPACESHIP_PACKAGE_SHOW="false"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  colorize
  dotenv
  git
  macos
  sublime
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-nvm
  fzf
  fzf-tab
 )

source $ZSH/oh-my-zsh.sh

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# bat
alias cat="bat"
export BAT_THEME="Solarized (light)"

# exa / eza
alias ls="eza"
alias lsa="eza -lahF"

# fzf
source ~/.dotfiles/zsh/fzf.sh

