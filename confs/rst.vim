" Autofill date with current datetime
nnoremap <silent> <leader>d :%s/^:date: \zs[YMDH0-9-: ]*\ze$/\=strftime("%Y-%m-%d %H:%M")/<CR>
