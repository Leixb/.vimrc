" vim: filetype=vim
let &runtimepath.=',/usr/share/vim/vimfiles'
source ~/.vim/config/settings

filetype off

source ~/.vim/config/plugins

filetype on
filetype plugin on
filetype indent on

source ~/.vim/config/functions
source ~/.vim/config/mappings
source ~/.vim/config/abbreviations
source ~/.vim/config/filetypes
source ~/.vim/config/autocmd

if (has('nvim'))
    source ~/.vim/config/mappings_nvim
    source ~/.vim/config/functions_nvim
else 
    source ~/.vim/config/mappings_vim
    source ~/.vim/config/functions_vim
endif

if (filereadable("_local_settings_vim_danger"))
    source _local_settings_vim_danger
endif

set concealcursor=""

