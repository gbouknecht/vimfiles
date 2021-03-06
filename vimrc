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

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  normal! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
