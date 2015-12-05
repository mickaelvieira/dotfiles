#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail
# set -x

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

create_symlink() {

    local target="$1"
    local symlink="$2"

    if [[ ! -f "${target}" ]]; then
        error "Target ${target} is not a file"
        exit 1
    fi

    if [[ ! -h "${symlink}" ]]; then
        info "Creating symlink ${symlink}"
        ln -s "${target}" "${symlink}"
    fi
}

if [[ ! -d "${home_dir}/.config/terminator/config" ]]; then
    mkdir -p "${home_dir}/.config/terminator/config"
fi

create_symlink "${df_dir}/bash/.bash_aliases" "${home_dir}/.bash_aliases"
create_symlink "${df_dir}/bash/.bash_functions" "${home_dir}/.bash_functions"
create_symlink "${df_dir}/git/.gitconfig" "${home_dir}/.gitconfig"
create_symlink "${df_dir}/git/.gitignore" "${home_dir}/.gitignore"
create_symlink "${df_dir}/git/.gitattributes" "${home_dir}/.gitattributes"
create_symlink "${df_dir}/vim/.vimrc" "${home_dir}/.vimrc"
create_symlink "${df_dir}/mysql/.my.cnf" "${home_dir}/.my.cnf"
create_symlink "${df_dir}/grc/.grcat" "${home_dir}/.grcat"
create_symlink "${df_dir}/terminator/config" "${home_dir}/.config/terminator/config"

source ~/.bashrc

exit 0

