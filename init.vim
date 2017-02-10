" Main vimconfig file

" Add global configs to runtimepath
let &runtimepath.=',/usr/share/vim/vimfiles'

let $VIMCONF ='~/.vim/config'

source $VIMCONF/settings.vim

source $VIMCONF/plugins.vim
" Source Denite menus; must be called after plugins
source $VIMCONF/denite.vim

source $VIMCONF/functions.vim
source $VIMCONF/mappings.vim

if filereadable(expand($VIMCONF . '/abbreviations.vim'))
    source $VIMCONF/abbreviations.vim
endif

source $VIMCONF/autocmd.vim

" Load local.vimrc if exists
if (filereadable("local.vimrc"))
    if confirm("Local vimrc file found, source?","&Yes\n&no",1) == 1
        source local.vimrc
    endif
endif

"source ~/.vim/bundle/jutge/plugin/jutge.vim
