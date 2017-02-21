
call plug#begin('~/.vim/plugged')

" Plugin
Plug 'whatyouhide/vim-gotham'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/unite.vim'
Plug 'suan/vim-instant-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/StanAngeloff/php.vim'
Plug 'bling/vim-bufferline'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

call plug#end()

" Switch syntax highlighting on
syntax on
syntax enable
set t_Co=256

" color dracula
" colorscheme dracula
colorscheme gotham256

let g:airline_powerline_fonts = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 0
let g:javascript_plugin_flow = 0

" Enable file type detection and do language-dependent indenting.
filetype plugin on              " load filetype-specific plugins
filetype indent on              " load filetype-specific indent files

set nocompatible

set history=1000                " By default Vim saves your last 8 commands.
set encoding=utf-8 nobomb       " Use UTF-8 without BOM
set backspace=indent,eol,start  " Allow backspace in insert mode

set autowrite                   " Automatically save before commands like :next and :make
set autoread                    " Reload files changed outside vim
set hidden                      " Hide buffers when they are abandoned
set noswapfile                  " Disable use of swap files
" Mouse
set mouse=a                     " Enable mouse usage (all modes)

" Cursor
set ruler                       " Show the cursor position

" UI Config
set showmode                    " Show the current mode
set title                       " Show the filename in the window titlebar
set number                      " Show line number
set showmatch                   " Show matching brackets.
set wildmenu                    " visual autocomplete for command menu
set showcmd                     " Show the (partial) command as it’s being typed
set cursorline                  " Highlight current line
set laststatus=2                " Always show status line

" Search
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
set hlsearch                    " Hightlight search by default

" Spaces & Tabs
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set nowrap                     " Don't wrap lines

autocmd BufWritePre * :%s/\s\+$//e

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Rust racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_javascript_checkers = ["eslint"]

let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
let g:syntastic_php_phpmd_post_args='cleancode,codesize,design,unusedcode'

let g:syntastic_python_checkers=['python', 'flake8']

