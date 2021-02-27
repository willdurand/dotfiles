set tw=65

if exists('&colorcolumn')
    set colorcolumn=65
endif

highlight TexComments ctermfg=white
match TexComments /%.*/
match TexComments /%.*/
match TexComments /%.*/
call clearmatches()

call litecorrect#init()
call lexical#init()
