" Autofill date with current datetime
nnoremap <silent> <leader>d :%s/^:date: \zs[YMDH0-9-: ]*\ze$/\=strftime("%Y-%m-%d %H:%M")/<CR>
let b:surround_{char2nr("-")} = "``\r``"
let b:surround_{char2nr("_")} = "`\r`_"
setlocal iskeyword=@,48-57,_,192-255
