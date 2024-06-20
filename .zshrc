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
 
# pnpm
export PNPM_HOME="/Users/pssandhu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

#ZPLUG stuff
export ZPLUG_HOME=/opt/homebrew/opt/zplug

#Custom aliases
alias p='pnpm'
alias pv='pnpm verify'
alias n='nvim'
alias gp='git pull --rebase'
alias gP='git push'
alias gs='git status'
alias ls='exa'
alias rm='trash'
alias s='source ~/.zshrc'
alias lg='lazygit'
alias reboot='reboot --reboot --no-wall'
alias shutdown='shutdown -h now'

function take {
  mkdir -p $1
  cd $1
}

export PATH="$PATH:$HOME/.local/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/pssandhu/.ghcup/env" ] && . "/Users/pssandhu/.ghcup/env" # ghcup-env

export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
