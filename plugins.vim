call plug#begin('~/.vim-plugins')

" #### Airline: A nice and light status line ############################# {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

function! Myffenc()
  return printf('%s%s', &ff, strlen(&fenc) > 0 ? ' ['.&fenc.']' : '')
endfunction

let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_symbols = {}
let g:airline_mode_map = {'__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R',
    \ 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', '' : 'V', 's'  : 'S', 'S'  : 'S',
    \ '' : 'S', }
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline_section_z = "%3p%% %{g:airline_symbols.linenr}%#__accent_bold# %l%#__restore__#:%c"
let g:airline_section_y = "%{airline#util#wrap(Myffenc(),0)}"
"}}}

" #### Snippets: Ultisnips + vim-snippets ############################### {{{
" let g:UltiSnipsUsePythonVersion = 2
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" let g:UltiSnipsEditSplit="vertical"
" nnoremap <silent> <leader>es :UltiSnipsEdit<CR>
" }}}

" #### Surround: Surrounding tags ######################################## {{{
Plug 'tpope/vim-surround'
vmap s S
" }}}

" #### Signature: Visual marks and some nice mappings #################### {{{
Plug 'kshenoy/vim-signature'
" }}}

" #### AutoPairs: Automatically adds pairs ############################### {{{
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`', '<': '>'}
"}}}

" #### DelimitMate: Automatically adds pairs ################################## {{{
"Plug 'Raimondi/delimitMate'
" let b:delimitMate_expand_cr=1
" let b:delimitMate_expand_space=1
" let b:delimitMate_expand_inside_quotes=1
"}}}

" #### list-text-object: Creates Argument object ######################### {{{
Plug 'jesseschalken/list-text-object'
" }}}

" #### CtrlP: Fuzzy finder ############################################### {{{
Plug 'kien/ctrlp.vim'
" }}}

" #### Switch: Cycles throught predefined keywords/matches ############### {{{
Plug 'AndrewRadev/switch.vim'
nnoremap <silent> <leader>s :Switch<CR>
" }}}

" #### Syntastic: Syntatic checker ####################################### {{{
Plug 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 3
" }}}

" #### Rainbow: Rainbow parenthesis ###################################### {{{
Plug 'oblitum/rainbow'
" }}}

" #### YouCompleteMe: Autocomplete based in tags, cmake and etc ########## {{{
Plug 'Valloric/YouCompleteMe'
nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_add_preview_to_completeopt=0
" Dependencies: build-essential cmake python-dev clang-3.4
" }}}

" #### GitGutter: Marks for git adds and removals ######################## {{{
Plug 'airblade/vim-gitgutter'
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>gr :GitGutterRevertHunk<CR>
nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR>
" }}}

" #### Repeat: Repeats motions from surround and others ################## {{{
Plug 'tpope/vim-repeat'
" }}}

" #### Bufkill: kill buffers without closing windows ##################### {{{
Plug 'mattdbridges/bufkill.vim'
" Map bufkill to CTRL Backspace
nnoremap <silent> <C-Backspace> :BD<CR>
" }}}

" #### ZoomWin: Zooms Window in and out ################################## {{{
"Plugin 'regedarek/ZoomWin'
Plug 'magnunleno/ZoomWin'
" Mappings just like Terminator
nmap <unique> <c-s-x>  <Plug>ZoomWin
" Makes <C-w>o behaves as expected
nnoremap <silent> <C-w>o :only<CR>
"}}}

" #### Colors ############################################################ {{{
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'vim-scripts/BusyBee'
Plug '29decibel/codeschool-vim-theme'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'croaker/mustang-vim'
Plug 'nanotech/jellybeans.vim'
"}}}
