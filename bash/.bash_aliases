#!/bin/bash

if [[ -x /usr/bin/dircolors ]];
then
    if test -r "$HOME/.dircolors"; then
        eval "$(dircolors -b "$HOME/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

if [[ -x /usr/bin/bat ]];
then
    alias cat='bat'
fi

if [[ -x /usr/bin/bandwhich ]];
then
    alias bandwhich='sudo bandwhich'
fi

alias open='xdg-open'

alias ll='ls -la'
alias la='ls -hla'
alias ld='ls -hdla'
alias lt='ls -tla'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

alias pwd='pwd -P'
alias dev='cd ~/dev'
alias doc='cd ~/Documents'
alias dl='cd ~/Downloads'
alias h='history | less -RSFXin'
alias wth='curl -4 http://wttr.in/Lyon'
alias shellcheck='shellcheck -x -e SC1090,SC1091,SC2155'

alias jb='jobs -l'
alias ..='cd ..'
alias bk='cd -'

if [[ $(uname -s) = Linux ]]; then
    alias storm='~/PhpStorm/bin/phpstorm.sh'
fi

alias du='du -sh'
alias df='df -kTh'
alias docker='sudo docker'
alias firewall='sudo iptables -nvL --line-numbers'
