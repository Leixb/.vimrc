" Plugins, managed through vim-plug

" Auto install vim-plug if not installed {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugin manager {{{1
call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate' "{{{2
" Automatic closing of quotes, parenthesis, brackets, etc., 
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

Plug 'Valloric/ListToggle' "{{{2

"{{{ Plug 'Valloric/YouCompleteMe'2

function! BuildYCM(info)
" Run install.py for YCM if first install
  if a:info.status == 'installed' || a:info.force
    !./install.py\ --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe',{ 'do': function('BuildYCM') } 
" Code-completion engine for Vim
let g:ycm_global_ycm_extra_conf = '~/.vim/config/ycm/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_filetype_blacklist = {}
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_server_python_interpreter = '/usr/bin/python'  
let g:ycm_always_populate_location_list = 1
set omnifunc=syntaxcomplete#Complete
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''
let g:ycm_semantic_triggers = {'tex':['\']}

Plug 'Yggdroot/indentLine' "{{{2
" Displays thin vertical lines at each indentation level
let g:indentLine_char = '│'
" More settings in filetype (disabled with latex)

Plug 'easymotion/vim-easymotion' "{{{2
" Vim motion on speed!

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' "{{{2
" Ultisnips: The ultimate solution for snippets in Vim
" VimSnippets: Snippets files for various programming languages.
let g:UltiSnipsUsePythonVersion = 3
" More UltiSnips confiuration in mappings section

Plug 'majutsushi/tagbar' "{{{2
" Vim plugin that displays tags in a window, ordered by scope

Plug 'mattn/emmet-vim' "{{{2
" Provides support for expanding abbreviations similar to emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

Plug 'scrooloose/nerdcommenter' "{{{2
" Vim plugin for intensely orgasmic commenting

Plug 'scrooloose/nerdtree' "{{{2
" A tree explorer plugin for vim.

Plug 'Xuyuanp/nerdtree-git-plugin' "{{{2
" A plugin of NERDTree showing git status

Plug 'tmhedberg/matchit' "{{{2

Plug 'tpope/vim-ragtag' "{{{2
" A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP ...

Plug 'tpope/vim-repeat' "{{{2
" Remaps . in a way that plugins can tap into it.

Plug 'tpope/vim-surround' "{{{2
" Mappings to easily delete, change and add such surroundings in pairs.

Plug 'tpope/vim-fugitive' "{{{2
" Git wrapper

Plug 'vim-airline/vim-airline' "{{{2
" Lean & mean status/tabline for vim that's light as air.
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1

Plug 'LaTeX-Box-Team/LaTeX-Box' "{{{2
" Lightweight Toolbox for LaTeX

Plug 'godlygeek/tabular' "{{{2
" Vim script for text filtering and alignment

Plug 'plasticboy/vim-markdown' "{{{2
" Syntax highlighting, matching rules and mappings for Markdown and extensions
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

Plug 'KabbAmine/zeavim.vim'    "{{{2
" Zeal for vim

Plug 'sjl/gundo.vim'   "{{{2
" Visualize your undo tree

Plug 'arecarn/vim-crunch'  "{{{2
" Looser math syntax in = register and command g==

Plug 'ryanoasis/vim-devicons' "{{{2
" Adds file type glyphs/icons to many popular Vim plugins

Plug 'mhinz/vim-startify' "{{{2
" The fancy start screen for Vim.
let g:startify_bookmarks = [
    \ {'c' : '~/.vim/init.vim'},
    \ ]
let g:startify_commands = [
    \ {'dm' : ['Denite MRU', ':Denite file_mru']},
    \ {'v' : ['Vimconfig', ':Denite -path=~/.vim/config file_rec']},
    \ {'h' : ['Help', ':Denite help']},
    \ ]
let g:ascii = [
    \ '██╗     ███████╗██╗██╗  ██╗    ██╗   ██╗██╗███╗   ███╗',
    \ '██║     ██╔════╝██║╚██╗██╔╝    ██║   ██║██║████╗ ████║',
    \ '██║     █████╗  ██║ ╚███╔╝     ██║   ██║██║██╔████╔██║',
    \ '██║     ██╔══╝  ██║ ██╔██╗     ╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '███████╗███████╗██║██╔╝ ██╗     ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '╚══════╝╚══════╝╚═╝╚═╝  ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ ]
let g:startify_custom_header =
    \ 'map(g:ascii + startify#fortune#boxed(), "\"   \".v:val")'

Plug 'rhysd/vim-grammarous' "{{{2
" A powerful grammar checker for Vim using LanguageTool.
let g:grammarous#use_vim_spelllang=1

Plug 'Shougo/denite.nvim',{'do':':UpdateRemotePlugins'} "{{{2
" Dark powered asynchronous unite all interfaces for Neovim/Vim8
" Menus in file .vim/config/denite

Plug 'Shougo/neomru.vim' "{{{2
" MRU plugin includes unite.vim MRU sources

Plug 'skywind3000/asyncrun.vim' "{{{2
" Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window

" NVIM only {{{2
if (has('nvim'))

"Plug 'neomake/neomake' "{{{3
" Asynchronous linting and make framework for Neovim/Vim

endif

" VIM only {{{2
if (!has('nvim'))
Plug 'vim-utils/vim-man'       "{{{3
" View man pages in vim. Grep for the man pages.
endif

call plug#end()
