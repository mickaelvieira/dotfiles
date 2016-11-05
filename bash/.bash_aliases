#!/bin/bash

if [[ -x /usr/bin/dircolors ]];
then

    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

alias ll='ls -la'
alias la='ls -hla'
alias lt='ls -tla'

alias rpwd='pwd -P'
alias dev="cd ~/dev"
alias doc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias hst="history | less -RSFXin"
alias storm='~/PhpStorm/bin/phpstorm.sh'
alias wth='curl -4 http://wttr.in/London'

