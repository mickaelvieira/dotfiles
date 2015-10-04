
call plug#begin('~/.vim/plugged')

" # Plugin
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Shougo/unite.vim'

call plug#end()


" Use the Solarized Dark theme
" set background=dark
" colorscheme solarized
" let g:solarized_termtrans=1

" Switch syntax highlighting on
syntax on
syntax enable
set t_Co=256

" Enable file type detection and do language-dependent indenting.
" filetype plugin indent on

set nocompatible

set history=1000                " By default Vim saves your last 8 commands.
set encoding=utf-8 nobomb       " Use UTF-8 without BOM
set number                      " Show line number
set backspace=indent,eol,start  " Allow backspace in insert mode

set showcmd                     " Show (partial) command in status line.
set showmatch                   " Show matching brackets.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
set hlsearch                    " Hightlight search by default
set autowrite                   " Automatically save before commands like :next and :make
set autoread                    " Reload files changed outside vim
set hidden                      " Hide buffers when they are abandoned
set mouse=a                     " Enable mouse usage (all modes)
set ruler                       " Show the cursor position
set showmode                    " Show the current mode
set title                       " Show the filename in the window titlebar
set showcmd                     " Show the (partial) command as it’s being typed

" replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set nowrap                            " Don't wrap lines

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" set laststatus=2 " Always show status line

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_javascript_checkers = ["eslint"]

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'



