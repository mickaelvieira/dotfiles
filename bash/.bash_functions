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
