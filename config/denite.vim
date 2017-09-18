
call denite#custom#var('file_rec', 'command',
    \ ['rg', '--files', '--glob', '!.git', ''])

" Custom Denite menus
let s:menus = {}

" Denite menu {{{1
let s:menus.denite = { 'description': 'Defined denite menus' }

let s:menus.denite.command_candidates = [
    \ ['git commands       (Fugitive)   ', 'Denite menu:git'],
    \ ['Ycm commands                    ', 'Denite menu:ycm'],
    \ ['Jutge commands                  ', 'Denite menu:jutge'],
    \ ]

" YCM menu {{{1
let s:menus.ycm = { 'description' : 'Ycm commands' }

let s:menus.ycm.command_candidates = [
    \ ['Go to                                                          ,g ', 'YcmCompleter GoTo'],
    \ ['Fix it                                                         ,fx', 'YcmCompleter FixIt'],
    \ ['Diags                                                          ,d ', 'YcmDiags'],
    \ ['Force compile and diagnostics                                  ,fc', 'YcmForceCompileAndDiagnostics'],
    \ ['Show detailed diagnostic                                       ,sd', 'YcmShowDetailedDiagnostic'],
    \ ['Restart server                                                 ,rs', 'YcmRestartServer'],
    \ ['Go to declaration                                              ,gd', 'YcmCompleter GoToDeclaration'],
    \ ['Go to definition                                               ,gD', 'YcmCompleter GoToDefinition'],
    \ ['Go to imprecise                                                ,gI', 'YcmCompleter GoToImprecise'],
    \ ['Go to include                                                  ,gi', 'YcmCompleter GoToInclude'],
    \ ['Clear compilation flag cache                                   ,cc', 'YcmCompleter ClearCompilationFlagCache'],
    \ ['Get type                                                       ,Gt', 'YcmCompleter GetType'],
    \ ['Get type imprecise                                             ,GT', 'YcmCompleter GetTypeImprecise'],
    \ ['Get parent                                                     ,Gp', 'YcmCompleter GetParent'],
    \ ['Get doc                                                        ,Gd', 'YcmCompleter GetDoc'],
    \ ['Debug info                                                     ,di', 'YcmDebugInfo'],
    \ ['Toggle logs                                                    ,tl', 'YcmToggleLogs'],
    \ ['YcmCompleter                                                   ,yc', 'exe "YcmCompleter " input("Ycm command: ")'],
    \ ]

" Jutge menu {{{1
let s:menus.jutge = { 'description' : 'Jutge.org commands' }

let s:menus.jutge.command_candidates = [
            \ ['Add Cases                                   ', 'JutgeAddCases'],
            \ ['Download                                    ', 'JutgeDownload'],
            \ ['Fet                                         ', 'JutgeFet'],
            \ ['Get Name                                    ', 'JutgeGet Name'],
            \ ['Get Code                                    ', 'JutgeGet Code'],
            \ ['Get Statement                               ', 'JutgeGet Statement'],
            \ ['Get Samples                                 ', 'JutgeGet Samples'],
            \ ['Grep                                        ', 'JutgeGrep'],
            \ ['Search                                      ', 'JutgeSearch'],
            \ ['Test                                        ', 'JutgeTest'],
            \ ]

" Git menu (fugitive') {{{1
let s:menus.git = { 'description' : 'Git fugitive commands' }

let s:menus.git.command_candidates = [
    \ [' git status       (Fugitive)                                 ,gs', 'Gstatus'],
    \ [' git diff         (Fugitive)                                 ,gd', 'Gdiff'],
    \ [' git commit       (Fugitive)                                 ,gc', 'Gcommit'],
    \ [' git log          (Fugitive)                                 ,gl', 'exe "silent Glog | Unite quickfix"'],
    \ [' git blame        (Fugitive)                                 ,gb', 'Gblame'],
    \ [' git stage        (Fugitive)                                 ,gw', 'Gwrite'],
    \ [' git checkout     (Fugitive)                                 ,go', 'Gread'],
    \ [' git rm           (Fugitive)                                 ,gr', 'Gremove'],
    \ [' git mv           (Fugitive)                                 ,gm', 'exe "Gmove " input("destination: ")'],
    \ [' git push         (Fugitive, buffer output)                  ,gp', 'Git! push'],
    \ [' git pull         (Fugitive, buffer output)                  ,gP', 'Git! pull'],
    \ [' git prompt       (Fugitive, buffer output)                  ,gi', 'exe "Git! " input("git command: ")'],
    \ [' git cd           (Fugitive)                                 ,gC', 'Gcd'],
    \ ]

call denite#custom#var('menu', 'menus', s:menus)
