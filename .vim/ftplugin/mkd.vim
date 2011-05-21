command Mkd :!~/.scripts/markdown % > /tmp/mkdprev.html && open /tmp/mkdprev.html
nmap <buffer> <F5> :Mkd<CR>

" Github
" So Github is using Redcarpet (https://github.com/blog/832-rolling-out-the-redcarpet)
" to highlight markdown READMEs but gh-pages with Jekyll are using Pygments
" (http://pygments.org/). This is more or less the same syntax so this two commands
" are able to switch from one to the other.
"
" Redcarpet to Pygments
map <buffer> <leader>gh :%s/^\`\`\` \(.*\)/{% highlight \1 %}/g<cr>:%s/^\`\`\`/{% endhighlight %}/g<cr>
" Pygments to Redcarpet
map <buffer> <leader>hg :%s/^{% highlight \(.*\) %}/\`\`\` \1/g<cr>:%s/^{% endhighlight %}/\`\`\`/g<cr>
