" open word under cursor with php.net
nmap <buffer> <silent> <leader>doc :!links https://php.net/manual/en/function.<C-R>=substitute('<C-R><C-W>', '_', '-', 'g')<CR>.php\\#function.<C-R>=substitute('<C-R><C-W>', '_', '-', 'g')<CR><CR>

" insert current namespace (based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>cns "%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

" PHP linter
nmap <buffer> <C-l> :!php -l %<CR>

" Completion
set complete=.,w,b,u,t,i,k~/.vim/syntax/php.api
au FileType php set omnifunc=phpcomplete#CompletePHP

let php_htmlInStrings   = 1
let php_sql_query       = 1

" jump to a twig view in symfony
set path+=**
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

" create a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>

" export code snippet with syntax highlighting
map <buffer> <C-c> :RTFHighlight php<cr>

" insert getter/setter
nmap <buffer> <leader>gs :InsertBothGetterSetter<cr>

" symfony plugin
let g:symfony_app_console_path="bin/console"
