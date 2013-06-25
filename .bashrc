[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
PS1='\u@\h:\w '
alias tmx="TERM=screen-256color-bce tmx"
alias scr="screen"
alias pj='ruby -rjson -rpp -e "pp JSON.parse(\$stdin.read)"'
alias ll='ls -al'
## git commands
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mvim'
alias gca='git commit -a -v'
alias gcvm='git commit -v -m'
alias gcm='git commit -m'
alias gcam='git commit -a -v -m'
alias gb='git branch'
alias gba='git branch -a'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gap="git add -p"

alias be='bundle exec'
alias bi='bundle install'
alias bers='bundle exec rails s'
alias bec='bundle exec rails c'
alias wipit='bundle exec rspec -t @wip'

export CC=gcc-4.2
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

PATH=$PATH:$HOME/.rvm/bin:/usr/local/share/npm/bin:/usr/local/share/python/:/usr/sbin:/usr/bin:/sbin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
