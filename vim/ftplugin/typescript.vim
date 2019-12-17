runtime! ftplugin/javascript.vim

let g:flow#enable = 0

setlocal mouse=a
setlocal balloonexpr=tsuquyomi#balloonexpr()
setlocal balloonevalterm

nmap <buffer> <Leader>i :<C-u>echo tsuquyomi#balloonexpr()<CR>
