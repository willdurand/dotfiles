nmap <buffer> <F1> :python debugger_resize()<cr>
nmap <buffer> <F2> :python debugger_command('step_into')<cr>
nmap <buffer> <F3> :python debugger_command('step_over')<cr>
nmap <buffer> <F4> :python debugger_command('step_out')<cr>

nmap <buffer> <leader>dr :python debugger_resize()<cr>
nmap <buffer> <leader>di :python debugger_command('step_into')<cr>
nmap <buffer> <leader>do :python debugger_command('step_over')<cr>
nmap <buffer> <leader>dt :python debugger_command('step_out')<cr>

nmap <buffer> <leader>e :python debugger_watch_input("eval")<cr>A<cr>

nmap <buffer> <F5> :python debugger_run()<cr>
nmap <buffer> <F6> :python debugger_quit()<cr>

nmap <buffer> <F7> :python debugger_command('step_into')<cr>
nmap <buffer> <F8> :python debugger_command('step_over')<cr>
nmap <buffer> <F9> :python debugger_command('step_out')<cr>

nmap <buffer> <F11> :python debugger_context()<cr>
nmap <buffer> <F12> :python debugger_property()<cr>
nmap <buffer> <F11> :python debugger_watch_input("context_get")<cr>A<cr>
nmap <buffer> <F12> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>

" ctags
nmap <buffer> <silent> <leader><F12> :silent !exec ~/.vim/ftplugin/php_ctags.sh &> /dev/null<cr>
set tags+=~/.vim/tags/symfony

" Open word under cursor with php.net
nmap <buffer> <silent> <leader>doc :!elinks http://fr.php.net/<C-R><C-W>\#function.<C-R><C-W><CR>
