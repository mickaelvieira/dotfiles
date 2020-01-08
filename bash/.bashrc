#!/bin/bash

# http://tldp.org/LDP/abs/html/sample-bashrc.html

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [[ $(uname -s) = Linux ]]; then
  umask 077
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

# https://wiki.archlinux.org/index.php/Pkgfile
# https://wiki.archlinux.org/index.php/Bash#Command_not_found
if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]]; then
    . /usr/share/doc/pkgfile/command-not-found.bash
fi

# https://wiki.archlinux.org/index.php/Bash#Autojump
if [[ -f /usr/local/etc/profile.d/autojump.sh ]]; then
    . /usr/local/etc/profile.d/autojump.sh
elif [[ -f /etc/profile.d/autojump.bash ]]; then
    . /etc/profile.d/autojump.bash
fi

if [[ -s ~/builds/autojump-git/pkg/autojump-git/etc/profile.d/autojump.sh ]]; then
  . ~/builds/autojump-git/pkg/autojump-git/etc/profile.d/autojump.sh
fi

# Add git information to the prompt
if [[ -r ~/git-prompt.sh ]]; then
    source ~/git-prompt.sh
fi

# Google Cloud Platform
# The next line updates PATH for the Google Cloud SDK.
if [[ -f ~/dev/google-cloud-sdk/path.bash.inc ]]; then
  source ~/dev/google-cloud-sdk/path.bash.inc
fi

# The next line enables shell command completion for gcloud.
if [[ -f ~/dev/google-cloud-sdk/completion.bash.inc ]]; then
  source ~/dev/google-cloud-sdk/completion.bash.inc
fi

declare -a files=(
    .bash_prompt
    .bash_options
    .bash_export
    .bash_aliases
    .bash_functions
    .bash_projects
)

for item in ${files[*]}; do
    if [[ -f ~/$item ]]; then
        source ~/"$item"
    fi
done

export DEV_DIR="$HOME/dev"

[[ -f ~/.profile ]] && source ~/.profile
