#!/bin/bash
# Shared logging utility functions for Dotfiles scripts
# This module provides consistent logging output across all scripts

# Print text with yellow color
dotfiles::log::highlight() {
  echo -e "\\x1b[33m$1\\x1b[0m"
}

# Print info message with arrow prefix and yellow color
dotfiles::log::info() {
  echo -e "\\x1b[1;33m==>\\x1b[39m $1\\x1b[0m"
}

# Print fatal error message and exit with code 1
dotfiles::log::fatal() {
  echo -e "\\x1b[97m\\x1b[41m\\x21\\x1b[0m \\x1b[31m$1\\x1b[0m" 1>&2
  exit 1
}

# Print warning message with arrow prefix
dotfiles::log::warn() {
  echo -e "\\x1b[1;95m==>\\x1b[39m $1\\x1b[0m" 1>&2
}

# Print error message (without exiting)
dotfiles::log::error() {
  echo -e "\\x1b[97m\\x1b[41m\\x21\\x1b[0m \\x1b[31m$1\\x1b[0m" 1>&2
}

dotfiles::lib::is_installed() {
  command -v "$1" >/dev/null 2>&1 || dotfiles::log::fatal "'$1' (command not found)"
}
