" shrt.vim - A vim plugin to interact with sourcehut.
" Maintainer: William Durand <will+git@drnd.me>
" License:    MIT
" Version:    1.0.0

if &compatible || exists("g:loaded_shrt")
  finish
endif
let g:loaded_shrt = 1

if !exists('g:fugitive_browse_handlers')
  let g:fugitive_browse_handlers = []
endif

if index(g:fugitive_browse_handlers, function('srht#FugitiveHandler')) < 0
  call insert(g:fugitive_browse_handlers, function('srht#FugitiveHandler'))
endif

command! -nargs=? SrhtPaste :call srht#Paste(<f-args>)
