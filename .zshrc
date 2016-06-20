# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="smt"
#smt
# andysmith-mac 福 ~/.oh-my-zsh/themes ➤ 3ea3384|master✓
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

DISABLE_AUTO_UPDATE=true
plugins=(git bundler andy tmux command-aliases work)

source $ZSH/oh-my-zsh.sh
#Below line is for powerline configuration
##########/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# User configuration

export PATH=":/Users/asmith/bin:/usr/local/bin:/usr/local/Cellar:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/sbin:/usr/local/opt/coreutils/libexec/gnubin"
export PATH=$PATH:"/Users/asmith/bin/gcc-arm-none-eabi-4_9-2014q4/bin"
#export MANPATH="/usr/local/opt/coreutils/libexec/gnuman"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

export EDITOR='vim'
export GRADLE_OPTS="-XX:MaxPermSize=1G -XX:PermSize=1G"                         
export JAVA_TOOL_OPTIONS="-XX:MaxPermSize=1G -XX:PermSize=1G"
autoload -U zmv
alias zcp='zmu -C'
alias to='todo.sh'
alias tol='todo.sh list'
alias toa='todo.sh add'
alias zln='zmv -L'
alias -s html=vim
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#source "$HOME/.antigen/antigen.zsh"


#antigen-apply

# Added by Dato Launcher v2.1.1
export PATH="/Users/asmith/anaconda/bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
