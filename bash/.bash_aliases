#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

# some more ls aliases
alias ll='ls -la'
alias la='ls -hla'
alias lt='ls -tla'

alias rpwd='pwd -P'
alias dev="cd ~/Development"
alias doc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias hst="history | less -RSFXin"
alias storm='pstorm'
alias wth='curl -4 http://wttr.in/London'

