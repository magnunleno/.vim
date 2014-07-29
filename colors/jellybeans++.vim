runtime colors/jellybeans.vim
let g:colors_name = "jellybeans++"

hi  VertSplit    guibg=#888888
hi  StatusLine   guibg=#cccccc guifg=#000000
hi  StatusLineNC guibg=#888888 guifg=#000000

" My tweaks... {{{
" Fix vertsplit light color in GVIM
hi  VertSplit 	 guibg=#121212

" Set Line Number backgroup just like VertSplit
hi  LineNr 	 guibg=#121212

" Set Sign Column to the same color of LineNr
hi  SignColumn   guibg=#121212

" Better Error
hi Error guibg=#121212 guifg=Red

" Fix ColorColumn definition in GVIM
hi  ColorColumn  guibg=#171717

" Fix folded light color in GVIM
hi  Folded 	 guibg=#1f1f1f

" Remove underline from SpellBad
hi  SpellBad     term=reverse cterm=underline ctermbg=88 gui=undercurl guisp=Red guibg=#151515

" Fix autocomplete popup box
hi Pmenu ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#1f1f1f
hi PmenuSel ctermfg=7 guibg=#363636 guifg=#ffffff

"}}}
