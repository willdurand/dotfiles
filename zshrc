export EDITOR='vim'
export GIT_EDITOR='vim'
export SHELL='/bin/zsh'

export HISTSIZE=500000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt histignorealldups
setopt autocd
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt pushdignoredups
setopt nohup
setopt extendedglob
setopt completeinword
setopt vi
setopt promptsubst
setopt globdots
setopt histreduceblanks
setopt histignorespace
setopt histignorealldups
setopt SH_WORD_SPLIT
setopt automenu
setopt cdablevars
setopt nohup
setopt listpacked
setopt nolisttypes
setopt extendedglob
setopt completeinword
setopt alwaystoend
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

# Reverse search
bindkey -e

# Prompt
. ~/.zsh/pure.zsh
DEFAULT_USERNAME=william

if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='-G'
fi

# alias
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias ..="cd .."
alias dstat='dstat -dcgilmsy'

# convenient aliases
alias grunt='nocorrect grunt'

# tmux
alias tmux="TERM=screen-256color-bce tmux"

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

### Git
export PATH=$PATH:/usr/local/git/bin

zstyle ':completion:*:*:git:*' script ~/.git-completion.sh
fpath=(~/.zsh $fpath)

### GNU
export PATH=$PATH:/opt/local/libexec/gnubin

### Android tools
export PATH=$PATH:/Applications/eclipse/android-sdk-mac_86/tools/:/Applications/eclipse/android-sdk-mac_86/platform-tools/

### Scala
export PATH=$PATH:/usr/local/scala/bin

### PHP
export PATH=$PATH:~/.phpenv/bin
eval "$(phpenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

### Node
export PATH="$PATH:./node_modules/.bin"

### Boxen
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
