if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

export GOPATH=$HOME/dev
export PATH=$PATH:$HOME/.alire/bin
export PATH=$PATH:$GOPATH/bin

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --branch main --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::brew
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
fpath=(/Users/abz/.docker/completions $fpath)

autoload -U compinit && compinit

zinit cdreplay -q

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
fi


bindkey '^R' history-incremental-search-backward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=30000
CASE_SENSITIVE="true"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always --group-directories-first --icons $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -1 --color=always --group-directories-first --icons $realpath'

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export MANPAGER='nvim +Man!'
export EDITOR=nvim
source ~/.aliasses
