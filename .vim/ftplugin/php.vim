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
    exec "!ctags -h \".php\" -R --PHP-kinds=+cf --recurse --exclude=\"*/cache/*\" --exclude=\"*/logs/*\" --exclude=\"*/data/*\" --exclude=\"\.git\" --exclude=\.svn --totals=yes --languages=PHP --regex-PHP=\"/abstract class ([^ ]*)/\1/c/\" --regex-PHP=\"/interface ([^ ]*)/\1/c/\" --regex-PHP=\"/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/\" &"
endfunc

nmap <buffer> <silent> <F7> :call GenerateCtags()<cr>

" Open word under cursor with php.net
nmap <buffer> <silent> <leader>doc :!elinks http://fr.php.net/<C-R><C-W>\#function.<C-R><C-W><CR>

" Insert current namespace (based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>cns "%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

" PHP linter
nmap <buffer> <C-L> :!/usr/bin/php -l %<CR>
