" vim: filetype=vim

" Filetype maps {{{
augroup filetype_maps_vim
    autocmd!
    autocmd Filetype java map <C-F9> :make<CR><CR>:!java "%:r"<CR>
    autocmd Filetype tex map <C-F9> :!pkill mupdf <CR><CR> :!mupdf "%:r.pdf" & <CR><CR>
augroup END
" }}}

" Jutge mappings {{{
nnoremap <silent> <F7> :Ss<CR>
nnoremap <silent> <C-F7> :Wj<CR>
nnoremap <F10> :Tj<CR>
nnoremap <C-F10> :call FetJutge()<CR>
" }}}

" Compilation mappings {{{
nnoremap <C-F8> :call AfterMakeCwithIn()<CR>
nnoremap <C-F9> :call AfterMakeC()<CR>
" }}}
