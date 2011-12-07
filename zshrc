export BROWSER="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
export EDITOR='vim'
export GIT_EDITOR='vim -X'

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
fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

setopt promptsubst

# Load the prompt theme system
autoload -U promptinit
promptinit

prompt wunjo

if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='-G'
  eval `gdircolors ~/.dir_colors`
fi

# alias
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."

# vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

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

export PATH=$PATH:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/sw/bin:/sw/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export NODE_PATH=/usr/local/lib/node
