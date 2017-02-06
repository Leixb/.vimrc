" vim: filetype=vim

" Custom global commands {{{
command! Mk silent !mkexe "%"
command! Ss silent !showstat "%"

command! W   w
command! Wq  wq
command! Wqa wqa
command! WQ  wq
command! WQa wqa
command! WQA wqa
command! Qa qa
command! QA qa

command! Cdeb   %s@D(@//D(@c
command! UCdeb  %s@//D(@D(@c
command! Cdeba  %s@D(@//D(@
command! UCdeba %s@//D(@D(@
"}}}

if (!has('nvim'))

" VIM commands {{{
command Cr !candr "%"
command Tj !testj.py "%"
command Th !testhp "%"
command Sc !showcases "%"
command Wj !webjutge "%"
" }}}

" VIM functions {{{
function! AfterMakeC()
    if len(getqflist()) == 0
        !./"_%:r.o"
    endif
endfunction

function! AfterMakeCwithIn()
    if len(getqflist()) == 0
        !./_%:r.o <in >out
        !diff -y out exp
    endif
endfunction

function! FetJutge()
    !fet "%"
    bd!
endfunction

" }}}

else

" NVIM commands {{{
command! Cr term candr "%"
command! Tj term testj "%"
command! Th term testhp "%"
command! Sc term showcases "%"
command! Wj term webjutge "%"
" }}}

" NVIM functions {{{
function! AfterMakeC()
    if len(getqflist()) == 0
        term ./"_%:r.o"
    endif
endfunction

function! AfterMakeCwithIn()
    if len(getqflist()) == 0
        term ./_%:r.o <in >out
        term diff -y out exp
    endif
endfunction

function! FetJutge()
    !fet "%"
    bd!
endfunction

" }}}

endif
