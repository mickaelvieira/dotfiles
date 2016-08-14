# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add git information to the prompt
if [[ -r ~/git-prompt.sh ]]
then
    source ~/git-prompt.sh
fi

# Add colors to man pages
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

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
export DEV_DIR="$HOME/Development"

[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"  # This loads nvm

