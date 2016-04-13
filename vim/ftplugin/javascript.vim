" JavaScript linter
nmap <buffer> <C-L> :!PATH="$(npm bin):$PATH" eslint %<CR>

" Configure https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0

" 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
