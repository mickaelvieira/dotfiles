#!/bin/bash

# http://tldp.org/LDP/abs/html/sample-bashrc.html

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# if [[ $(uname -s) = Linux ]]; then
#   umask 077
# fi

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

# Add git information to the prompt
if [[ -f "$(git --exec-path)/git-sh-prompt" ]]; then
  source "$(git --exec-path)/git-sh-prompt"
elif [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
  # https://wiki.archlinux.org/title/git#Git_prompt
  source /usr/share/git/completion/git-prompt.sh
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

if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
  source /usr/share/fzf/key-bindings.bash
fi

if [[ -f /usr/share/fzf/completion.bash ]]; then
  source /usr/share/fzf/completion.bash
fi

declare -a files=(
  .bash_options
  .bash_export
  .bash_aliases
  .bash_functions
  .bash_prompt
  .bash_projects
)

for item in ${files[*]}; do
  if [[ -f ~/$item ]]; then
    source ~/"$item"
  fi
done

[[ -f ~/.profile ]] && source ~/.profile
