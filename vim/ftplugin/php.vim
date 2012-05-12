nmap <buffer> <silent> <F9> :call DebugMode()<cr>
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

" ctags
nmap <buffer> <silent> <F7> :call GenerateCtags()<cr>
func! GenerateCtags()
    exec "!ctags -h \".php\" --extra=+q --fields=+afiKmnSt --PHP-kinds=cifvj --recurse=yes --exclude=\"*/cache/*\" --exclude=\"*/logs/*\" --exclude=\"*/data/*\" --exclude=\"\.git\" --exclude=\.svn --totals=yes --languages=PHP --regex-PHP=\"/interface ([^ ]*)/\1/c/\" --regex-PHP=\"/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/\" &"
endfunc

" open word under cursor with php.net
nmap <buffer> <silent> <leader>doc :!elinks http://en.php.net/<C-R><C-W>\#function.<C-R>=substitute('<C-R><C-W>', '_', '-', 'g')<CR><CR>

" insert current namespace (based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>cns "%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

" PHP linter
nmap <buffer> <C-l> :!/usr/bin/php -l %<CR>

let g:pdv_cfg_Author        = "William DURAND <william.durand1@gmail.com>"
let g:pdv_cfg_License       = "MIT {@link http://opensource.org/licenses/mit-license.html}"
let g:pdv_cfg_php4always    = 0
let g:pdv_cfg_Uses          = 0
let g:pdv_cfg_php4always    = 0
let g:pdv_cfg_php4guess     = 0

" Completion
set complete=.,w,b,u,t,i,k~/.vim/syntax/php.api
au FileType php set omnifunc=phpcomplete#CompletePHP

" PHP Namespace autocomplete
nmap <buffer> <F5> :call PhpInsertUse()<CR>

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
