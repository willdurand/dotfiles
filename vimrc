" VIM Configuration
" The original config comes from Vincent Jousse
" Heavily modified by William Durand <will+git@drnd.me>
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on

filetype on
filetype plugin on
filetype indent on

" Color scheme
let &t_Co=256
let g:solarized_termcolors=256

set background=dark
colorscheme solarized

" redifinition of map leader
let mapleader = ","

" Set title on X window
set title

" Global
set hidden ruler wmnu               " Hide buffer instead of abandoning when unloading

set wildmenu                        " Enhanced command line completion
set wildmode=list:longest           " Complete files like a shell
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.xpm,*.pyc,*.pyo,*app/cache/**,*app/logs/**,*/zend/**,*/bootstrap.*.*

" http://vim.wikia.com/wiki/FileName_Completion_in_Shell_Scripts
set isfname-==

set showcmd                         " Display incomplete commands

set number                          " Show line numbers
set ruler                           " Show cursor position

"set cursorline                      " Highlight current line.

set incsearch                       " Highlight matches as you type
set hlsearch                        " Highlight matches
set ignorecase                      " set case insensitivity
set smartcase                       " unless there's a capital letter
set wrap                            " Turn on line wrapping
set scrolloff=3                     " Show 3 lines of context around the cursor

set visualbell                      " No beeping
set shortmess+=filmnrxoOtT          " abbrev. of messages (avoids 'hit enter')

set nobackup                        " Don't make a backup before overwriting a file
set nowritebackup                   " And again
set noswapfile                      " Use an SCM instead of swap files

set laststatus=2                    " Show the status line all the time

set backspace=indent,eol,start      " http://vim.wikia.com/wiki/Backspace_and_delete_problems

set expandtab
set copyindent                      " copy the previous indentation on autoindenting
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                       " set show matching parenthesis
set autoindent

set undolevels=1000                 " use many levels of undo

if version >= 730
    set noundofile                  " Don't keep a persistent undofile
endif

" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
" F2 = toggle paste mode
nnoremap <F2> :set invpaste paste?<Enter>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" make the view port scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <C-p> 3<C-p>

" resize splitted views faster
nnoremap <C-w>< 5<C-w><
nnoremap <C-w>> 5<C-w>>

" remap the marker char
nnoremap ' `
nnoremap ` '

" command and search pattern history
set history=10000

" make plugins smoother
set lazyredraw

" always replace all occurences of a line
set gdefault

" Tabs and indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4

" convenient mapping to swith tab/indent settings
nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

" sudo to write
command W w !sudo tee % > /dev/null

" pull word under cursor into LHS of a substitute (for quick search and replace)
nmap <leader>zs :%s/<C-r>=expand("<cword>")<CR>/

" pull word under cursor into ag for a global search
map <leader>za :Ag "<C-r>=expand("<cword>")<CR>"

" start a substitute
map <leader>s :%s/

" ag
nmap <leader>a :Ag<space>

" Clear search highlight
map <silent> <leader>/ :let @/=""<CR>:echo "Cleared search register."<cr>

" GitGutter
let g:gitgutter_sign_column_always = 1
" see: https://github.com/airblade/vim-gitgutter#faq
highlight SignColumn        ctermbg=235
highlight GitGutterAdd      guifg=#009900 guibg=NONE ctermfg=2 ctermbg=235
highlight GitGutterChange   guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=235
highlight GitGutterDelete   guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=235

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
set noshowmode

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" When editing a file, always jump to the last known cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" allow extended digraphs
set encoding=utf-8

" disable folding
set nofoldenable

" My information
iab xdate <C-R>=strftime("%d/%m/%Y %H:%M:%S")
iab xname <C-R> William Durand
iab xsigp <C-R> William Durand <will+git@drnd.me>

" snipMate
let g:snips_author = 'William Durand <will+git@drnd.me>'

" invisible character
nmap <leader>l :set list!<CR>
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¬,trail:·

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
autocmd BufWritePre *.* :call StripTrailingWhitespace()

" create directory if not exists
au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

" do not auto insert comment chars on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Gist
let g:gist_clip_command    = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private    = 1

" ctrlp
let g:ctrlp_map                 = '<leader>t'
let g:ctrlp_clear_cache_on_exit = 0

" make
map <leader>m :make<cr>

" Highlight words to avoid in tech writing
" ========================================
"
"   http://css-tricks.com/words-avoid-educational-writing/
"   https://github.com/pengwynn/dotfiles/blob/12159ea233180344be4e25d57056ccd37061a153/vim/vimrc.symlink
"
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
autocmd BufWinLeave * call clearmatches()

" Clipboard
set clipboard=unnamed

" Read vim config defined in files
set modeline
set modelines=1

" Format JSON
map <leader>j !python -m json.tool<CR>

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" display vertical line
if exists('&colorcolumn')
    set colorcolumn=80
endif

" Highlight cursor line
" https://github.com/chanmix51/vim-config/blob/master/vimrc
autocmd insertEnter * set cursorline
autocmd insertLeave * set nocursorline
autocmd insertEnter *.yml set cursorcolumn
autocmd insertLeave *.yml set nocursorcolumn

" https://github.com/reedes/vim-litecorrect
let user_dict = {
    \ 'if and only if': ['iff'],
    \ 'do not': ['dont', 'don''t'],
    \ 'cannot': ['can''t'],
    \ }

set iskeyword+=' " so that it supports: don't => do not, etc.
call litecorrect#init(user_dict)
