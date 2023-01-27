
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  zsh-autosuggestions
  F-Sy-H
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
 
# Enable iTerm2 shell integration (can be enabled via iTerm2 context menu)
source ~/.iterm2_shell_integration.zsh
# pnpm
export PNPM_HOME="/Users/pssandhu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# RSS AWS login
function aws-login() {
  if [ $# -gt 0 ]; then
    aws-adfs login --adfs-ca-bundle ~/.aws/sectigo.cer  $@
  else
    aws-adfs login --profile default --adfs-ca-bundle ~/.aws/sectigo.cer && aws-adfs login --profile cross-account --adfs-ca-bundle ~/.aws/sectigo.cer
  fi
}

#ZPLUG stuff
export ZPLUG_HOME=/opt/homebrew/opt/zplug

#Custom aliases
alias p='pnpm'
alias n='nvim'
alias nvimConfig="nvim ~/.config/nvim/"
alias gr='git pull --rebase'
alias gp='git push'
alias gs='git status'

export PATH="$PATH:$HOME/.local/bin"
