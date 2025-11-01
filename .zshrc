# 環境変数
export EDITOR=nvim
setopt no_beep
autoload -U compinit && compinit -C  # `compinit` のキャッシュを使用して高速化

# `oh-my-zsh` の読み込み
export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="miloshadzic"
source $ZSH/oh-my-zsh.sh

# コマンド補完の設定
setopt correct       # コマンドミスを修正
zstyle ':completion:*' menu select  # 補完候補の選択を楽に
setopt list_packed   # 補完候補を詰めて表示
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字区別なし
setopt magic_equal_subst  # `--prefix=/usr` の `=` 以降も補完

# エイリアス
alias vim='nvim'
alias d='docker'
alias dc='docker-compose'
alias c='clear'
alias e='exit'
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

# Git
alias ga='git add -A'
alias g.='git add .'
alias gm='git commit -m '
alias gs='git status'
alias gc='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gpo='git push origin'

# Rails
alias be='bundle exec'
alias bi='bundle install'
alias rs='rails s'
alias rc='rails console'
alias rg='rails g'
alias rgm='rails g model'
alias rgc='rails g controller'
alias rd:='rails db:'
alias rdm='rails db:migrate'
alias rds='rails db:seed'
alias rr='rails routes'

# Tmux IDE
alias ide='source ~/.tmux_ide.sh'
alias idec='source ~/.tmux_ide_code.sh'

# g++ 自動実行
function runcpp () { g++ -O2 $1; ./a.out }
alias -s {c,cpp}=runcpp

# 環境変数の設定
export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/mysql@5.7/bin:$HOME/.symfony/bin:$PATH"

# direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# `rbenv`, `pyenv`, `nodebrew`, `brew` の同期実行
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.nodebrew" ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
