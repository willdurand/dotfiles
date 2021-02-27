set tw=80

call litecorrect#init()
call lexical#init()

" Prettier
nmap <buffer> <leader>pp :!$(npm bin)/prettier --write %<CR>
