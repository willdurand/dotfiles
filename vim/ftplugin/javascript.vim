" JavaScript linter
nmap <buffer> <C-L> :!$(npm bin)/eslint --no-ignore --fix %<CR>
" Prettier
nmap <buffer> <leader>pp :!$(npm bin)/prettier --write %<CR>

function! AddFocusJestTestCase()
  ?^\s*\(it\|describe\)(
  s/\(it\|describe\)(/\1.only(/
  :w
endfunction

nmap <leader>f :call AddFocusJestTestCase()<CR>

" snippets completion
setlocal completefunc=functions#ListSnippets
