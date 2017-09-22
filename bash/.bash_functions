#!/bin/bash

#`mkd` and `tre` were stolen from: https://github.com/mathiasbynens/dotfiles/blob/master/.functions

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_" || return;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|node_modules|bower_components|vendor' --dirsfirst "$@" | less -FRNX;
}

# Install python packages globally
gpip() {
    PIP_REQUIRE_VIRTUALENV="" sudo pip "$@"
}

# Add colors to man pages
man() {
    env \
    LESS_TERMCAP_mb=$'\x1b[01;31m' \
    LESS_TERMCAP_md=$'\x1b[01;31m' \
    LESS_TERMCAP_me=$'\x1b[0m' \
    LESS_TERMCAP_se=$'\x1b[0m' \
    LESS_TERMCAP_so=$'\x1b[01;44;33m' \
    LESS_TERMCAP_ue=$'\x1b[0m' \
    LESS_TERMCAP_us=$'\x1b[01;32m' \
    man "$@"
}

# Swap 2 filenames around, if they exist (from Uzi's bashrc).
function swap() {
    local TMPFILE=tmp.$$

    [[ $# -ne 2 ]] && echo "swap: 2 arguments needed" && return 1
    [[ ! -e "$1" ]] && echo "swap: $1 does not exist" && return 1
    [[ ! -e "$2" ]] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Handy Extract Program
function extract() {
    if [[ -f "$1" ]] ; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"     ;;
            *.tar.gz)    tar xvzf "$1"     ;;
            *.bz2)       bunzip2 "$1"      ;;
            *.rar)       unrar x "$1"      ;;
            *.gz)        gunzip "$1"       ;;
            *.tar)       tar xvf "$1"      ;;
            *.tbz2)      tar xvjf "$1"     ;;
            *.tgz)       tar xvzf "$1"     ;;
            *.zip)       unzip "$1"        ;;
            *.Z)         uncompress "$1"   ;;
            *.7z)        7z x "$1"         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() {
    tar cvzf "${1%%/}.tar.gz" "${1%%/}/";
}

# Create a ZIP archive of a file or folder.
function makezip() {
    zip -r "${1%%/}.zip" "$1" ;
}

# Get current host related info.
function ii() {
    echo -e "\nYou are logged on \x1b[31m${HOST}"
    echo -e "\n\x1b[31mAdditionnal information:\x1b[0m " ; uname -a
    echo -e "\n\x1b[31mUsers logged on:\x1b[0m " ; w -h | cut -d " " -f1 | sort | uniq
    echo -e "\n\x1b[31mCurrent date:\x1b[0m " ; date
    echo -e "\n\x1b[31mMachine stats:\x1b[0m " ; uptime
    # echo -e "\n\x1b[31mMemory stats:\x1b[0m " ; free
    # echo -e "\n\x1b[31mDiskspace:\x1b[0m " ; mydf / "${HOME:-}"
    # echo -e "\n\x1b[31mLocal IP Address:\x1b[0m" ; my_ip
    # echo -e "\n\x1b[31mOpen connections:\x1b[0m "; netstat -pan --inet;
    echo
}
