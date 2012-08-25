set nocompatible

set expandtab
set smartindent

set softtabstop=2
set shiftwidth=2

set ignorecase

set visualbell
set ruler
set showcmd
set hlsearch
set incsearch
set scrolloff=2

syntax on
filetype indent plugin on

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
