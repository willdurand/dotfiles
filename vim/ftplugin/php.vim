func! DebugMode()
    nmap <buffer> <F1> :python debugger_resize()<cr>
    nmap <buffer> <F2> :python debugger_command('step_into')<cr>
    nmap <buffer> <F3> :python debugger_command('step_over')<cr>
    nmap <buffer> <F4> :python debugger_command('step_out')<cr>

    nmap <buffer> <leader>e :python debugger_watch_input("eval")<cr>A<cr>

    nmap <buffer> <F5> :python debugger_run()<cr>
    nmap <buffer> <F6> :python debugger_quit()<cr>

    nmap <buffer> <F11> :python debugger_context()<cr>
    nmap <buffer> <F12> :python debugger_property()<cr>
endfunc

nmap <buffer> <silent> <F9> :call DebugMode()<cr>

" ctags
func! GenerateCtags()
    exec "!ctags -h \".php\" --extra=+q --fields=+afiKmnSt --PHP-kinds=cifvj --recurse=yes --exclude=\"*/cache/*\" --exclude=\"*/logs/*\" --exclude=\"*/data/*\" --exclude=\"\.git\" --exclude=\.svn --totals=yes --languages=PHP --regex-PHP=\"/interface ([^ ]*)/\1/c/\" --regex-PHP=\"/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/\" &"
endfunc

nmap <buffer> <silent> <F7> :call GenerateCtags()<cr>

" Open word under cursor with php.net
nmap <buffer> <silent> <leader>doc :!elinks http://fr.php.net/<C-R><C-W>\#function.<C-R>=substitute('<C-R><C-W>', '_', '-', 'g')<CR><CR>

" Insert current namespace (based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>cns "%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

" PHP linter
nmap <buffer> <C-L> :!/usr/bin/php -l %<CR>

let g:pdv_cfg_Author = "William DURAND <william.durand1@gmail.com>"
let g:pdv_cfg_License = "MIT {@link http://opensource.org/licenses/mit-license.html}"
let g:pdv_cfg_php4always = 0 " Ignore PHP4 tags
" Wether to create @uses tags for implementation of interfaces and inheritance
let g:pdv_cfg_Uses = 0
" Wether for PHP5 code PHP4 tags should be set, like @access,... (1|0)?
let g:pdv_cfg_php4always = 0
" Wether to guess scopes after PEAR coding standards:
" $_foo/_bar() == <private|protected> (1|0)?
let g:pdv_cfg_php4guess = 0

" Completion
set complete=.,w,b,u,t,i,k~/.vim/syntax/php.api
au FileType php set omnifunc=phpcomplete#CompletePHP

" PHP Namespace autocomplete:w
nmap <buffer> <F5> :call PhpInsertUse()<CR>
