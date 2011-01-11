map <F1> :python debugger_resize()<cr>
map <F2> :python debugger_command('step_into')<cr>
map <F3> :python debugger_command('step_over')<cr>
map <F4> :python debugger_command('step_out')<cr>

map <Leader>dr :python debugger_resize()<cr>
map <Leader>di :python debugger_command('step_into')<cr>
map <Leader>do :python debugger_command('step_over')<cr>
map <Leader>dt :python debugger_command('step_out')<cr>

nnoremap ,e :python debugger_watch_input("eval")<cr>A

map <F5> :python debugger_run()<cr>
map <F6> :python debugger_quit()<cr>

map <F7> :python debugger_command('step_into')<cr>
map <F8> :python debugger_command('step_over')<cr>
map <F9> :python debugger_command('step_out')<cr>

map <F11> :python debugger_context()<cr>
map <F12> :python debugger_property()<cr>
map <F11> :python debugger_watch_input("context_get")<cr>A<cr>
map <F12> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>
