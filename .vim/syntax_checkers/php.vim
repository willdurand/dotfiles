"============================================================================
"File:        php.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_php_syntax_checker")
    finish
endif
let loaded_php_syntax_checker = 1

"bail if the user doesnt have php installed
if !executable("/Applications/MAMP/bin/php5/bin/php")
    finish
endif

function! SyntaxCheckers_php_GetLocList()
    let makeprg = "/Applications/MAMP/bin/php5/bin/php -l %"
    let errorformat='%-GNo syntax errors detected in%.%#,%-GErrors parsing %.%#,%-G\s%#,%EParse error: syntax error\, %m in %f on line %l'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
