export BROWSER=
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'


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
setopt PROMPT_SUBST

fpath=($fpath $HOME/.zsh/func)
typeset  -U fpath

autoload -U promptinit
promptinit
prompt wunjo

if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='-G'
fi

# alias
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias ..="cd .."

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# You can hit C-X C-E to open your $EDITOR
# with the command typed in the buffer and
# quickly edit your error
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Use google for translation
alias trans="python2.6 ~/.scripts/translate"
alias enfr="python2.6 ~/.scripts/translate -s en -d fr"
alias fren="python2.6 ~/.scripts/translate -s fr -d en"

search() {
  [[ -z "$BROWSER" ]] && return 1
  local term="${*:-$(xclip -o)}"
  $BROWSER "http://www.google.com/search?q=${term// /+}" &>/dev/null &
}

define() {
  local lang charset tmp

  lang="${LANG%%_*}"
  charset="${LANG##*.}"
  tmp='/tmp/define'

  lynx -accept_all_cookies \
  -dump \
  -hiddenlinks=ignore \
  -nonumbers \
  -assume_charset="$charset" \
  -display_charset="$charset" \
  "http://www.google.com/search?hl=$lang&q=define%3A+$1&btnG=Google+Search" | grep -m 5 -C 2 -A 5 -w "*" > "$tmp"

  if [[ ! -s "$tmp" ]]; then
    echo -e "No definition found.\n"
  else
    echo -e "$(grep -v Search "$tmp" | sed "s/$1/\\\e[1;32m&\\\e[0m/g")\n"
  fi

  rm -f "$tmp"
}

# PATH
export PATH=/usr/local/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/X11/bin:/Developer/usr/bin

# Node
export NODE_PATH=/usr/local/lib/node
export PATH=$PATH:/usr/local/share/npm/bin

# Git
export PATH=$PATH:/usr/local/git/bin

# GNU
export PATH=$PATH:/opt/local/libexec/gnubin

# Android tools
export PATH=$PATH:/Applications/eclipse/android-sdk-mac_86/tools/:/Applications/eclipse/android-sdk-mac_86/platform-tools/

# Scala
export PATH=$PATH:/usr/local/scala/bin

# PHP
export PATH=$PATH:/usr/local/php5/bin
