"""""""""""""""""""""""""""""""""" My VIMRC """"""""""""""""""""""""""""""""""
" vim: et:tw=79:sw=4:ts=4:sts=4
"
" File: ~/.vimrc
" Author: Magnun Leno <magnun dot leno at gmail dot com>
" Copyright: GPLv3
" Description: List of settings for VIM setup

set conceallevel=1

" I don't like \ as a leader.
let mapleader=","

" Plugins
source ~/.vim/plugins.vim
let $PLUGINS='~/.vim/plugins.vim'

" Mappings
source ~/.vim/mappings.vim
let $MAPPINGS='~/.vim/mappings.vim'

set nocompatible
filetype plugin indent on

" Enable Syntax highlight
syntax on
" Make vim searching incredible
set hlsearch incsearch smartcase
" Set VIM to use 256 colors
set t_Co=256

set background=dark

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_warnings=1
let g:gruvbox_invert_indent_guides=1

let g:gruvbox_vert_split='dark0_hard'
let g:gruvbox_sign_column='dark0_hard'
let g:gruvbox_color_column='dark0'

let g:gruvbox_invert_selection=0
colorscheme gruvbox

if has("gui_running")
    " No toolbar or Menu (someone use it?)
    set guioptions-=T
    set guioptions-=m
    " No left and right scrollbar
    set guioptions-=r
    set guioptions-=L
    set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
endif


" Set dark background
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
" Eable folding and set it to use the marker
set foldenable foldmethod=marker
" Set hidden buffers
set hidden
" More powerful backspacing
set backspace=indent,eol,start
" Tells VIM that we are using a fast TTY
set ttyfast
" Keep 200 lines of command line history
set history=200
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes+=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc
set wildignore+=*.bak,~*,*.swp,*.o,*.info,*.aux,*.log,*.dvi,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.pyc
" Remove fillchars
set fillchars=
" Highlight the textwidth+1 column. In python files commonly is the 80th column
set colorcolumn=+1
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
" Disable backup and swapfile
set nobackup noswapfile
" Fix split positioning
set splitbelow splitright
" Rounds indent to multiple of shiftwidth
set shiftround
" Complet matching text and show list
set wildmode=list:longest
" Disable preview window (faster navigation in completitions)
set completeopt-=preview
" Automatically read a file that has changed on disk
set autoread
" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" Read again about this Settigns...
" set list listchars=tab:▸,trail:·,nbsp:·,

" Settigns for specific filetype
augroup filetypedetect
    autocmd BufNewFile,BufRead *.c,*.h setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent nowrap
    autocmd FileType c,cpp,objc,objcpp call rainbow#load()
    autocmd BufNewFile,BufRead *.py source ~/.vim/confs/python.vim
    autocmd BufNewFile,BufRead *.rst source ~/.vim/confs/rst.vim
    " Autodestroy fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

