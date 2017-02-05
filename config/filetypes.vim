" vim: filetype=vim

" set Makeprg if makefile not found {{{
if !filereadable("makefile")
    augroup filetype_make
        autocmd!
        autocmd Filetype cpp        set makeprg=g++\ -std=c++11\ -g\ \"%:r.cpp\"\ -o\ \"_%:r.o\"
        autocmd Filetype c          set makeprg=gcc\ -g\ \"%:r.c\"\ -o\ \"_%:r.o\"
        autocmd Filetype python     set makeprg=chmod\ +x\ \"%\"
        autocmd Filetype python3    set makeprg=chmod\ +x\ \"%\"
        autocmd Filetype sh         set makeprg=chmod\ +x\ \"%\"
        autocmd Filetype java       set makeprg=javac\ \"%:r.java\"
        autocmd Filetype tex        set makeprg=pdflatex\ \"%:r.tex\"
        autocmd Filetype markdown   set makeprg=pandoc\ -o\ \"%:r.pdf\"\ \"%\"
    augroup END
endif
"}}}

" filetype autocmd allways run {{{
augroup filetype_allways
    autocmd!
    autocmd Filetype cpp Docset cpp
    autocmd Filetype tex set concealcursor=""
augroup END
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Identline no conceal on cursor for latex and markdown {{{
augroup identline_fix
    autocmd!
    autocmd FileType tex let g:indentLine_concealcursor = ""
    autocmd FileType markdown let g:indentLine_concealcursor = ""
augroup END
" }}}

" For filetype specific keymaps see mappings

let g:tex_flavor = "latex"
