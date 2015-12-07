# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [[ -r ~/git-prompt.sh ]]
then
    source ~/git-prompt.sh
fi

declare -a files=(.bash_options .bash_export .bash_aliases .bash_prompt .bash_functions .bash_projects)
for item in ${files[*]}
do
    if [[ -f ~/$item ]]
    then
        source ~/$item
    fi
done

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

export NODE_ENV='development'
export NVM_DIR="$HOME/.nvm"

[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"  # This loads nvm

