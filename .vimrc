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

" Set termquicolors (Truecolor) for terminal, if supported
if (has("termguicolors"))
    set termguicolors
endif

" Colorscheme Material Monokai
colorscheme material-monokai+
set background=dark
let g:materialmonokai_italic = 1
let g:materialmonokai_gui_italic = 1
let g:materialmonokai_subtle_spell = 1
let g:materialmonokai_subtle_airline = 1
let g:materialmonokai_custom_lint_indicators=1
let g:airline_theme='materialmonokai'

" Highlight Trailing Whitespaces
match Error /\s\+$/

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
set nowrap linebreak
" Always shows the status line
set laststatus=2
" Eable folding and set it to use the marker
set foldenable foldmethod=indent
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
" Set fillchars
set fillchars=vert:│
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
set completeopt=longest,menuone
" Automatically read a file that has changed on disk
set autoread
" set list listchars=tab:▸,trail:·,nbsp:·,
set list listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⌴
" Remove appending of comment when press o or O
set formatoptions-=o
" Adds numbered lists formatting
set formatoptions+=n
" Don't break a line after a one-letter word
set formatoptions+=1
" Remove a comment leader when joining lines
set formatoptions+=j

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Change folding text
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let line = substitute(line, '^\(\s*\)\s\(\w\)', '\1➤ \2', '')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" Resize splits when the window is resized
" au VimResized * :wincmd =

" Settigns for specific filetype
augroup filetypedetect
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Steve Losh
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" fix typos
command WQ wq
command Wq wq
command W w
command Q q
command QW wq
