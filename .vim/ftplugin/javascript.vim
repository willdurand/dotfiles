" JavaScript linter
nmap <buffer> <C-L> :!gjslint --strict --custom_jsdoc_tags 'api,memberOf' %<CR>

setlocal nocindent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
