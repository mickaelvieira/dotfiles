#!/bin/bash

# Create a new directory and move into it
mkd() {
  mkdir -p "$@" && cd "$_" || exit 1
}

cleanup() {
  find . -type d -name "node_modules" -prune -exec rm -r {} \;
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

# Serve static files with Python3 built-in HTTP server
serve() {
  python3 -m http.server
}

extract() {
  if [[ -f "$1" ]]; then
    case $1 in
    *.tar.bz2) tar xvjf "$1" ;;
    *.tar.gz) tar xvzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xvf "$1" ;;
    *.tbz2) tar xvjf "$1" ;;
    *.tgz) tar xvzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

ppath() {
  echo -e ${PATH//:/\\n}
}
