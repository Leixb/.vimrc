" Functions and commands

" Custom global commands {{{1

command! W   w
command! Wq  wq
command! Wqa wqa
command! WQ  wq
command! WQa wqa
command! WQA wqa
command! Qa qa
command! QA qa


if (!has('nvim'))
    " VIM commands {{{1
    command Cr !candr "%"
    command Tj !testj.py "%"
    command Th !testhp "%"
    command Sc !showcases "%"
    command Wj !webjutge "%"
endif

" Custom functions {{{1
function! AfterMakeC()
    let s:filename = expand("_" %:r ".o")
    if exists(s:filename)
        if has('nvim')
            exec 'term ./' . shellescape(s:filename)
        else
            exec '!./' . shellescape(s:filename)
        endif
    else 
        echoerr "Compiled file " . s:filename . " not found"
        return -1
    endif
endfunction

