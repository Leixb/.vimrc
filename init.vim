" Main vimconfig file

" Add global configs to runtimepath
let &runtimepath.=',/usr/share/vim/vimfiles'

source ~/.vim/config/settings.vim

source ~/.vim/config/plugins.vim
" Source Denite menus; must be called after plugins
source ~/.vim/config/denite.vim

source ~/.vim/config/functions.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/abbreviations.vim
source ~/.vim/config/autocmd.vim

" Load local.vimrc if exists
if (filereadable("local.vimrc"))
    if confirm("Local vimrc file found, source?","&Yes\n&no",1) == 1
        source local.vimrc
    endif
endif

"source ~/.vim/bundle/jutge/plugin/jutge.vim
