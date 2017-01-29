" vim: filetype=vim
command Cr !candr "%"
command Tj !testj.py "%"
command Th !testhp "%"
command Sc !showcases "%"
command Wj !webjutge "%"

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

