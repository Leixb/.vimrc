" Functions and commands

" Custom global commands {{{1

command! W   w
command! Q q
command! Wq  wq
command! WQ  wq
command! Wqa wqa
command! WQa wqa
command! WQA wqa
command! Qa qa
command! QA qa

" Custom functions {{{1
function! AfterMakeC(...) abort
    let s:in = ''
    let s:out = ''
    if a:0 >= 1
        let s:in = ' <' . a:1
    endif
    if a:0 == 2
        let s:out = ' >' . a:2
    endif
    if a:0 > 2
        echoerr "Too many arguments"
        return -1
    endif

    let s:filename = expand("%:h") . '/' . expand("%:t:r") . '.x'
    if (filereadable(s:filename) || &ft=='rust')
        if has('nvim')
            if (&ft=='rust')
                exec 'term cargo run' . s:in . s:out
            else
                exec 'term ./' . shellescape(s:filename) . s:in . s:out
            endif
        else
            if (&ft=='rust')
                exec '!cargo run' . s:in . s:out
            else
                exec '!./' . shellescape(s:filename) . s:in . s:out
            endif
        endif
    else
        echoerr "File " . s:filename . " not found"
        return -1
    endif
endfunction

command! -nargs=* -complete=file Run call AfterMakeC(<f-args>)

function! AfterAsync() abort
    if ( g:asyncrun_code == 0 )
        echom "Async finished; no errors reported"
    else
        echom "Async finished, returned code: " . g:asyncrun_code
        copen
    endif
endfunction

command! MakeExe !i686-w64-mingw32-g++ "%" --static -o "%:h/%:t:r.exe"
