# dotfiles

This repository contains various configuration files I care about.

## Installation

    $ git clone https://github.com/willdurand/dotfiles.git --recursive
    $ cd dotfiles
    $ bin/install

You can tweak MacOS by running the following script:

    $ bin/setup_osx

### Git

The `git` configuration supports a `~/.gitlocal` file that should contain
machine-specific configuration. The default file I use on almost all my machines
is `git/gitlocal.default` but it's not installed by default.

## Notes on setting up a new machine

- Create a new SSH key and upload it on GitHub
- Create a personal access token for hub and store it in `~/.config/hub` (see
  template file in the `misc/` folder)
- Install iTerm2
- Configure iTerm2:
    - go to "Preferences > General > Selection" and check "Applications in
      terminal may access clipboard"
    - go to "Preferences > Advanced" and set "Scroll wheel sends arrow keys when
      in alternate screen mode" to "Yes"
- Install Homebrew
- Install these essential packages with `brew`:

      brew install vim hub jq git fzf ripgrep gpg magic-wormhole tmux

- Install Amethyst (tiling window manager), then change the _Floating_ settings
  to "automatically float all applications except those listed". The list should
  contain main apps like Firefox and iTerm2.

      brew install --cask amethyst

- Install [KeepingYouAwake][]:

      brew install --cask keepingyouawake

- Import the GPG private keys from the old machine by following [these
  instructions](./gpg/README.md) or create new subkeys. Then, tell `git` about
  signing by creating a `~/.gitlocal` file:

      [commit]
        gpgsign = 1

- Install the FiraCode font: https://github.com/tonsky/FiraCode/wiki/Installing

      brew install --cask font-fira-code

- Manually import the profiles using the file in the `misc/` folder


[KeepingYouAwake]: https://github.com/newmarcel/KeepingYouAwake
