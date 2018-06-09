" plugin/ci.vim
" Author: William Durand <will+git@drnd.me>

if exists("g:loaded_ci") || v:version < 700 || &cp
  finish
endif
let g:loaded_ci = 1

command! CI call ci#GetStatus()
