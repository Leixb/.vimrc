" Custom keymaps

let mapleader=" "
inoremap jk <Esc>
cnoremap jk <C-c>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

" More normal behaviour for Y
nnoremap Y y$

" Make dot work on visual lines
xnoremap . :norm.<CR>
" Macro on visual line selction (only q macro)
xnoremap Q :'<,'>:normal @q<CR>

"nnoremap <C-S-L> :nohl<CR><C-L>"
nnoremap <leader>r :nohl<CR><C-L>"

" F maps {{{1
nnoremap <silent> <special> <F1> :NERDTreeToggle <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd p <Bar> endif<CR>
nnoremap <silent> <F2> :bp!<CR>
nnoremap <silent> <F3> :bn!<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>

" Buferexplorer
nmap <F5> <leader>be
"ROT13
nnoremap <F6> mtggg?G`t

" Compile Async
nnoremap <F9> :exec ':AsyncRun -post=:call\ AfterAsync() '. expand(&makeprg)<CR>

"Fix Identation
nnoremap <F12> mtgg=G`t

" Leader keymaps {{{1
nnoremap <silent> <Leader>c :set cursorline! <CR>

noremap <silent> <Leader>ev :vsplit $MYVIMRC<CR>
noremap <silent> <Leader>sv :source $MYVIMRC<CR>

noremap <silent> <Leader>bd :bdelete!<CR>

noremap <silent> <leader>db :term gdb "_%:r"<CR>
noremap <silent> <leader>vc :e _local_settings_vim_danger<CR>
noremap <silent> <leader>mk :make<CR>
noremap <silent> <leader>bn :bn!<CR>
noremap <silent> <leader>bp :bp!<CR>

" Custom plugins mappings {{{1

" YCM {{{2
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>fx :YcmCompleter FixIt<CR>
noremap <silent> <F8> :YcmForceCompileAndDiagnostics<CR><CR>

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
nnoremap <CR> :Denite -auto-preview grep<CR>

" Denite vimconfig
nnoremap <leader>vc :Denite -path=~/.vim/config file_rec<CR>

" Denite search lines
nnoremap <leader>dl :Denite -auto-preview line<CR>
nnoremap <tab>      :Denite -auto-preview line<CR>

" Denite jk to exit inser mode
call denite#custom#map('insert','jk', '<denite:enter_mode:normal>','noremap')

" Latex-Box "{{{2
inoremap ]] <Plug>LatexCloseCurEnv
nnoremap <leader>lce <Plug>LatexChangeEnv
nnoremap <leader>lts <Plug>LatexToggleStarEnv
vnoremap <leader>lwc <Plug>LatexWrapSelection
vnoremap <leader>lwe <Plug>LatexEnvWrapSelection

" Disable Arrows and Esc to train {{{1
"inoremap <Up> <nop>
"inoremap <Down> <nop>
"inoremap <Right> <nop>
"inoremap <Left> <nop>
"inoremap <ESC> <nop>

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
    autocmd Filetype tex map <C-F9> :!zathura "%:r.pdf" & <CR><CR>
augroup END

" Jutge mappings {{{2
nnoremap <F10> :call JutgeTest()<CR>
nnoremap <C-F10> :call JutgeFet()<CR>

" Compilation mappings {{{2
nnoremap <C-F8> :call AfterMakeCwithIn()<CR>
nnoremap <C-F9> :call AfterMakeC()<CR>

else

" NVIM mappings {{{1

" Jutge.org keymaps {{{2
nnoremap <F10> :call JutgeTest()<CR>
nnoremap <F34> :call JutgeFet()<CR>

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
    autocmd Filetype tex map <F33> :!zathura "%:r.pdf" & <CR><CR>
    autocmd Filetype markdown map <F33> :!zathura "%:r.pdf" & <CR><CR>
    autocmd Filetype haskell map <F33> :term runghc "%"<CR>
augroup END

" Terminal mappings {{{2
tnoremap <Esc> <C-\><C-n>

endif
