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

" #### CtrlP: Fuzzy finder ############################################### {{{
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(pyc)$',
  \ }
" }}}

" #### A.L.E: Syntatic alternative ####################################### {{{
Plug 'w0rp/ale'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '➧'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight link ALEErrorSign WarningMsg
highlight link ALEWarningSign ModeMsg
let g:ale_linters = {
\   'python': ['flake8'],
\}
" }}}

" #### VIM-isort: Sort Imports fo Python ################################ {{{
Plug 'fisadev/vim-isort', {'for': ['python']}
let g:vim_isort_python_version = 'python3'
" }}}

" #### VIM-Test: Test suite runner ####################################### {{{
Plug 'janko-m/vim-test'

let test#strategy = 'basic'
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pytest'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

nmap <silent> <leader>vtn :TestNearest -vv<CR>
nmap <silent> <leader>vtf :TestFile -vv<CR>
nmap <silent> <leader>vts :TestSuite -vv<CR>
nmap <silent> <leader>vtl :TestLast -vv<CR>
nmap <silent> <leader>vtv :TestVisit -vv<CR>
" }}}

" #### Rainbow: Rainbow parenthesis ###################################### {{{
Plug 'luochen1990/rainbow', {'for': ['c', 'python', 'java', 'vim', 'bash', 'javascript', 'vue']}
let g:rainbow_active = 1
let g:rainbow_conf = {
\    'guifgs': ['#458588', '#b16286', '#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e'],
\    'ctermfgs': [ 'brown', 'blue', 'gray', 'green', 'cyan', 'red', 'magenta', 'brown', 'gray', 'black', 'magenta', 'blue', 'green', 'cyan', 'red'],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\    'separately': {
\        '*': {},
\        'tex': {
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\        },
\        'javascript': {
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\        },
\        'lisp': {
\            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\        },
\        'vim': {
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\        },
\        'jinja': {
\            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\        },
\        'css': 0,
\    }
\}
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
