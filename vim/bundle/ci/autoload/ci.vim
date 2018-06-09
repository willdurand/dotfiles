" autoload/ci.vim
" Author: William Durand <will+git@drnd.me>

function! ci#status()
  let _ = system(fugitive#buffer().repo().git_command('ci', '-v'))
  let s:ret = v:shell_error

  if s:ret == 0
    let s:status = "passing"
  elseif s:ret == 1
    let s:status = "failing"
  elseif s:ret == 2
    let s:status = "pending"
  else
    let s:status = "no status"
  endif

  echon '[ci status] ' . s:status
endfunction

function! ci#GetStatus()
  call ci#status()
endfunction
