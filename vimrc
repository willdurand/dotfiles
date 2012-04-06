" VIM Configuration
" Original comes from Vincent Jousse
" Modified by William Durand <william.durand1@gmail.com>

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Set title on X window
set title

" Global
set hidden ruler wmnu               " Hide buffer instead of abandoning when unloading

set wildmenu                        " Enhanced command line completion.
set wildmode=list:longest           " Complete files like a shell.
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*/cache/**,*/logs/**,*/zend/**,*/bootstrap.* " Ignore certain files

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
set shortmess+=filmnrxoOtT          " abbrev. of messages (avoids 'hit enter')

set nobackup                        " Don't make a backup before overwriting a file.
set nowritebackup                   " And again.
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

" Make the view port scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Resize splitted views faster
nnoremap <C-w>< 5<C-w><
nnoremap <C-w>> 5<C-w>>

" Remap the marker char
nnoremap ' `
nnoremap ` '

" Command and search pattern history
set history=1000

" Redifinition of map leader
let mapleader = ","

" make plugins smoother
set lazyredraw

" Always replace all occurences of a line
set gdefault

" Tabs and indentation. Yes, I like 4-space tabs (Symfony2 here we go !)
set tabstop=4
set shiftwidth=4
set softtabstop=4

nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

" Sudo to write
command W w !sudo tee % > /dev/null

" Pull word under cursor into LHS of a substitute (for quick search and replace)
nmap <leader>zs :%s/<C-r>=expand("<cword>")<CR>/

" Pull word under cursor into Ack for a global search
map <leader>za :Ack "<C-r>=expand("<cword>")<CR>"

" Start a substitute
map <leader>s :%s/

" Ack
nmap <leader>a :Ack<space>

" Clear search highlight
map <silent> <leader>/ :let @/=""<CR>:echo "Cleared search register."<cr>

syntax on

filetype on
filetype plugin on
filetype indent on

" Color scheme
let &t_Co=256         " force the 256-color mode
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Powerline
let g:Powerline_symbols = 'fancy'

" Ctags
set nocp
set tags=tags
map <silent><leader><Left> <C-T>
map <silent><leader><Right> <C-]>
map <silent><leader><Up> <C-W>]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Allow extended digraphs
set encoding=utf-8

" Disable folding
set nofoldenable

" My information
iab xdate <C-R>=strftime("%d/%m/%Y %H:%M:%S")
iab xname <C-R> William Durand
iab xsigp <C-R> William Durand <william.durand1@gmail.com>
iab xsigw <C-R> William Durand <william.durand1@gmail.com>

" snipMate
let g:snips_author = 'William Durand <william.durand1@gmail.com>'

" C++
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set ft=cpp

" Markdown
au! BufRead,BufNewFile *.markdown,*.md set filetype=mkd
au! BufRead,BufNewFile *.md set filetype=mkd

" reStructuredText
au! BufRead,BufNewFile *.rst set filetype=rst

" Twig
au BufNewFile,BufRead *.twig set filetype=twig
" Twig surrounding
let g:surround_{char2nr('-')} = "{% \r %}"

" PHP/HTML
let php_htmlInStrings = 1
let php_sql_query = 1

" Symfony plugin
let g:symfony_fuf = 1
map <C-F3> :SfSwitchView<cr>
au BufRead,BufNewFile *.class.php set ft=php.symfony

" Symfony2 (default)
au BufRead,BufNewFile *.php.* set ft=php.symfony2
au BufRead,BufNewFile */config/*.xml set ft=xml.sf2xml
au BufRead,BufNewFile *Bundle/*.php set ft=php.sf2class

" Propel
au BufRead,BufNewFile */Propel/runtime/lib/*.php set noexpandtab
au BufRead,BufNewFile */Propel/generator/lib/*.php set noexpandtab

" Behat
au BufRead,BufNewFile *.feature set ft=yaml.behat

"jquery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"Invisible character
nmap <leader>l :set list!<CR>
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¬,trail:·

" Highlight trailing whitespaces
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
autocmd BufWritePre *.php,*.yml,*.xml,*.js,*.html,*.css,*.java,*.c,*.cpp,*.vim :call StripTrailingWhitespace()

" Tab mappings.
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>
map <leader>tr :tabrewind<cr>

" Syntastic
"let g:syntastic_enable_signs = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_quiet_warnings = 0
"let g:syntastic_enable_balloons = 1

" Change cursor color depending on the mode
if &term =~ "xterm"
    let &t_SI = "\<Esc>]12;orange\x7"
    let &t_EI = "\<Esc>]12;white\x7"
endif

" TagList
"let g:Tlist_Ctags_Cmd = 'ctags'
"let Tlist_Show_One_File = 1
"let Tlist_Sort_Type = "name"
"nnoremap <silent> <C-F8> :TlistToggle<CR>

" Command-T
" Increase cache size
"let g:CommandTMaxFiles=30000
"map <leader>t :CommandT<cr>
"au BufCreate,BufFilePost * CommandTFlush

au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))

function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

" do not auto insert comment chars on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" jump to a twig view in symfony
set path+=**
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

" create a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>
autocmd BufEnter *.html.twig nmap <buffer><leader>c :bf<CR>
