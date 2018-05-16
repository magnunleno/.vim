runtime colors/badwolf.vim
let g:colors_name = "badwolf+"

" Fix Blue status line
hi  StatusLine   term=bold,reverse cterm=bold ctermfg=16 ctermbg=39 gui=bold guifg=#000000 guibg=#121212
hi  StatusLineNC term=reverse cterm=bold ctermfg=15 ctermbg=238 gui=bold guifg=#ffffff guibg=#121212

" Fix VerSplit equal to LineNr
hi  VertSplit term=reverse ctermfg=11 guibg=#191817 guifg=#2B2928

" Fix Line Number Background
hi  CursorLineNr term=bold ctermfg=11 gui=bold guifg=Yellow guibg=#191817
hi  LineNr ctermfg=11 guibg=#191817

" Fix Error Background color
hi Error term=reverse cterm=bold ctermfg=15 ctermbg=196 gui=bold guifg=Red guibg=#191817

" Make comments italic in GUI
hi Comment term=bold ctermfg=243 guifg=#857f78 gui=italic

" Signal Column
"hi  SignColumn guibg=#191817
