" JavaScript linter
nmap <buffer> <C-L> :!PATH="$(npm bin):$PATH" eslint %<CR>

" Configure https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0
