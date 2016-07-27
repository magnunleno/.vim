runtime colors/brogrammer.vim
let g:colors_name = "brogrammer+"

" Fix NonText (tab, CR and etc)
hi NonText ctermfg=22 ctermbg=234 cterm=NONE guifg=#30312a guibg=#1a1a1a gui=NONE

" Makes the Line Number color closer to the default BG
hi LineNr term=underline ctermfg=244 ctermbg=236 guifg=#838586 guibg=#232323

" Makes the current line number highlight changes only the FG
hi CursorLineNr term=bold ctermfg=14 gui=bold guifg=Yellow guibg=#232323

" Fix Ignore too invisible
hi Ignore ctermfg=241 guifg=#363862

" Fix vertical split
hi VertSplit term=reverse ctermfg=241 ctermbg=234 gui=bold guifg=#303030 guibg=#232323

" Fix GitGutter Column
hi SignColumn ctermfg=244 ctermbg=236 guifg=#838586 guibg=#232323
hi GitGutterChangeDefault ctermfg=244 ctermbg=236 guifg=#bbbb00 guibg=#232323
hi GitGutterAddDefault ctermfg=2 ctermbg=236 guifg=#009900 guibg=#232323
hi GitGutterDeleteDefault ctermfg=1 ctermbg=236 guifg=#ff2222 guibg=#232323

" Make colorcolumn more subtle
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#212121 gui=NONE

" Fix Search highlight
hi Search term=reverse cterm=bold ctermfg=221 gui=bold guifg=#1a1a1a guibg=#f1c40f

" Fix IncSearch highlight
hi IncSearch term=reverse cterm=bold ctermfg=16 ctermbg=39 gui=bold guifg=#000000 guibg=#6c71c4
" Fix Highlights that looks just like Special
hi Boolean ctermfg=62 ctermbg=NONE cterm=NONE guifg=#989bd5 guibg=NONE gui=NONE
hi Constant ctermfg=62 ctermbg=NONE cterm=NONE guifg=#365c93 guibg=NONE gui=NONE
hi Float ctermfg=62 ctermbg=NONE cterm=NONE guifg=#936cc4 guibg=NONE gui=NONE
hi Number ctermfg=62 ctermbg=NONE cterm=NONE guifg=#936cc4 guibg=NONE gui=NONE

" Fix Special Characters
hi SpecialKey ctermfg=22 ctermbg=234 guifg=#30312a guibg=#1a1a1a

" Fix Spell
hi SpellBad term=reverse ctermfg=167 ctermbg=224 gui=undercurl guisp=Red

