" Location:   autoload/srht.vim
" Maintainer: William Durand <will+git@drnd.me>
" License:    MIT

" Sanity checks
if exists('g:autoloaded_srht')
  finish
endif
let g:autoloaded_srht = 1

if !executable('curl')
  echohl ErrorMsg
  echomsg 'srht.vim requires the ''curl'' command, aborting.'
  echohl None
  finish
endif

if globpath(&rtp, 'autoload/webapi/http.vim') ==# ''
  echohl ErrorMsg
  echomsg 'srht.vim requires the ''webapi'' plugin, '
  echomsg 'visit https://github.com/mattn/webapi-vim to install it.'
  echohl None
  finish
else
  " Make sure the webapi plugin works.
  call webapi#json#true()
endif

" Configuration: paste
if !exists('g:srht_paste_default_visibility')
  let g:srht_paste_default_visibility = 'unlisted'
endif

if !exists('g:srht_paste_domain')
  let g:srht_paste_domain = 'paste.sr.ht'
endif

" Configuration: git
if !exists('g:srht_git_domain')
  let g:srht_git_domain = 'git.sr.ht'
endif

" Internal variables
let s:srht_token_file = expand(get(g:, 'srht_token_file', '~/.srht-vim'))
let s:srht_paste_url = 'https://'.g:srht_paste_domain.'/'

" Helper functions
function! s:print_error(msg) abort
  echohl ErrorMsg
  echomsg a:msg
  echohl None
endfunction

function! s:get_current_filename() abort
  let filename = expand('%:t')

  if filename ==# ''
    let filename = printf('paste.txt')
  endif

  return filename
endfunction

function! s:get_srht_token() abort
  let token = ''

  if filereadable(s:srht_token_file)
    let val = join(readfile(s:srht_token_file), '')
    if type(val) == 1
      let token = val
    endif
  endif

  if len(token) > 0
    return token
  endif

  redraw
  echohl WarningMsg
  echo 'srht.vim: a personal access token is required, '
    \.'visit: https://meta.sr.ht/oauth/personal-token to create a new one.'
  echohl None

  " Ask user to enter the newly created access token.
  let token = inputsecret('Access token: ')
  if len(token) == 0
    let v:errmsg = 'invalid value, command aborted.'
    return ''
  endif

  " Write the token to the file.
  call writefile([token], s:srht_token_file)
  return token
endfunction

function! s:srht_post_paste(visibility) abort
  " See: https://man.sr.ht/paste.sr.ht/api.md#post-apipastes
  let paste = { 'visibility': a:visibility, 'files' : [] }

  " TODO: add support for multiple buffers

  echo 'Creating paste content... '
  let contents = join(getline(1, line('$')), "\n")
  let paste['files'] = [
  \ { 'contents': contents, 'filename': s:get_current_filename() }
  \]

  let token = s:get_srht_token()
  if len(token) == 0
    redraw
    call s:print_error(v:errmsg)
    return
  endif

  redraw
  echon 'Publishing paste... '

  let headers = {
  \ 'Content-Type': 'application/json',
  \ 'Authorization': 'token '.token,
  \}
  let post_url = s:srht_paste_url.'api/pastes'
  let res = webapi#http#post(post_url, webapi#json#encode(paste), headers)
  let data = webapi#json#decode(res.content)

  redraw
  let url = ''

  if res.status =~# '^2'
    " Build URL
    let url = s:srht_paste_url.data.user.canonical_name.'/'.data.sha
    echomsg 'Done: '.url
  else
    for error in data.errors
      call s:print_error('Error: '.error.reason)
    endfor
  endif

  return url
endfunction

function! s:srht_get_paste(sha) abort
  let token = s:get_srht_token()
  if len(token) == 0
    redraw
    call s:print_error(v:errmsg)
    return
  endif

  let headers = {
  \ 'Content-Type': 'application/json',
  \ 'Authorization': 'token '.token,
  \}

  redraw
  echon 'Getting paste... '

  let res = webapi#http#get(s:srht_paste_url.'api/pastes/'.a:sha, '', headers)

  if res.status !~# '^2'
    redraw
    call s:print_error('could not retrieve paste "'.a:sha.'".')
    return
  endif

  let data = webapi#json#decode(res.content)

  " TODO: add support for other files and not just the first one.

  let filename = data.files[0].filename
  let blob_id = data.files[0].blob_id

  unlet res
  unlet data

  let res = webapi#http#get(s:srht_paste_url.'api/blobs/'.blob_id, '', headers)

  if res.status !~# '^2'
    redraw
    call s:print_error('could not retrieve blob "'.blob_id.'".')
    return
  endif

  let data = webapi#json#decode(res.content)

  " Create new scratch buffer with the content of the first file.
  enew
  silent execute 'file' fnameescape(filename)
  setlocal buftype=nofile bufhidden=delete noswapfile
  call setline(1, split(data.contents, "\n"))

  redraw
  echo
endfunction

" Public functions
function! srht#Paste(...) abort
  redraw

  let visibility = g:srht_paste_default_visibility
  let paste_sha = ''

  if a:0 > 0
    let arg = a:1

    if arg =~# '^\(-h\|--help\)$\C'
      help :Gist
      return
    elseif arg =~# '^\(-p\|--private\)$\C'
      let visibility = 'private'
    elseif arg =~# '^\(-u\|--unlisted\)$\C'
      let visibility = 'unlisted'
    elseif arg =~# '^\(-P\|--public\)$\C'
      let visibility = 'public'
    elseif len(arg) == 40
      let paste_sha = arg
    else
      call s:print_error('invalid argument: '.arg)
      return
    endif
  endif

  if len(paste_sha) > 0
    call s:srht_get_paste(paste_sha)
  else
    let url = s:srht_post_paste(visibility)

    " Add URL to clipboard.
    if type(url) == 1 && len(url) > 0
      if has('clipboard')
        let @+ = url
      else
        let @" = url
      endif
    endif
  endif
endfunction

function! srht#FugitiveHandler(opts, ...)
  let path   = substitute(get(a:opts, 'path', ''), '^/', '', '')
  let line1  = get(a:opts, 'line1')
  let line2  = get(a:opts, 'line2')
  let remote = get(a:opts, 'remote')

  if remote !~# g:srht_git_domain
    return ''
  endif

  " Instead of trying to detect the protocol, etc., we know that sourcehut
  " uses a tilde to prefix usernames so let's use that. Everything before the
  " first occurrence should be omitted, the rest is the project path (without
  " tilde, which needs to be added back).
  let parts = split(remote, '\~')
  let project_path = '~'.join(parts[1:-1], '~')
  let project_url = 'https://'.g:srht_git_domain.'/'.project_path.'/tree/'

  if a:opts.commit =~# '^\d\=$'
    let commit = a:opts.repo.rev_parse('HEAD')
  else
    let commit = a:opts.commit
  endif

  let url = project_url.commit

  if !empty(path)
    let url = url.'/item/'.path
  endif

  if get(a:opts, 'type', '') ==# 'blob' || path =~# '[^/]$'
    " We add `?view-source` because some files are rendered instead of showing
    " the source code. It's not so much a problem when we browse an entire
    " file but when we specify a line or range, we should end up on the source
    " view. It looks like the query string parameter is ignored when a file
    " does not have a renderer, so let's pass this parameter all the time.
    if line2 && line1 == line2
      let url .= '?view-source#L'.line1
    elseif line2
      let url .= '?view-source#L'.line1.'-'.line2
    endif
  endif

  return url
endfunction
