" Watson airline integration

function! watson#status(...)
    let state = readfile(expand('~/Library/Application Support/watson/state'))
    let space = g:airline_symbols.space

    if state[0] != '{}'
        call airline#parts#define_text('watson_status', 'ⓦ ')
        call airline#parts#define_accent('watson_status', 'green')
        call a:1.add_section('airline_a', airline#section#create([space, 'watson_status', space]))
    endif
endfunction

call airline#add_statusline_func('watson#status')
