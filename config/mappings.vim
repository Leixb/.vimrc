" Custom keymaps

let mapleader=" "
inoremap jk <Esc>
cnoremap jk <C-c>

" More normal behaviour for Y
nnoremap Y y$

"nnoremap <C-S-L> :nohl<CR><C-L>"
nnoremap <leader>r :nohl<CR><C-L>"

" F maps {{{1
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :bp!<CR>
nnoremap <F3> :bn!<CR>
nnoremap <F4> :TagbarToggle<CR>

" Buferexplorer
nmap <F5> <leader>be
"ROT13
nnoremap <F6> mtggg?G`t

function AfterAsync()
    if ( g:asyncrun_code == 0 )
        echom "Async finished; no errors reported"
    else
        echom "Async finished, returned code: " . g:asyncrun_code
        copen
    endif
endfunction

" Compile Async
nnoremap <F9> :exec ':AsyncRun -post=:call\ AfterAsync() '. expand(&makeprg)<CR>

"Fix Identation
nnoremap <F12> mtgg=G`t 

" Leader keymaps {{{1
nnoremap <Leader>c :set cursorline! <CR>

noremap <Leader>ev :vsplit $MYVIMRC<CR>
noremap <Leader>sv :source $MYVIMRC<CR>

noremap <Leader>bd :bdelete!<CR>

noremap <leader>db :term gdb "_%:r.o"<CR>
noremap <leader>vc :e _local_settings_vim_danger<CR>
noremap <leader>mk :make<CR>
noremap <leader>bn :bn!<CR>
noremap <leader>bp :bp!<CR>

" Custom plugins mappings {{{1

" YCM {{{2
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <leader>gt :YcmCompleter GetType<CR>
noremap <leader>fx :YcmCompleter FixIt<CR>
map <silent> <F8> :YcmForceCompileAndDiagnostics<CR><CR>

" List Toggle {{{2
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" UltiSnips {{{2
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F5>"
let g:UltiSnipsJumpForwardTrigger="<F5>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Denite {{{2
" Denite Ctrl-p
nnoremap <c-p>  :Denite file_rec<CR>

" Denite Bufer explorer
nnoremap <leader>be :Denite buffer<CR>

" Denite vim-grep
nnoremap <leader>fg :Denite -auto-preview grep<CR>

" Denite vimconfig
nnoremap <leader>vc :Denite -path=~/.vim/config file_rec<CR>

" Denite search lines
nnoremap <leader>dl :Denite line<CR>


" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Disable Arrows and Esc to train {{{1
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
inoremap <ESC> <nop>

" Easier keys to move between splits {{{1
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


if (!has('nvim'))

" VIM mappings {{{1

" Filetype maps {{{2
augroup filetype_maps_vim
    autocmd!
    autocmd Filetype java map <C-F9> :make<CR><CR>:!java "%:r"<CR>
    autocmd Filetype tex map <C-F9> :!pkill mupdf <CR><CR> :!mupdf "%:r.pdf" & <CR><CR>
augroup END

" Jutge mappings {{{2
nnoremap <silent> <F7> :Ss<CR>
nnoremap <silent> <C-F7> :Wj<CR>
nnoremap <F10> :Tj<CR>
nnoremap <C-F10> :call FetJutge()<CR>

" Compilation mappings {{{2
nnoremap <C-F8> :call AfterMakeCwithIn()<CR>
nnoremap <C-F9> :call AfterMakeC()<CR>


else

" NVIM mappings {{{1

" Jutge.org keymaps {{{2
nnoremap <silent> <F7> :Ss<CR>
nnoremap <silent> <F31> :Wj<CR>
nnoremap <F33> :term ./"_%:r.o"<CR>
nnoremap <F10> :Tj<CR>
nnoremap <F34> :call FetJutge()<CR>

" Compile commands {{{2
nnoremap <F32> :call AfterMakeCwithIn()<CR>
nnoremap <F33> :call AfterMakeC()<CR>


" Filetype Specify keymaps {{{2

augroup filetype_maps_nvim
    autocmd!
    autocmd Filetype python map <F33> :term "./%"<CR>
    autocmd Filetype python3 map <F33> :term "./%"<CR>
    autocmd Filetype sh map <F33> :term "./%"<CR>
    autocmd Filetype java map <F33> :term java "%:r"<CR>
    autocmd Filetype tex map <F33> :!pkill mupdf <CR><CR> :!mupdf "%:r.pdf" & <CR><CR>
    autocmd Filetype markdown map <F33> :!pkill mupdf <CR><CR> :!mupdf "%:r.pdf" & <CR><CR>
    autocmd Filetype haskell map <F33> :term runghc "%"<CR>
augroup END

" Terminal mappings {{{2
tnoremap <Esc> <C-\><C-n>


endif
