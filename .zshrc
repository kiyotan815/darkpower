export EDITOR=nvim
setopt no_beep

autoload -U compinit && compinit -u

export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="miloshadzic"
source $ZSH/oh-my-zsh.sh

plugins=(git zsh-completions)

# コマンドミスを修正
setopt correct

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完候補をできるだけ詰めて表示する
setopt list_packed

# 大文字・小文字を区別しない(大文字を入力した場合は区別する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# --prefix=/usr などの = 以降でも補完
setopt magic_equal_subst

alias vim='nvim'

alias d='docker'
alias dc='docker-compose'

alias c='clear'
alias e='exit'
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

alias ga='git add -A'
alias g.='git add .'
alias gm='git commit -m '
alias gs='git status'
alias gc='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gpo='git push origin'

# ruby
alias rb='ruby'

# rails
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

# tmux ide
alias ide='source ~/.tmux_ide.sh'

# direnv
type direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$HOME/.symfony/bin:$PATH

# g++ 自動実行
function runcpp () { g++ -O2 $1; ./a.out }
alias -s {c,cpp}=runcpp


# docker with wsl docker for windows share damon
#export DOCKER_HOST=tcp://localhost:2375
#alias docker="DOCKER_HOST=${DOCKER_HOST} docker"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# node brew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# eval `ssh-agent`
