" vim: filetype=vim
"Change VIM cursor in insert mode (has no effect in nvim, for shape change in nvim see: $NVIM_TUI_ENABLE_CURSOR_SHAPE)
if !has('nvim')
    if has("autocmd")
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
endif

" Save folds

"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 
