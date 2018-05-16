setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
setlocal autoindent
setlocal foldmethod=indent

" VIM Grep word under the cursor
if exists("g:ackprg")
	nnoremap <buffer><leader>g "ayiw:Ack --html "a"
else
	nnoremap <buffer><leader>g "ayiw:vimgrep "a" **/*.html
endif
