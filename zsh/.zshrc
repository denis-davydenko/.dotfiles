# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export TERM_PROGRAM=iTerm.app
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles/zsh

# vim
export MYVIMRC="$HOME/.dotfiles/.vimrc"
export VIMINIT="source $MYVIMRC"

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
  osx
  sublime
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-nvm
  fzf
  fzf-tab
 )


source $ZSH/oh-my-zsh.sh

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# bat
alias cat="bat"
export BAT_THEME="Solarized (light)"

# exa
alias ls="exa"
alias lsa="exa -lahF"

# fzf
source ~/.dotfiles/zsh/fzf.sh

