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
