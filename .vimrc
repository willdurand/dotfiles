" VIM Configuration
" Original comes from Vincent Jousse
" Modified by William Durand <william.durand1@gmail.com>

" Set title on X window
set title

" Global
set hidden ruler wmnu               " Hide buffer instead of abandoning when unloading

set wildmenu                        " Enhanced command line completion.
set wildmode=list:longest           " Complete files like a shell.
set wildignore=*/cache/**,*/logs/** " Ignore certain files

set showcmd                         " Display incomplete commands.
set showmode                        " Display the mode you're in.

set number                          " Show line numbers.
set ruler                           " Show cursor position.
set cursorline                      " Highlight current line.

set incsearch                       " Highlight matches as you type.
set hlsearch                        " Highlight matches.

set wrap                            " Turn on line wrapping.
set scrolloff=3                     " Show 3 lines of context around the cursor.

set visualbell                      " No beeping.

set backupdir=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp   " Keep swap files in one location
set directory=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp   " Keep swap files in one location

set nobackup                        " Don't make a backup before overwriting a file.
set nowritebackup                   " And again.
set noswapfile                      " Use an SCM instead of swap files

set laststatus=2                    " Show the status line all the time

" Make the view port scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Remap the marker char
nnoremap ' `
nnoremap ` '

" Command and search pattern history
set history=1000

set undolevels=1000             " use many levels of undo

" Redifinition of map leader
let mapleader = ","

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tabs and indentation. Yes, I like 4-space tabs (Symfony2 here we go !)
set tabstop=4
set shiftwidth=4

nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>

set expandtab
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set autoindent

syntax on

filetype on
filetype plugin on
filetype indent on

" Ctags
set nocp
set tags+=~/.vim/tags/symfony
set tags+=tags

"OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" Completion
set complete=.,w,b,u,t,i,k~/.vim/syntax/php.api
au FileType php set omnifunc=phpcomplete#CompletePHP

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Allow extended digraphs
set encoding=utf-8

" Enable folding by indentation
" Use: zc, zo, zC, zO, zR, zM
set foldmethod=indent
highlight Folded ctermfg=red
highlight FoldColumn ctermfg=white
set fillchars=fold:⋯
map zz zjzo
set nofoldenable

" My information
iab xdate <c-r>=strftime("%d/%m/%Y %H:%M:%S")
iab xname William DURAND<cr>
iab xsigp William DURAND <william.durand1@gmail.com><cr>
iab xsigw William DURAND <william.durand1@gmail.com><cr>

" Markdown
au! BufRead,BufNewFile *.markdown setfiletype mkd
au! BufRead,BufNewFile *.md setfiletype mkd

" reStructuredText
au! BufRead,BufNewFile *.rst setfiletype rst

" Twig
au BufNewFile,BufRead *.twig set filetype=twig

" PHP/HTML
let php_htmlInStrings = 1
let php_sql_query = 1                                                                                        

" Symfony plugin
let g:symfony_fuf = 1
map <c-F3> :SfSwitchView<cr>

" Snippet
autocmd FileType php set ft=php.symfony

" Encoding
set statusline+=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

" caractères invisibles
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶,trail:·

"jquery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

" C++
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" Vmail
let g:vmail_flagged_color = "ctermfg=yellow ctermbg=black cterm=bold"
