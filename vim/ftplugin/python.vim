" Flake8
nmap <buffer> <C-l> :call Flake8()<CR>

nmap <buffer> <leader>pp :!autopep8 --in-place --aggressive --aggressive %<CR>
