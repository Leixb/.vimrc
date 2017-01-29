" vim: filetype=vim
command! Cr term candr "%"
command! Tj term testj "%"
command! Th term testhp "%"
command! Sc term showcases "%"
command! Wj term webjutge "%"

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

