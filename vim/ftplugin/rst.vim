command Rst :!~/.scripts/rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html
nmap <buffer> <F5> :Rst<CR>
