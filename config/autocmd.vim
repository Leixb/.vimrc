" Custom autocmd

" Change VIM cursor in insert mode {{{1
" For shape change in NVIM see: $NVIM_TUI_ENABLE_CURSOR_SHAPE)
if !has('nvim')
    augroup vimcursorchange
        autocmd!
        autocmd VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
        autocmd InsertEnter,InsertChange *
                    \ if v:insertmode == 'i' |
                    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
                    \ elseif v:insertmode == 'r' |
                    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
                    \ endif
        autocmd VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    augroup END
endif

" Filetypes {{{1
" set custom makeprg if no makefile found {{{2
if !filereadable("makefile")
    augroup filetype_make
        autocmd!
        autocmd Filetype cpp        set makeprg=g++\ -std=c++11\ -g\ \"%:r.cpp\"\ -o\ \"_%:r\"
        autocmd Filetype c          set makeprg=gcc\ -g\ \"%:r.c\"\ -o\ \"_%:r\"
        autocmd Filetype python     set makeprg=chmod\ +x\ \"%\"
        autocmd Filetype python3    set makeprg=chmod\ +x\ \"%\"
        autocmd Filetype sh         set makeprg=chmod\ +x\ \"%\"
        autocmd Filetype java       set makeprg=javac\ \"%:r.java\"
        autocmd Filetype tex        set makeprg=pdflatex\ \"%:r.tex\"
        autocmd Filetype markdown   set makeprg=pandoc\ -o\ \"%:r.pdf\"\ \"%\"
    augroup END
endif

" filetype autocmd allways run {{{2
augroup filetype_allways
    autocmd!
    autocmd Filetype cpp Docset cpp
    autocmd Filetype tex set concealcursor=""
augroup END

" Vimscript file settings {{{2
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

