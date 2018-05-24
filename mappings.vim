if has("gui_running")
"{{{ GVIM mappings only
    " Save file (yeah, I'm lazy)
    nnoremap <C-s> :w<cr>
    inoremap <C-s> <esc>:w<cr>a
    " Switch between last and actual buffer
    nnoremap <C-p> :b#<CR>
    " Next buffer
    nnoremap <C-Tab> :bn<CR>
    " Previews buffer
    nnoremap <C-S-Tab> :bp<CR>
"}}}
else
"{{{ Terminal VIM mappings only
    " Previews buffer
    nnoremap <leader>< :bp<CR>
    " Next buffer
    nnoremap <leader>> :bn<CR>
    " Previews Tab
    nnoremap <leader>[ :tabprevious<CR>
    " Next Tab
    nnoremap <leader>] :tabnext<CR>
"}}}
endif

"#### Auxiliary functions ################################################ {{{
fun! VtrCallDjangoShell()
	execute "VtrKillRunner"
	execute "VtrOpenRunner"
	execute "VtrSendCommandToRunner pipenv run ./manage.py shell"
endfunction

fun! VtrCallDjangoShellPlus()
	execute "VtrKillRunner"
	execute "VtrOpenRunner"
	execute "VtrSendCommandToRunner pipenv run ./manage.py shell_plus"
endfunction

fun! VtrCallPythonShell()
	execute "VtrKillRunner"
	execute "VtrOpenRunner"
	execute "VtrSendCommandToRunner python"
endfunction
"}}}

" #### Disabling Keys #################################################### {{{
" Disable F1
noremap <F1> <nop>
inoremap <F1> <nop>

" Disable del and backspace (maybe I'll give them an usage in the future)
nnoremap <Del> <nop>
vnoremap <Del> <nop>
nnoremap <BS> <nop>
vnoremap <BS> <nop>

" Disable arrow keys. Yeah, that's right baby, no need for them!
nnoremap <up> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>

" Disable K
nnoremap K <nop>
" ######################################################################## }}}

" #### N Mappings ######################################################## {{{
" Toggle en spell
nnoremap <leader>en :setlocal spell! spelllang=en<CR>

" Toggle pt spell
nnoremap <leader>pt :setlocal spell! spelllang=pt<CR>

" Map quickfix commands (:cnext and :cNext) to ]e and [e
nnoremap ]e :cnext<CR>
nnoremap [e :cNext<CR>

" Toggle full screen (Requires wmctrl: sudo aptitude insttall wmctrl)
nnoremap <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" Set relative number toggle
nnoremap <silent> <leader>rn :set relativenumber!<CR>

" Move , functionality to the old leader "\"
nnoremap \ ,

" set text wrapping toggles
nmap <silent> <leader>w :set invwrap<cr>

" Create highlight for selected words
nnoremap <silent> <leader>h1 :match InterestingWord1 /\<<c-r><c-w>\>/<CR>
nnoremap <silent> <leader>h2 :2match InterestingWord2 /\<<c-r><c-w>\>/<CR>
nnoremap <silent> <leader>h3 :3match InterestingWord3 /\<<c-r><c-w>\>/<CR>
" Clear higlighted words
nnoremap <silent> <leader>rh1 :execute 'match none'<CR>
nnoremap <silent> <leader>rh2 :execute '2match none'<CR>
nnoremap <silent> <leader>rh3 :execute '3match none'<CR>
" Clear all highlighted words
nnoremap <silent> <leader>rhh :match none<CR>:2match none<CR>:3match none<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't use Ex mode, use Q for formatting
nnoremap Q gqip

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Show current search in cwindow
nnoremap <leader>\ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Source current line
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Opens and closes folds with Space bar
nnoremap <Space> za

" Commantary mappings
nnoremap <leader>c :Commentary<CR>

" Window navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Select entire buffer
nnoremap <leader>va ggvGg_
nnoremap <leader>Va ggVG

" Source this line, place your cursor on ), press zl and you'll understand
"    println()foo
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Shortcut to edit a file in the same directory
nnoremap <leader>e/ :e %:h/

" Shortcut to edit a file in the previews directory
nnoremap <leader>e. e %:h/


" VIM Grep word under the cursor
if exists("g:ackprg")
	nnoremap <leader>g "ayiw:Ack "a"
else
	nnoremap <leader>g "ayiw:vimgrep "a" **/*
endif

" Search All TODO comments in .py files
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>

" Makes <C-w>o behaves as expected
nnoremap <silent> <C-w>o :only<CR>

" Move between ALE errors
nmap <silent> <leader>lp <Plug>(ale_previous_wrap)
nmap <silent> <leader>ln <Plug>(ale_next_wrap)

" Open NeoVIM Terminal With Python
nnoremap <leader>sdp :call VtrCallDjangoShellPlus()<CR>
nnoremap <leader>sd :call VtrCallDjangoShell()<CR>
nnoremap <leader>sp :call VtrCallPythonShell()<CR>
" ######################################################################## }}}

" #### C Mappings ######################################################## {{{
" Saves as ROOT
cnoremap w!! w !sudo tee % >/dev/null

" Shortcut to edit a file in the same directory
"cnoremap :E e %:h/

" Shortcut to edit a file in the previews directory
"cnoremap EE e %:h/

" Ctrl-a and Ctrl-e works in Command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" ######################################################################## }}}

" #### V Mappings ######################################################## {{{
" Bubbles text up
xmap <C-k> :mo'<-- <CR> gv
" Bubbles text down
xmap <C-j> :mo'>+ <CR> gv

vnoremap <tab> %

" Don't use Ex mode, use Q for formatting
vnoremap Q gq

" Opens and closes folds with Space bar
vnoremap <Space> za

" Commantary mappings
vnoremap <leader>c :Commentary<CR>

" Ident and unindent in visual (keeping selection)
vmap <silent> <Tab> >gv
vmap <silent> <S-Tab> <gv

vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>

vnoremap <leader>n :normal

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" ######################################################################## }}}

" #### NVO Mappings ###################################################### {{{
" C-Enter goes into a tag (for info ':help tag')
noremap <silent> <C-Enter> <C-]>

" Disable HLSearch with <leader>/
noremap <silent> <leader>/ :nohlsearch<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" ######################################################################## }}}

" #### NeoVIM Terminal Mappings ########################################## {{{
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif
" }}}

nnoremap <leader>. :CtrlPTag<CR>
