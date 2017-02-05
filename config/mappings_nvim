" vim: filetype=vim

" Jutge.org keymaps {{{
nnoremap <silent> <F7> :Ss<CR>
nnoremap <silent> <F31> :Wj<CR>
nnoremap <F33> :term ./"_%:r.o"<CR>
nnoremap <F10> :Tj<CR>
nnoremap <F34> :call FetJutge()<CR>
"}}}

" Compile commands {{{
nnoremap <F32> :call AfterMakeCwithIn()<CR>
nnoremap <F33> :call AfterMakeC()<CR>
" }}}


" Filetype Specify keymaps {{{

augroup filetype_maps_nvim
    autocmd!
    autocmd Filetype python map <F33> :term "./%"<CR>
    autocmd Filetype python3 map <F33> :term "./%"<CR>
    autocmd Filetype sh map <F33> :term "./%"<CR>
    autocmd Filetype java map <F33> :term java "%:r"<CR>
    autocmd Filetype tex map <F33> :!pkill mupdf <CR><CR> :!mupdf "%:r.pdf" & <CR><CR>
    autocmd Filetype markdown map <F33> :!pkill mupdf <CR><CR> :!mupdf "%:r.pdf" & <CR><CR>
    autocmd Filetype haskell map <F33> :term runghc "%"<CR>
augroup END
" }}}

" Terminal mappings {{{
tnoremap <Esc> <C-\><C-n>
"}}}

