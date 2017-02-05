" vim: filetype=vim
let &runtimepath.=',/usr/share/vim/vimfiles'
source ~/.vim/config/settings.vim

filetype off

source ~/.vim/config/plugins.vim
" Source Denite menus; must be called after plugins
source ~/.vim/config/denite.vim

filetype on
filetype plugin on
filetype indent on

source ~/.vim/config/functions.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/abbreviations.vim
" Filetype dependent configs
source ~/.vim/config/filetypes.vim
source ~/.vim/config/autocmd.vim

if (has('nvim'))
    source ~/.vim/config/mappings_nvim.vim
    source ~/.vim/config/functions_nvim.vim
else 
    source ~/.vim/config/mappings_vim.vim
    source ~/.vim/config/functions_vim.vim
endif

if (filereadable("_local_settings_vim_danger"))
    source _local_settings_vim_danger
endif
