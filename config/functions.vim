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

    let s:filename = '_' . expand("%:r") . '.o'
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

command! -nargs=* -complete=file Run call AfterMakeC(<f-args>)<CR>

let g:jutge_testj='testj'
let g:jutge_folder='$HOME/Documents/jutge'
let g:jutge_fets_folder=g:jutge_folder . '/Fets'

function! JutgeTest(...)
    let s:jutge_flags = join(a:000)
    if has('nvim')
        exec 'term ' . g:jutge_testj . ' ' . s:jutge_flags . '"%"'
    else
        exec '!' . g:jutge_testj . ' ' . s:jutge_flags . '"%"'
    endif
endfunction

command! -nargs=? JutgeTest call TestJutge(<f-args>)<CR>

function! JutgeFet()
    let s:option = confirm("This will move the current file to " . g:jutge_fets_folder . " proceed?", "&Yes\n&no", 1)
    if s:option==1
        let s:filename = g:jutge_fets_folder . expand('/%')
        if filereadable(s:filename)
            let s:option = confirm("Overwrite" . s:filename, "&Yes\n&no", 1)
            if s:option == 1
                exec 'write! ' s:filename
            endif
        else 
            exec 'write ' s:filename
        endif
    endif
    call delete('%')
    bdelete!
endfunction

command! JutgeFet call JutgeFet()<CR>
command! JutgSearch exec 'Denite -path=' . g:jutge_fets_folder ' file_rec'
command! -nargs=? JutgGrep exec 'Denite -path=' . expand(g:jutge_fets_folder) ' grep -input=' . '<args>'

function! AfterAsync()
    if ( g:asyncrun_code == 0 )
        echom "Async finished; no errors reported"
    else
        echom "Async finished, returned code: " . g:asyncrun_code
        copen
    endif
endfunction
