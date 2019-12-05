" insert current namespace (based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>cns "%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

" PHP linter
nmap <buffer> <C-l> :!php -l %<CR>
