" VIM Configuration
" The original config comes from Vincent Jousse
" Modified by William Durand <william.durand1@gmail.com>

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Set title on X window
set title

" Global
set hidden ruler wmnu               " Hide buffer instead of abandoning when unloading

set wildmenu                        " Enhanced command line completion
set wildmode=list:longest           " Complete files like a shell
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*app/cache/**,*app/logs/**,*/zend/**,*/bootstrap.*.*

set showcmd                         " Display incomplete commands
set showmode                        " Display the mode you're in

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

" redifinition of map leader
let mapleader = ","

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

" pull word under cursor into Ack for a global search
map <leader>za :Ack "<C-r>=expand("<cword>")<CR>"

" start a substitute
map <leader>s :%s/

" ack
nmap <leader>a :Ack<space>

" Clear search highlight
map <silent> <leader>/ :let @/=""<CR>:echo "Cleared search register."<cr>

syntax on

filetype on
filetype plugin on
filetype indent on

" Color scheme
let &t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" GitGutter
let g:gitgutter_sign_column_always = 1
" See: https://github.com/airblade/vim-gitgutter#faq
highlight clear SignColumn
highlight GitGutterAdd      guifg=#009900 guibg=NONE ctermfg=2 ctermbg=235
highlight GitGutterChange   guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=235
highlight GitGutterDelete   guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=235

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Ctags
set nocp
set tags=tags,vendor.tags
map <silent><leader><Left> <C-T>
map <silent><leader><Right> <C-]>
map <silent><leader><Up> <C-W>]

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
iab xsigp <C-R> William Durand <william.durand1@gmail.com>
iab xsigw <C-R> William Durand <william.durand1@gmail.com>

" snipMate
let g:snips_author = 'William Durand <william.durand1@gmail.com>'

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

" Does not work under version 7.1.6
if version >= 716
    autocmd BufWinLeave * call clearmatches()
endif

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
autocmd BufWritePre *.md,*.markdown,*.mkd,*.pp*.php,*.yml,*.xml,*.js,*.html,*.css,*.java,*.c,*.cpp,*.vim :call StripTrailingWhitespace()

" tab mappings
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>
map <leader>tr :tabrewind<cr>

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
let g:gist_clip_command     = 'pbcopy'
let g:gist_detect_filetype  = 1
let g:gist_post_private     = 1

" ctrlp
let g:ctrlp_map                 = '<leader>t'
let g:ctrlp_clear_cache_on_exit = 0

" Twig
au BufNewFile,BufRead *.twig set filetype=twig
autocmd BufEnter *.html.twig nmap <buffer><leader>c :bf<CR>

" behat
let feature_filetype='behat'

" make
map <leader>m :make<cr>
