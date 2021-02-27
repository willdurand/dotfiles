runtime! ftplugin/javascript.vim

setlocal mouse=a
setlocal balloonexpr=tsuquyomi#balloonexpr()
setlocal balloonevalterm

nmap <buffer> <Leader>i :<C-u>echo tsuquyomi#balloonexpr()<CR>
