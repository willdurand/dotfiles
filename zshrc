# Functions Autoloading
fpath=(~/.zsh $fpath)

# Completion
autoload -U promptinit && promptinit
autoload -U compinit compdef && compinit

# Prompt
prompt pure

# Common ENV variables
export EDITOR='vim'
export GIT_EDITOR='vim'
export SHELL='/bin/zsh'

# Fix Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# History
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST="$HISTSIZE"

# Remove superfluous blanks from each command line being added to the history
# list
setopt histreduceblanks
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt histignorespace
# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt histignorealldups
# Switching directories for lazy people
setopt autocd
# See: http://zsh.sourceforge.net/Intro/intro_6.html
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
# Don't kill background jobs when I logout
setopt nohup
# See: http://zsh.sourceforge.net/Intro/intro_2.html
setopt extendedglob
# Do not require a leading '.' in a filename to be matched explicitly
setopt globdots
# Use vi key bindings in ZSH
setopt vi
# Causes field splitting to be performed on unquoted parameter expansions
setopt shwordsplit
# Automatically use menu completion after the second consecutive request for
# completion
setopt automenu
# If the argument to a cd command (or an implied cd with the AUTO_CD option set)
# is not a directory, and does not begin with a slash, try to expand the
# expression as if it were preceded by a '~'
setopt cdablevars
# Try to make the completion list smaller (occupying less lines) by printing
# the matches in columns with different widths
setopt listpacked
# Don't show types in completion lists
setopt nolisttypes
# If a completion is performed with the cursor within a word, and a full
# completion is inserted, the cursor is moved to the end of the word
setopt alwaystoend
# Try to correct the spelling of commands
setopt correct

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# zstyle
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

# Reverse search
bindkey -e

if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='-G --color=always'
fi

# alias
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias ..="cd .."
alias dstat='dstat -dcgilmsy'
alias projects="cd ~/projects/"

# convenient aliases
alias grunt='nocorrect grunt'
alias mutt='cd ~/Desktop && mutt'
alias diff=icdiff

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# git + hub
alias git=hub

# You can hit C-X C-E to open your $EDITOR
# with the command typed in the buffer and
# quickly edit your error
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

chrome () {
    [[ `uname` == 'Darwin' ]] && /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

### PATH
export PATH=/usr/local/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/X11/bin:/Developer/usr/bin

### GNU
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

### Scala
export PATH=$PATH:/usr/local/scala/bin

### PHP
export PATH=$PATH:~/.phpenv/bin
eval "$(phpenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Node
export PATH="$PATH:./node_modules/.bin"

### Packer
export PATH="$PATH:/usr/local/packer"

### Docker
eval "$(docker-machine env default)"

### Python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

### Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Ruby
eval "$(rbenv init -)"

# added by travis gem
[ -f /Users/william/.travis/travis.sh ] && source /Users/william/.travis/travis.sh
export PATH="/usr/local/sbin:$PATH"

# cpan/perl
PATH="/Users/william/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/william/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/william/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/william/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/william/perl5"; export PERL_MM_OPT;
