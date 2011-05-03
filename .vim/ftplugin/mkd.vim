command Mkd :!~/.scripts/markdown % > /tmp/mkdprev.html && open /tmp/mkdprev.html
nmap <buffer> <F5> :Mkd<CR>
