call plug#begin('~/.vim-plugins')

" #### Languages Syntax & Fixers ######################################## {{{
" JS
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript']}
let g:used_javascript_libs = 'vue,jquery,underscore'

" Vue.js
Plug 'posva/vim-vue'

" Python
Plug 'hdima/python-syntax', {'for': ['python', 'jinja']}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
let python_highlight_all=1
Plug 'fisadev/vim-isort', {'for': ['python']}
let g:vim_isort_python_version = 'python3'

" Jinja
Plug 'Glench/Vim-Jinja2-Syntax'
" }}}

" #### Visual Helpers ################################################### {{{
" Airline: Nice and Light Status Bar "
""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

function! Myffenc()
  return printf('%s%s', &ff, strlen(&fenc) > 0 ? ' ['.&fenc.']' : '')
endfunction

let g:airline_powerline_fonts = 0
let g:airline_symbols = {}
let g:airline_mode_map = {'__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R', 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', '' : 'V', 's'  : 'S', 'S'  : 'S', '' : 'S', }
let g:airline_theme='gruvbox'
let g:airline_section_z = "%3p%% %{g:airline_symbols.linenr}%#__accent_bold# %l%#__restore__#:%c"
let g:airline_section_y = "%{airline#util#wrap(Myffenc(),0)}"
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" A.L.E: Async Linter "
"""""""""""""""""""""""
Plug 'w0rp/ale'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '➧'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight link ALEErrorSign WarningMsg
highlight link ALEWarningSign ModeMsg
" Sets ALE to use only flake8 and eslint (not jshintj)
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint', 'prettier'],
\   'js': ['eslint', 'prettier'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['isort'],
\}
let g:ale_linter_aliases = {'vue': 'javascript'}
let g:ale_linters.vue = ['eslint', 'prettier']

" Signature: Visual Marks ans some mappings "
"""""""""""""""""""""""""""""""""""""""""""""
Plug 'kshenoy/vim-signature'

" Rainbow: Colorize parentheses "
"""""""""""""""""""""""""""""""""
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
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
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

" GitGutter: Marks for git adds and removals "
""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>
nnoremap <silent> <leader>gr :GitGutterRevertHunk<CR>
nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR>

" Colorizer: Highlight colors "
"""""""""""""""""""""""""""""""
Plug 'lilydjwg/colorizer'
let g:colorizer_nomap=1

" IndentLine: Adds marks for indentation "
""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/indentLine', {'for': ['python', 'c', 'java', 'html', 'jinja', 'javascript', 'vue']}
let g:indentLine_char = '¦'
let g:indentLine_color_term = '236'
let g:indentLine_color_gui = '#363636'
let g:indentLine_noConcealCursor=1

" ZoomWin: Zooms Window in and out "
""""""""""""""""""""""""""""""""""""
Plug 'regedarek/ZoomWin'
" Mappings just like Terminator
nmap <unique> <leader>z  <Plug>ZoomWin
if has('nvim')
    " removed 'key', 'oft', 'sn', 'tx' options which do not work with nvim
    let g:zoomwin_localoptlist = ["ai","ar","bh","bin","bl","bomb","bt","cfu","ci","cin","cink","cino","cinw","cms","com","cpt","diff","efm","eol","ep","et","fenc","fex","ff","flp","fo","ft","gp","imi","ims","inde","inex","indk","inf","isk","kmp","lisp","mps","ml","ma","mod","nf","ofu","pi","qe","ro","sw","si","sts","spc","spf","spl","sua","swf","smc","syn","ts","tw","udf","wfh","wfw","wm"]
endif
"}}}

" #### Autocomplete & Snipepts ########################################## {{{
" Deoplete: Autocompelte for NeoVIM & VIM8 "
""""""""""""""""""""""""""""""""""""""""""""
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/context_filetype.vim'
Plug 'zchee/deoplete-jedi', {'for': 'python'}
let g:deoplete#enable_at_startup = 1

" Cicle through mappings with <tab>
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 1

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.jinja = ['<', '<[^>]*\s[[:alnum:]-]*']

inoremap <expr><C-j> pumvisible() ?   "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ?   "\<C-p>" : "\<C-k>"

" NeoSnippet: Yet Another Snippets plugin "
"""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
let g:neosnippet#enable_completed_snippet = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
imap <c-space>     <Plug>(neosnippet_expand_or_jump)
smap <c-space>     <Plug>(neosnippet_expand_or_jump)
xmap <c-space>     <Plug>(neosnippet_expand_target)

" Jedi-VIM: Python Autocompletion "
"""""""""""""""""""""""""""""""""""
Plug 'davidhalter/jedi-vim', {'for': 'python'}
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 2

" AutoPairs: Automatically adds pairs
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`', '<': '>'}
" }}}

" #### Search & Find #################################################### {{{
" CtrlP: Fuzzy finder "
"""""""""""""""""""""""
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(pyc)$',
  \ }

" Ack.vim: Integrates ack and ag in VIM "
"""""""""""""""""""""""""""""""""""""""""
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
" }}}

" #### Misc ############################################################# {{{
" Surround: Surrounding tags "
""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
vmap s S

" VIM-Test: Test suite runner "
"""""""""""""""""""""""""""""""
Plug 'janko-m/vim-test'
Plug 'reinh/vim-makegreen'
let test#strategy = 'makegreen'
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

" Repeat: Repeats motions from surround and others "
""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-repeat'

" Bufkill: kill buffers without closing windows "
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'http://github.com/vim-scripts/bufkill.vim'
" Map bufkill to CTRL Backspace
nnoremap <silent> <leader><Backspace> :BD<CR>

" Commentary: Makes comments easy peasy "
"""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-commentary'
" }}}

" #### ColorSchemes ##################################################### {{{
Plug 'skielbasa/vim-material-monokai'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'vim-scripts/BusyBee'
Plug '29decibel/codeschool-vim-theme'
Plug 'w0ng/vim-hybrid'
Plug 'croaker/mustang-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'fmoralesc/molokayo'
Plug 'twerth/ir_black'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'wellsjo/wellsokai.vim'
Plug 'easysid/mod8.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
"}}}

" #### Old, Deprecated or Phasing Out ################################### {{{
" Snippets: Ultisnips + vim-snippets "
""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsUsePythonVersion = 2
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" let g:UltiSnipsEditSplit="vertical"
" nnoremap <silent> <leader>es :UltiSnipsEdit<CR>

" DelimitMate: Automatically adds pairs "
"""""""""""""""""""""""""""""""""""""""""
"Plug 'Raimondi/delimitMate'
" let b:delimitMate_expand_cr=1
" let b:delimitMate_expand_space=1
" let b:delimitMate_expand_inside_quotes=1
" }}}

call plug#end()
