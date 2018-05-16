" Vim filetype plugin file
" Language:	rst

if exists("b:did_ft_rst")
  finish
endif
let b:did_ft_rst = 1

setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap expandtab

" Autofill date with current datetime
nnoremap <silent> <leader>d :%s/^:date: \zs[YMDH0-9-: ]*\ze$/\=strftime("%Y-%m-%d %H:%M")/<CR>
let b:surround_{char2nr("-")} = "``\r``"
let b:surround_{char2nr("_")} = "`\r`_"
nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
nnoremap <buffer> <localleader>3 yypVr~:redraw<cr>
nnoremap <buffer> <localleader>4 yypVr`:redraw<cr>

setlocal comments=fb:.. commentstring=..\ %s expandtab
setlocal formatoptions+=tcroql
setlocal iskeyword=@,48-57,_,192-255
