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
zstyle ':completion:*' ignored-patterns 'package-lock.json'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash

# Reverse search
bindkey -e

if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='-G --color=always'
fi

# Pager
# Thanks François <3
if [[ -x `which less` ]] ; then
  export PAGER="less"
  export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"

  #http://nion.modprobe.de/blog/archives/572-less-colors-for-man-pages.html
  export LESS_TERMCAP_mb=$'\E[01;31m'
  export LESS_TERMCAP_md=$'\E[01;31m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[01;44;33m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[00;32m'
  export MANPAGES='/bin/less'
fi

# alias
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias ..="cd .."
alias dstat='dstat -dcgilmsy'
alias projects="cd ~/projects/"

# convenient aliases
alias diff=icdiff

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# git + hub
eval "$(/usr/local/bin/hub alias -s)"

# rg, faster than ag, faster than ack
alias ack=rg

# no zsh, jest does exist now!
alias jest='nocorrect jest'

# vi -> vim
alias vi='vim'

# You can hit C-X C-E to open your $EDITOR
# with the command typed in the buffer and quickly edit your error
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Functions
jsonapi() {
    http "$@" Accept:application/vnd.api+json Content-Type:application/vnd.api+json
}

### PATH
export PATH=/usr/local/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/X11/bin:/Developer/usr/bin

### GNU
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

### Scala
export PATH="$PATH:/usr/local/scala/bin"

### PHP
export PATH="$PATH:$HOME/.phpenv/bin"
# lazy load phpenv because I do not use it too often
phpenv() {
  eval "$(command phpenv init -)"
  phpenv "$@"
}

export PATH="$PATH:$HOME/.composer/vendor/bin:$HOME/.composer/vendor/willdurand/pman/bin"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

### Node
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$(yarn global bin)"

### Packer
export PATH="$PATH:/usr/local/packer"

### Go
export GOPATH="$HOME/projects/go"
export PATH="$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin"

# Ruby, lazy load rbenv because I do not use it too often
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

# cpan/perl
PATH="~/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="~/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="~/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"~/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=~/perl5"; export PERL_MM_OPT;

# MacTex
export PATH="$PATH:/Library/TeX/texbin"

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export PATH="/usr/local/sbin:$PATH"

# Android / React Native
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# rust
source $HOME/.cargo/env

# added by Miniconda3 installer
[[ -f ~/miniconda3/etc/profile.d/conda.sh ]] && source ~/miniconda3/etc/profile.d/conda.sh

# sensitive env vars
[[ -f ~/.sensitive.sh ]] && source ~/.sensitive.sh
