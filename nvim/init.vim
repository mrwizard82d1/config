version 6.0
syntax on
set autoindent
set backspace=indent,eol,start
set backup
set cc=+1,-4,-9
" set diffexpr=MyDiff()
set expandtab
set number
set smarttab
set helplang=En
set history=50
set hlsearch
set incsearch
set keymodel=startsel,stopsel
set ruler
set selection=exclusive
set selectmode=mouse,key
set whichwrap=b,s,<,>,[,]
" vim: set ft=vim :
" Windows only: set shell=D:/cygwin/bin/bash.exe
set shellslash
set tabstop=4
set shiftwidth=4
set textwidth=72
filetype plugin indent on
" set guifont=Consolas:h10:cANSI

" Solarized dark
syntax enable
set background=dark
" colorscheme solarized
" colorscheme vividchalk

" Load pathogen
" execute pathogen#infect()

" Matlab
"
" Syntax
source $VIMRUNTIME/macros/matchit.vim

" Use mlint
autocmd BufEnter *.m    compiler mlint

" comments
autocmd FileType matlab setlocal commentstring=%\ %s

