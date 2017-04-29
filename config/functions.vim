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
function! AfterMakeC(...)
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

    let s:filename = '_' . expand("%:r")
    if filereadable(s:filename)
        if has('nvim')
            exec 'term ./' . shellescape(s:filename) . s:in . s:out
        else
            exec '!./' . shellescape(s:filename) . s:in . s:out
        endif
    else
        echoerr "File " . s:filename . " not found"
        return -1
    endif
endfunction

command! -nargs=* -complete=file Run call AfterMakeC(<f-args>)

function! AfterAsync()
    if ( g:asyncrun_code == 0 )
        echom "Async finished; no errors reported"
    else
        echom "Async finished, returned code: " . g:asyncrun_code
        copen
    endif
endfunction

command! MakeExe !i686-w64-mingw32-g++ "%" --static -o "%:r.exe"

command! ReferenceCppreference !$BROWSER file://$HOME/Documents/Documentation/cplusplus/cppreference/en/index.html >/dev/null &
command! ReferenceCplusplus !$BROWSER file://$HOME/Documents/Documentation/cplusplus/Cpp/index.html >/dev/null &
command! ReferenceDirbaio !$BROWSER file://$HOME/Documents/Documentation/Dirbaio >/dev/null &
command! ReferenceCompProg !$BROWSER file://$HOME/Documents/Documentation/cplusplus/CompetitiveProgramming >/dev/null &
