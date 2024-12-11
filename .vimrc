set nocompatible
syntax on
set number
set relativenumber
set modelines=0
set ruler
set visualbell
set encoding=utf-8
set cursorline

set wrap

filetype indent on
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

set wildignore+=.pyc,.swp
set scrolloff=3
set backspace=indent,eol,start

set laststatus=2

set showmode
set showcmd

set hlsearch
set incsearch

set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme desert

set colorcolumn=121

" nuisance typos
map q: <Nop>
command Q q
nnoremap Q <nop>
