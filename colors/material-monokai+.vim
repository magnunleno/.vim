runtime colors/material-monokai.vim
let g:colors_name = "material-monokai+"

hi clear SpellBad
hi clear MatchParen
hi clear jsFrom
hi clear jsExportDefault

hi jsArrowFunction   ctermfg=81 guifg=#66d9ef
hi MatchParen        guifg=#e73c50 gui=bold cterm=bold
hi jsExport          gui=bold cterm=bold
hi jsImport          gui=bold cterm=bold
hi jsFrom            ctermfg=197 guifg=#FC3488
hi jsExportDefault   ctermfg=197 guifg=#FC3488
hi Folded            ctermfg=189 ctermbg=60 guifg=#d7d7ff guibg=#5f5f87

hi SpellBad          gui=undercurl cterm=undercurl
hi CursorLine        ctermbg=235 guibg=#263238
hi Normal            ctermbg=233 guibg=#1F292D
hi ColorColumn       ctermbg=235 guibg=#263238

hi link jsFuncParens            Comment
hi link jsFuncBraces            Comment
hi link jsParensIfElse          Comment
hi link jsBrackets              Comment
hi link jsClassBraces           jsFuncName
hi link jsIfElseBraces          Special
hi link jsArrowFunction         StorageClass
hi link jsParens                jsVariableDef
hi link jsModuleBraces          jsUndefined
