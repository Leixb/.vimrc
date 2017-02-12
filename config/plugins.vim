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
let g:UltiSnipsSnippetsDir = $VIMCONF . '/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $VIMCONF . '/UltiSnips']
" UltiSnips triggers confiuration in mappings section

Plug 'majutsushi/tagbar' "{{{2
" Vim plugin that displays tags in a window, ordered by scope

Plug 'mattn/emmet-vim', {'for' : 'html'} "{{{2
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
if $TERM!='linux'
let g:airline_powerline_fonts = 1
endif

Plug 'LaTeX-Box-Team/LaTeX-Box' "{{{2
" Lightweight Toolbox for LaTeX

Plug 'godlygeek/tabular' "{{{2
" Vim script for text filtering and alignment

Plug 'junegunn/vim-easy-align' "{{{2
" A Vim alignment plugin
xmap <leader>ga <Plug>(EasyAlign)
nmap <leader>ga <Plug>(EasyAlign)

Plug 'plasticboy/vim-markdown' "{{{2
" Syntax highlighting, matching rules and mappings for Markdown and extensions
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

Plug 'vim-pandoc/vim-pandoc' "{{{2
" Integrate Vim with the pandoc document converter

Plug 'vim-pandoc/vim-pandoc-syntax' "{{{2
" pandoc markdown syntax, to be installed alongside vim-pandoc

Plug 'KabbAmine/zeavim.vim' "{{{2
" Zeal for vim

Plug 'sjl/gundo.vim' "{{{2
" Visualize your undo tree

Plug 'arecarn/vim-crunch' "{{{2
" Looser math syntax in = register and command g==

Plug 'arecarn/selection.vim' "{{{2
" Allows detection of a command being called from insert mode or visual mode

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

Plug 'rhysd/vim-grammarous', {'on' : 'GrammarousCheck'} "{{{2
" A powerful grammar checker for Vim using LanguageTool.
let g:grammarous#use_vim_spelllang=1

Plug 'reedes/vim-pencil' "{{{2
" Rethinking Vim as a tool for writing

Plug 'junegunn/goyo.vim' "{{{2
" Distraction-free writing in Vim
augroup Goyo
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

Plug 'junegunn/limelight.vim' "{{{2
" All the world's indeed a stage and we are merely players

Plug 'robertmeta/nofrils' "{{{2
" An extremely minimalist colorscheme, even opting out of the second L in frills 

Plug 'airblade/vim-gitgutter' "{{{2
" git diff in the gutter (sign column) and stages/undoes hunks.

Plug 'Shougo/denite.nvim', has('nvim') ? { 'do': ':UpdateRemotePlugins' } : {} "{{{2
" Dark powered asynchronous unite all interfaces for Neovim/Vim8
" Menus in file .vim/config/denite

Plug 'Shougo/neomru.vim' "{{{2
" MRU plugin includes unite.vim MRU sources

Plug 'skywind3000/asyncrun.vim' "{{{2
" Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window

Plug 'vim-scripts/Conque-GDB' "{{{2
" GDB command line interface in Vim

Plug 'flazz/vim-colorschemes' "{{{2
" A collection if vim colorschemes

Plug 'vim-airline/vim-airline-themes' "{{{2
" A collection of themes for vim-airline

" NVIM only {{{2

" VIM only {{{2
Plug 'vim-utils/vim-man',has('nvim') ? {'on':[]} : {} "{{{3
" View man pages in vim. Grep for the man pages.

call plug#end()
