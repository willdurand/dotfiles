set tw=80

" https://github.com/reedes/vim-litecorrect
let user_dict = {
    \ 'if and only if': ['iff'],
    \ 'do not': ['dont', 'don''t'],
    \ 'does not': ['doesnt', 'doesn''t'],
    \ 'cannot': ['can''t'],
    \ }

set iskeyword+=' " so that it supports: don't => do not, etc.
call litecorrect#init(user_dict)
call lexical#init()

" Prettier
nmap <buffer> <leader>pp :!$(npm bin)/prettier --write %<CR>
