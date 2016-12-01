" JavaScript linter
nmap <buffer> <C-L> :!PATH="$(npm bin):$PATH" eslint --no-ignore %<CR>

" Configure https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0

" 2 spaces
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2

" 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Configure https://github.com/flowtype/vim-flow
let g:flow#autoclose = 1
let g:flow#omnifunc = 0
