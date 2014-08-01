""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Vundle Header
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" Required for Vundle
set nocompatible " No VI compatibility
filetype off

"Add Vundle to path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Set vundle default protocol
let g:vundle_default_git_proto = 'http'
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 My Bundles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
" GIT Integration
Plugin 'fugitive.vim'
" Asynchronous calls
Plugin 'tpope/vim-dispatch'
" Nice status line
Plugin 'bling/vim-airline'
" Smooth scrolling
Plugin 'terryma/vim-smooth-scroll'
" Surrounding tags
Plugin 'surround.vim' " TODO:  Customize surround
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Visual marks and some nice mappings
Plugin 'kshenoy/vim-signature'
" Automatically adds delimits
Plugin 'Raimondi/delimitMate'
" Creates Argument object
Plugin 'jesseschalken/list-text-object'
" Fuzzy finder
Plugin 'kien/ctrlp.vim'
" Cycles throught predefined keywords/matches
Plugin 'AndrewRadev/switch.vim'
" Syntastic
Plugin 'scrooloose/syntastic'
" Rainbow parenthesis
Plugin 'oblitum/rainbow'
" YouCompleteMe
" Also install: build-essential cmake python-dev clang-3.4
Plugin 'Valloric/YouCompleteMe'
" Marks for git adds and removals
Plugin 'airblade/vim-gitgutter'
" Bufkill (kill buffers without closing windows)
Plugin 'mattdbridges/bufkill.vim'
" Repeats motions from surround and others
Plugin 'tpope/vim-repeat'
" Adds a zoomplugin
Plugin 'regedarek/ZoomWin'

" Colors {{{
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'vim-scripts/BusyBee'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'croaker/mustang-vim'
Plugin 'nanotech/jellybeans.vim'
"}}}

" TODO: Retest every plugin :(

" Vundle closing
call vundle#end()
filetype plugin indent on
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Bundles Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline settings {{{
function! Myffenc()
  return printf('%s%s', &ff, strlen(&fenc) > 0 ? ' ['.&fenc.']' : '')
endfunction

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.paste = 'ρ'
let g:airline_mode_map = {'__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R',
    \ 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', '' : 'V', 's'  : 'S', 'S'  : 'S',
    \ '' : 'S', }
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline_section_z = "%3p%% %{g:airline_symbols.linenr}%#__accent_bold# %l%#__restore__#:%c"
let g:airline_section_y = "%{airline#util#wrap(Myffenc(),0)}"
"}}}

" Smooth scroll settings {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"}}}

" Surround settings {{{
vmap s S
"}}}

" Ultisnips settings {{{
let g:UltiSnipsEditSplit="vertical"
nnoremap <silent> <leader>S :UltiSnipsEdit<CR>
"}}}

" DelimitMate settings {{{
let b:delimitMate_expand_cr=1
let b:delimitMate_expand_space=1
let b:delimitMate_expand_inside_quotes=1
" }}}

" Switch.vim settings {{{
nnoremap <silent> <leader>s :Switch<CR>
"}}}

" syntastic settings {{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 3
"}}}

" YouCompleteMe settings {{{
nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

"}}}

" GitGutter settings {{{
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>gr :GitGutterRevertHunk<CR>
nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR>
" }}}
"
"
" Bufkill mapping {{{
" Map bufkill to CTRL Backspace
nnoremap <silent> <C-Backspace> :BD<CR>
" Map bd to BD
cnoremap bd BD
" }}}

" ZoomWin Settings {{{
nnoremap <silent> <C-s-x> :ZoomWin<CR>:set modifiable<CR>
" Makes <C-w>o behaves as expected
nnoremap <silent> <C-w>o :only<CR>
"}}}
