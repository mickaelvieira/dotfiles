#!/bin/bash

# OPAM configuration
if [[ -s "$HOME/.opam/opam-init/init.sh" ]]; then
  source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
fi

# Ruby Version Manager
# Stupid rvm MUST be last
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"      # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
