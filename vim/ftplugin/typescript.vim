" QuickFix window will automatically appear if `:make` has any errors.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Run `:make` on save.
autocmd BufWritePost <buffer> make
