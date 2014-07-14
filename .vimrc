"""""""""""""""""""""""""""""""""" My VIMRC """"""""""""""""""""""""""""""""""
" vim: et:tw=79:sw=4:ts=4:sts=4
"
" File: ~/.vimrc
" Author: Magnun Leno <magnun dot leno at gmail dot com>
" Copyright: GPLv3
" Description: List of settings for VIM setup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Vundle Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" Required for Vundle
filetype off
filetype plugin indent on

"Add Vundle to path
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
let g:vundle_default_git_proto = 'http'
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
" No VI compatibility
set nocompatible
" Enable Syntax highlight
syntax on
" Make vim searching incredible
set hlsearch incsearch smartcase

" Hum... Nice clothes
if has("gui_running")
    "colorscheme xoria256
    colorscheme jellybeans+
    hi ColorColumn guibg=#1c1c10
    " No toobar or Menu (someone use it?)
    set guioptions-=T
    set guioptions-=m
    " No left and right scrollbar
    set guioptions-=r
    set guioptions-=L
    " I'm currently testing this font...
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
else
    colorscheme desert
endif


" Shows line numbers
set number
" Always shows the ruler (cursor position and etc)
set ruler
" Shows (partial) command in status line
set showcmd
" Show matching brackets.
set showmatch
" Highlight cursor line
set cursorline
" Tells vim to let 4 lines beforescrolling
set scrolloff=4
" Tells vim to break lines that exceeds the 'textwidth'
set wrap linebreak
" Always shows the status line
set laststatus=2
" I don't like \ as a leader.
let mapleader=","
" Eable folding and set it to use the marker 
set foldenable foldmethod=marker 
" Set hidden buffers
set hidden
" More powerful backspacing
set backspace=indent,eol,start
" Keep 200 lines of command line history
set history=200
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes+=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc
set wildignore+=*.bak,~*,*.swp,*.o,*.info,*.aux,*.log,*.dvi,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.pyc

" Highlight the textwidth+1 column. In python files commonly is the 80th column
set colorcolumn=+1

set nobackup
set noswapfile
set splitbelow
set splitright

" Read again about this Settigns...
" set list listchars=tab:▸,trail:·,nbsp:·,
" set wildmode=longest,list
" Set up a environment variable for ftplugin/python.vim
" let $PYRC="~/.vim/ftplugin/python.vim"
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Filetype Setups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
augroup filetypedetect
    autocmd BufNewFile,BufRead *.c,*.h setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent nowrap
    autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 autoindent nowrap
    autocmd BufNewFile,BufRead *.trl setfiletype trl 
augroup END

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 My Bundles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
Plugin 'fugitive.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-smooth-scroll'
" TODO:  Customize surround
Plugin 'surround.vim'

" TODO: Retest every plugin :(

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Bundles Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
" Airline
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.paste = 'ρ'
let g:airline#extensions#branch#enabled=1
let g:airline_mode_map = {'__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R',
    \ 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', '' : 'V', 's'  : 'S', 'S'  : 'S',
    \ '' : 'S', }
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

"""""""""" Normal Key Maps
" Disable arrow keys. Yeah, that's right baby, no need for them!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" Disable the del and backspace (maybe I'll give them an usage in the future)
nnoremap <Del> <nop>
nnoremap <BS> <nop>

" Save file (yeah, I'm lazy)
nnoremap <C-s> :w<cr>
" Switch between last and actual buffer
nnoremap <C-p> :b#<CR>
" Next buffer
nnoremap <C-Tab> :bn<CR>
" Previews buffer
nnoremap <C-S-Tab> :bp<CR>
" Disable HLSearch with <leader>/
noremap <silent> <leader>/ :nohlsearch<CR>
" Set en spell 
nnoremap <leader>en :setlocal spell spelllang=en<CR>
" Set pt spell 
nnoremap <leader>pt :setlocal spell spelllang=pt<CR>
" Map quickfix commands (:cnext and :cNext) to ]e and [e
nnoremap ]e :cnext<CR>
nnoremap [e :cNext<CR>
" C-Enter goes into a tag (for info ':help tag')
noremap <silent> <C-Enter> <C-]>

"""""""""" Insert Key Maps
" Disable arrow keys. Yeah, that's right baby, no need for them!
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Save file (yeah, I'm lazy)
inoremap <C-s> <esc>:w<cr>a

"""""""""" Visual Key Maps
" Disable the del and backspace (maybe I'll give them an usage in the future)
vnoremap <Del> <nop>
vnoremap <BS> <nop>

vnoremap <tab> %

"}}}
