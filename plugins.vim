call plug#begin('~/.vim/plugged')

" #### Airline: A nice and light status line ############################# {{{
Plug 'bling/vim-airline'

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

" #### Fugitive: GIT Integration ######################################### {{{
Plugin 'fugitive.vim'
" }}}

" #### Dispatch: Asynchronous calls ###################################### {{{
Plugin 'tpope/vim-dispatch'
" }}}

" #### SmoothScroll: Smooth scrolling #################################### {{{
Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }}}

" #### Surround: Surrounding tags ######################################## {{{
Plug 'tpope/vim-surround'
vmap s S
" }}}
"
" #### Snippets: Ultisnips + vim-snippets ############################### {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsEditSplit="vertical"
nnoremap <silent> <leader>es :UltiSnipsEdit<CR>
" }}}

" #### Signature: Visual marks and some nice mappings #################### {{{
Plugin 'kshenoy/vim-signature'
" }}}

" #### delimitMate: Automatically adds delimits ########################## {{{
Plugin 'Raimondi/delimitMate'
let b:delimitMate_expand_cr=1
let b:delimitMate_expand_space=1
let b:delimitMate_expand_inside_quotes=1
" }}}

" #### list-text-object: Creates Argument object ######################### {{{
Plugin 'jesseschalken/list-text-object'
" }}}

" #### CtrlP: Fuzzy finder ############################################### {{{
Plugin 'kien/ctrlp.vim'
" }}}

" #### Switch: Cycles throught predefined keywords/matches ############### {{{
Plugin 'AndrewRadev/switch.vim'
nnoremap <silent> <leader>s :Switch<CR>
" }}}

" #### Syntastic: Syntatic checker ####################################### {{{
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 3
" }}}

" #### Rainbow: Rainbow parenthesis ###################################### {{{
Plugin 'oblitum/rainbow'
" }}}

" #### YouCompleteMe: Autocomplete based in tags, cmake and etc ########## {{{
Plugin 'Valloric/YouCompleteMe'
nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_add_preview_to_completeopt=0
" Dependencies: build-essential cmake python-dev clang-3.4
" }}}

" #### GitGutter: Marks for git adds and removals ######################## {{{
Plugin 'airblade/vim-gitgutter'
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>gr :GitGutterRevertHunk<CR>
nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR>
" }}}

" #### Repeat: Repeats motions from surround and others ################## {{{
Plugin 'tpope/vim-repeat'
" }}}

" #### Bufkill: kill buffers without closing windows ##################### {{{
Plugin 'mattdbridges/bufkill.vim'
" Map bufkill to CTRL Backspace
nnoremap <silent> <C-Backspace> :BD<CR>
" }}}

" #### ZoomWin: Zooms Window in and out ################################## {{{
"Plugin 'regedarek/ZoomWin'
Plugin 'magnunleno/ZoomWin'
" Mappings just like Terminator
nmap <unique> <c-s-x>  <Plug>ZoomWin
" Makes <C-w>o behaves as expected
nnoremap <silent> <C-w>o :only<CR>
"}}}

" #### Colors ############################################################ {{{
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'vim-scripts/BusyBee'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'croaker/mustang-vim'
Plugin 'nanotech/jellybeans.vim'
"}}}
