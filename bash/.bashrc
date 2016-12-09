#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable programmable completion features
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

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

# Add git information to the prompt
if [[ -r ~/git-prompt.sh ]]; then
    source ~/git-prompt.sh
fi

declare -a files=(.bash_prompt .bash_options .bash_export .bash_aliases .bash_functions .bash_projects)
for item in ${files[*]}; do
    if [[ -f ~/$item ]]; then
        source ~/$item
    fi
done

export DEV_DIR="$HOME/dev"

# Stupid rvm MUST be here
[[ -f ~/.profile ]] && source ~/.profile
