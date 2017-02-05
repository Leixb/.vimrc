" vim: filetype=vim

" Use Vim settings rather than Vi. This must be first as it changes settings
" as consequence
set nocompatible

syntax on

set number
set showmode 
set showcmd

set t_Co=256

set expandtab   "tab to spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

set autoindent
set smartindent
set cindent

" Display tabs and trailing spaces
set list
set listchars="tab:|||>,trail:·"    

set cursorline
set colorcolumn=80

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildignore=*.o
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pdf,*.odt

set hidden

set autoread
set visualbell
set history=1000

set nowrap
set linebreak

" Timeout commands (safe allows to do jk when mappend to <ESC> in insertmode
" if you wait enough)
set timeout 
set timeoutlen=1000 
set ttimeoutlen=100

set mouse=""
set laststatus=2

set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Allow backspace to wrap through lines and EOF as well as idents
set backspace=indent,eol,start 

" Conceal everything possible except when on cursor line
set conceallevel=2
set concealcursor=""

" Enable vim modelines with secure option
set modeline
set modelines=5
set secure

" python {{{
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python2'    
let g:python3_host_prog = '/usr/bin/python'    
" }}}

"Testj
let b:testj_flags = ''

"NVIM {{{
if (has('nvim'))
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
"}}}

"VIM {{{
if (!has('nvim'))
    set guioptions -=T
    set guioptions -=m 
endif
" }}}

" Style {{{
colorscheme distinguished

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
" }}}
