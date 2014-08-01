runtime colors/badwolf.vim
let g:colors_name = "badwolf+"

" Fix Blue status line
hi  StatusLine   term=bold,reverse cterm=bold ctermfg=16 ctermbg=39 gui=bold guifg=#000000 guibg=#121212
hi  StatusLineNC term=reverse cterm=bold ctermfg=15 ctermbg=238 gui=bold guifg=#ffffff guibg=#121212

" Fix VerSplit equal to LineNr
"hi  VertSplit term=reverse ctermfg=245 ctermbg=233 guifg=#994f84 guibg=#141413

" Fix Line Number Background
hi  CursorLineNr term=bold ctermfg=11 gui=bold guifg=Yellow guibg=#141413

" Fix Error Background color
hi Error term=reverse cterm=bold ctermfg=15 ctermbg=196 gui=bold guifg=Red guibg=#141413
