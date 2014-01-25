alias be='bundle exec'
alias bec='bundle exec rails c'
alias ber='bundle exec rspec'
alias bers='bundle exec rails s'
alias bi='bundle install'
alias gap='git add -p'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gc='git commit'
alias gca='git commit -a -v'
alias gcam='git commit -a -v -m'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcm='git commit -em'
alias gcvm='git commit -v -m'
alias gd='git diff | mvim'
alias gl='git pull'
alias gp='git push'
alias gr='git remote update origin'
alias gst='git status'
alias ll='ls -al'
alias pj='ruby -rjson -rpp -e "pp JSON.parse(\$stdin.read)"'
alias scr='screen'
alias tekkit='export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home && java -jar ~/TechnicLauncher.jar'
alias tmx='TERM=screen-256color-bce tmx'
alias wipit='bundle exec rspec -t @wip'

export CC=gcc-4.2

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
source /usr/local/opt/chruby/share/chruby/chruby.sh
