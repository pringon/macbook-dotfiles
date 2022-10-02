
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Set default editor
export EDITOR=vim
export VISUAL=vim
set -o vi

__git_ps1() { : ; }
PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u@\h \[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias dot='/usr/bin/git --git-dir=${HOME}/dotfiles/ --work-tree=${HOME} '
# use this as a proxy template proxies 
# alias extern='http_proxy= https_proxy= '
# alias unproxied='http_proxy= https_proxy= '
alias vim='nvim'
alias python='python3.9'
alias pip='pip3.9'
alias python3='python3.9'
alias pip3='pip3.9'
alias ~='cd ~'

function show() {
  local location=$1
  local depth=$2

  case "$location" in
    "servers")
      tree ~/dev -d -L 1
      ;;
    "orgs")
      tree ~/dev -d -L 2
      ;;
    "repos")
      tree ~/dev -d -L 3
      ;;
    *)
      tree ~/dev/"$location" -d -L ${depth:-1}
      ;;
  esac
}
function to() {
  local vcs
  local repo
  if [ -z "$2" ]; then
    vcs="gh"
    repo=$1
  else
    vcs=$1
    repo=$2
  fi

  if [ "$vcs" == "scratch" ]; then
    mkdir -p ~/dev/scratch/${repo}
    cd ~/dev/scratch/${repo}
  else
    cd ~/dev/${vcs}/${repo}
    if [ "$?" -ne 0 ]; then
      clone ${vcs} ${repo}
      cd ~/dev/${vcs}/${repo}
    fi
  fi
  
}
function clone() {
  local vcs
  local repo
  if [ -z "$2" ]; then
    vcs="gh"
    repo=$1
  else
    vcs=$1
    repo=$2
  fi

  case ${vcs} in
    "gh")
      git clone git@github.com:pringon/macbook-dotfiles.git ~/dev/gh/${repo}
      ;;
    *)
      echo "Error: unknown vcs ${vcs}"
      ;;
  esac
}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Go
export PATH="/home/dgoje/go/bin:${PATH}"
export GOPATH="/home/dgoje/go/"
export CGO_ENABLED=0
export GOPRIVATE="*.dev.bloomberg.com"
export GOPROXY="https://goproxy.dev.bloomberg.com,direct"

#. ~/.git-prompt.sh
eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(fnm env --use-on-cd)"
