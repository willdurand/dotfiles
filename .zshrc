# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="ornicar"

export BROWSER="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
export EDITOR='vim'
export GIT_EDITOR='vim -X'

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gem git github osx macports mysql phing lighthouse ssh-agent ruby rails rails3 vi-mode)

source $ZSH/oh-my-zsh.sh

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

# Customize to your needs...
export PATH=/usr/local/bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/sw/bin:/sw/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
