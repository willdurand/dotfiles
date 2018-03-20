" JavaScript linter
nmap <buffer> <C-L> :!PATH="$(npm bin):$PATH" eslint --no-ignore --fix %<CR>

" Configure https://github.com/flowtype/vim-flow
let g:flow#enable = 1
let g:flow#autoclose = 1
let g:flow#omnifunc = 0
let g:flow#timeout = 10

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif
