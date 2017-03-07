" Global vim settings

set nocompatible

filetype plugin indent on
syntax on

" Show {{{1
set number
set showmode 
set showcmd

set visualbell
set cursorline
set laststatus=2

set conceallevel=2
set concealcursor=""

" Indent and tabs {{{1
set expandtab   "tab to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set smarttab

set autoindent
set smartindent
set cindent

" Search {{{1
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Wildmenu {{{1
set wildmenu
set wildignore=*.o
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pdf,*.odt

" Buffer options {{{1
set hidden
set autoread

" Wraping {{{1
set colorcolumn=80
set wrap
set linebreak
set synmaxcol=200

" Timeout {{{1
set timeout 
set timeoutlen=1000 
set ttimeoutlen=100

" Mouse {{{1
set mouse=""

" Scroll {{{1
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Backspace {{{1
set backspace=indent,eol,start 

" Modelines {{{1
set modeline
set modelines=5
set secure

" History {{{1
set history=1000

" Temp files {{{1
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/

if !isdirectory(expand("$HOME/.vim/files"))
    exec '!mkdir ' . expand("$HOME/.vim/files")
endif
if !isdirectory(&backupdir)
    exec '!mkdir ' . &backupdir
endif
if !isdirectory(&directory)
    exec '!mkdir ' . &directory
endif
if !isdirectory(&undodir)
    exec '!mkdir ' . &undodir
endif

if has('nvim')
    set shada ='100,n$HOME/.vim/files/info/nvimshada
else
    set viminfo ='100,n$HOME/.vim/files/info/viminfo
endif

" python {{{1
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python2'    
let g:python3_host_prog = '/usr/bin/python'    

" Make default tex filetype if empty latex and not plaintex
let g:tex_flavor = "latex"

" NVIM and VIM specifics {{{1
if (has('nvim'))

" NVIM {{{2
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

else 

" VIM {{{2
if has('gui')
    set guioptions -=T
    set guioptions -=m 
endif

endif

" Style {{{1

let g:default_colorscheme ='distinguished'

if $TERM=='xterm-termite'
    set t_Co=256
    set termguicolors
elseif $TERM=='linux'
    set t_Co=8
    let g:default_colorscheme='default'
else
    set t_Co=256
endif

set background=dark
