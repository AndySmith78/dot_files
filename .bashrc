[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
alias tmx="TERM=screen-256color-bce tmx"
alias scr="screen"
alias pj='ruby -rjson -rpp -e "pp JSON.parse(\$stdin.read)"'
alias ll='ls -al'
## git commands
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mvim'
alias gc='git commit'
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
alias ber='bundle exec rspec'
alias bec='bundle exec rails c'
alias wipit='bundle exec rspec -t @wip'

export CC=gcc-4.2
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

prompt() {
  local WHITE="\[\033[1;37m\]"
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local GRAY="\[\033[0;37m\]"
  local BLUE="\[\033[0;34m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local YELLOW="\[\033[1;33m\]"
  local branch
  if [ -d .git ] ; then
    branch=$(git branch | awk '/^\*/ { print $2 }')
  else
    unset branch
  fi
  PS1="${YELLOW}\d \@ ${GREEN}\u@\h ${branch:+$LIGHT_BLUE$branch }${CYAN}\w${GRAY}
$ "
}
PROMPT_COMMAND=prompt
PATH=$PATH:$HOME/.rvm/bin:/usr/local/share/npm/bin:/usr/local/share/python/:/usr/sbin:/usr/bin:/sbin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
