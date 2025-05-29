" Enable control backspace
inoremap <C-H> <C-W>



" Insert UTC date with f7
nnoremap <F7> :silent r !date -u +"\%Y-\%m-\%d \%H:\%M:\%S"<CR>


autocmd TextYankPost * call system('pbcopy', @")

syntax on
"set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set ignorecase
set hlsearch
set ruler
set noswapfile
set colorcolumn=80



nnoremap q: <Nop>


" Yank to system clipboard using pbcopy
"nnoremap <leader>y :call system('pbcopy', @")<CR>


"" Redefine yank to use pbcopy
"function! PbcopyYank(type, ...)
"  let l:save = @@
"  if a:type ==# 'char'
"    silent execute "normal! `[v`]y"
"  elseif a:type ==# 'line'
"    silent execute "normal! '[V']y"
"  else
"    silent execute "normal! `[v`]y"
"  endif
"  call system('pbcopy', @@)
"  let @@ = l:save
"endfunction
"
"nnoremap y :set operatorfunc=PbcopyYank<CR>g@
"vnoremap y :<C-u>call PbcopyYank(visualmode())<CR>
"
"

