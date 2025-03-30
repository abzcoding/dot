if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi
source ~/.env
eval "$(/opt/homebrew/bin/brew shellenv)"
export GOPATH=$HOME/dev
export PATH=$PATH:$HOME/.alire/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export MANPAGER='nvim +Man!'
export EDITOR=nvim
HISTFILE=~/.zsh_history
HISTSIZE=30000
CASE_SENSITIVE="true"
SAVEHIST=$HISTSIZE
HISTDUP=erase
export NVM_DIR=~/.nvm
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

if [[ -z $WEZTERM_CONFIG_FILE ]]; then
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
else
  export SPACESHIP_DOCKER_SHOW=false
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export GPG_TTY=$(tty)
  setopt HIST_IGNORE_SPACE
  setopt SHARE_HISTORY
  eval "$(starship init zsh)"
  bindkey '^R' history-incremental-search-backward
  autoload -U up-line-or-beginning-search
  autoload -U down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "^[[A" up-line-or-beginning-search # Up
  bindkey "^[[B" down-line-or-beginning-search # Down
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  autoload -Uz compinit
  compinit
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
  export CC=clang
  export CXX=clang++
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

  PATH="/Users/abz/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="/Users/abz/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="/Users/abz/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"/Users/abz/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/abz/perl5"; export PERL_MM_OPT;
  eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
  ___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
fi

source ~/.aliasses
eval "$(zoxide init zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source $(brew --prefix nvm)/nvm.sh
