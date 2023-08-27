if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

FZF_BASE="$HOME/.fzf"

plugins=(
  git
  zsh-autosuggestions
  F-Sy-H
  fzf
  zsh-z
  web-search
)

source $ZSH/oh-my-zsh.sh

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

#ZPLUG stuff
export ZPLUG_HOME=/opt/homebrew/opt/zplug

#Custom aliases
alias p='pnpm'
alias pv='pnpm verify'
alias n='nvim'
alias gr='git pull --rebase'
alias gp='git push'
alias gs='git status'

export PATH="$PATH:$HOME/.local/bin"
