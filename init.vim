" Main vimconfig file

let $VIMFOLDER = $HOME . '/.vim'
let $VIMCONF = $VIMFOLDER . '/config'

source $VIMCONF/settings.vim

" Plugins managed by vim-plug and their specific settings
let g:plug_plugin_folder = $VIMFOLDER . '/plugged'
source $VIMCONF/plugins.vim

" Set colorscheme, must be called after plugins if themes are managed by
" vim-plug
exec 'colorscheme ' g:default_colorscheme
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red gui=undercurl guifg=#900019  

" Source Denite menus; must be called after plugins
source $VIMCONF/denite.vim

" Custom funtions and commands
source $VIMCONF/functions.vim
" Custom mappings (leader key is <space>
source $VIMCONF/mappings.vim

" Source abbreviations file if readable
if filereadable($VIMCONF . '/abbreviations.vim')
    source $VIMCONF/abbreviations.vim
endif

" Custom autocommmands (mainly filetype specific)
source $VIMCONF/autocmd.vim

" Load local.vimrc if exists and warn before doing so
if (filereadable("local.vimrc"))
    let s:option = confirm("Local vimrc file found, source?","&Yes\n&no\n&delete",1)
    if s:option == 1
        source local.vimrc
    elseif s:option==3
        !rm local.vimrc
    endif
endif

