" open word under cursor with php.net
nmap <buffer> <silent> <leader>doc :!links https://php.net/manual/en/function.<C-R>=substitute('<C-R><C-W>', '_', '-', 'g')<CR>.php\\#function.<C-R>=substitute('<C-R><C-W>', '_', '-', 'g')<CR><CR>

" insert current namespace (based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>cns "%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

" PHP linter
nmap <buffer> <C-l> :!php -l %<CR>

let php_htmlInStrings   = 1
let php_sql_query       = 1

" export code snippet with syntax highlighting
map <buffer> <C-c> :RTFHighlight php<cr>

" insert getter/setter
nmap <buffer> <leader>gs :InsertBothGetterSetter<cr>

" symfony plugin
let g:symfony_app_console_path="bin/console"
