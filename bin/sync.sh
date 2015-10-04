#!/bin/bash

set -o nounset # set -u
set -o errexit # set -e
set -o pipefail
set -x

declare -r RESET_ALL="\x1b[0m"
declare -r BG_RED="\x1b[41m"
declare -r BG_BLUE="\x1b[44m"
declare -r FG_WHITE="\x1b[97m"
declare -r FG_RED="\x1b[31m"
declare -r FG_BLUE="\x1b[34m"

error() {
    echo -e "${BG_RED}${FG_WHITE}ERROR${RESET_ALL}  ${FG_RED}$1${RESET_ALL}" >&2
}
info() {
    echo -e "${BG_BLUE}${FG_WHITE}INFO${RESET_ALL}  ${FG_BLUE}$1${RESET_ALL}"
}

declare -r home_dir=${HOME:-}
declare -r repo_dir=${DEV_DIR:-}

if [[ -z "${repo_dir}" ]]; then
    error "Repository directory cannot be an empty string"
    exit 1
fi
if [[ -z "${home_dir}" ]]; then
    error "HOME directory cannot be an empty string"
    exit 1
fi

declare -r df_dir="${repo_dir}/dotfiles"

info "Creating bash symlink"

rm -f "${home_dir}/.bash_aliases"
ln -s "${df_dir}/bash/.bash_aliases" "${home_dir}/.bash_aliases"

rm -f "${home_dir}/.bash_functions"
ln -s "${df_dir}/bash/.bash_functions" "${home_dir}/.bash_functions"

info "Creating git symlinks"

rm -f "${home_dir}/.gitconfig"
ln -s "${df_dir}/git/.gitconfig" "${home_dir}/.gitconfig"

rm -f "${home_dir}/.gitignore"
ln -s "${df_dir}/git/.gitignore" "${home_dir}/.gitignore"

rm -f "${home_dir}/.gitattributes"
ln -s "${df_dir}/git/.gitattributes" "${home_dir}/.gitattributes"

info "Creating vim symlinks"

rm -f "${home_dir}/.vimrc"
ln -s "${df_dir}/vim/.vimrc" "${home_dir}/.vimrc"

source ~/.bashrc

exit 0

