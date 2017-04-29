" Plugins, managed through vim-plug

" Auto install vim-plug if not installed {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugin manager {{{1
call plug#begin(g:plug_plugin_folder)

" Completion {{{2
" Plug 'Valloric/YouCompleteMe' {{{3

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

Plug 'Valloric/ListToggle' "{{{3
" A vim plugin for toggling the display of the quickfix list and the location-list.

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' "{{{3
" Ultisnips: The ultimate solution for snippets in Vim
" VimSnippets: Snippets files for various programming languages.
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = $VIMCONF . '/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $VIMCONF . '/UltiSnips']
" UltiSnips triggers configured in mappings section

Plug 'Raimondi/delimitMate' "{{{3
" Automatic closing of quotes, parenthesis, brackets, etc.,
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

Plug 'mattn/emmet-vim', {'for' : 'html'} "{{{3
" Provides support for expanding abbreviations similar to emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
Plug 'tpope/vim-ragtag' "{{{3
" A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP ...

" Objects / Motions {{{2

Plug 'easymotion/vim-easymotion' "{{{3
" Vim motion on speed!

Plug 'tmhedberg/matchit' "{{{3
" extended % matching for HTML, LaTeX, and many other languages

Plug 'tpope/vim-surround' "{{{3
" Mappings to easily delete, change and add such surroundings in pairs.

Plug 'scrooloose/nerdcommenter' "{{{3
" Vim plugin for intensely orgasmic commenting

Plug 'tpope/vim-repeat' "{{{3
" Remaps . in a way that plugins can tap into it.

Plug 'godlygeek/tabular' "{{{3
" Vim script for text filtering and alignment

" Interface {{{2

Plug 'thaerkh/vim-indentguides' "{{{3
"  Simple indentation guides for your buffers

Plug 'vim-airline/vim-airline' "{{{3
" Lean & mean status/tabline for vim that's light as air.
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ycm#enabled = 1
if $TERM!='linux'
    let g:airline_powerline_fonts = 1
endif

Plug 'vim-airline/vim-airline-themes' "{{{3
" A collection of themes for vim-airline

Plug 'airblade/vim-gitgutter' "{{{3
" git diff in the gutter (sign column) and stages/undoes hunks.

Plug 'ryanoasis/vim-devicons' "{{{3
" Adds file type glyphs/icons to many popular Vim plugins

Plug 'mhinz/vim-startify' "{{{3
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

Plug 'flazz/vim-colorschemes' "{{{3
" A collection if vim colorschemes

" Buffers {{{2

Plug 'Shougo/denite.nvim', has('nvim') ? { 'do': ':UpdateRemotePlugins' } : {} "{{{3
" Dark powered asynchronous unite all interfaces for Neovim/Vim8
" Menus in file .vim/config/denite

Plug 'majutsushi/tagbar' "{{{3
" Vim plugin that displays tags in a window, ordered by scope

Plug 'scrooloose/nerdtree' "{{{3
" A tree explorer plugin for vim.

Plug 'Xuyuanp/nerdtree-git-plugin' "{{{3
" A plugin of NERDTree showing git status

Plug 'sjl/gundo.vim' "{{{3
" Visualize your undo tree

Plug 'tpope/vim-fugitive' "{{{3
" Git wrapper

Plug 'vim-utils/vim-man',has('nvim') ? {'on':[]} : {} "{{{3
" View man pages in vim. Grep for the man pages.

call plug#end()

" Syntax {{{2
Plug 'LaTeX-Box-Team/LaTeX-Box' "{{{3
" Lightweight Toolbox for LaTeX

Plug 'plasticboy/vim-markdown' "{{{3
" Syntax highlighting, matching rules and mappings for Markdown and extensions
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

Plug 'vim-pandoc/vim-pandoc' "{{{3
" Integrate Vim with the pandoc document converter

Plug 'vim-pandoc/vim-pandoc-syntax' "{{{3
" pandoc markdown syntax, to be installed alongside vim-pandoc

" Misc {{{2

Plug 'Leixb/vim-jutge-utils' "{{{3
" Small plugin to automate jutge.org test cases
let g:jutge_command='jutge'
let g:jutge_folder=$HOME . '/Documents/jutge'
let g:jutge_done_folder=g:jutge_folder . '/Fets'

Plug 'skywind3000/asyncrun.vim' "{{{3
" Run Async Shell Commands in Vim 8.0 and Output to Quickfix Window

Plug 'KabbAmine/zeavim.vim' "{{{3
" Zeal for vim

Plug 'rhysd/vim-grammarous', {'on' : 'GrammarousCheck'} "{{{3
" A powerful grammar checker for Vim using LanguageTool.
let g:grammarous#use_vim_spelllang=1

