My vim Config
=============

This is my vim config for anything I can do on a computer, based on @vjousse's
configuration. I have rewritten almost everything though. I try to keep a
minimal configuration to be close to the original **vim** so that I can still be
efficient without my own configuration.

Installation
------------

```
$ git clone https://github.com/willdurand/vim-config.git --recursive
$ cd vim-config && bin/install
```


Commands
--------

* `:W`      will save the current file with **sudo**


Mapping
-------

This list is not exhaustive.

### General

Important: the **leader** key is `,`.

* `,t`      will activate CtrlP to fast search files
* `,2`      will set a two-spaces indentation
* `,4`      will set a four-spaces indentation
* `<ctrl>l` will run a linter to detect syntax errors (for ruby, PHP,
  JavaScript, etc.)

### PHP

* `,cns`    will insert the current namespace based on the filename
* `,m`      will run PHPUnit (actually it's mapped to `:make`)

### Symfony

* `,v`      in a controller, will switch to the view related to the current
action
* `,c`      in a view, will switch to the related action, in the right
controller


Others
------

* Configuration that is [environment|language]-specific is in
[`ftplugin/`](https://github.com/willdurand/vim-config/tree/master/vim/ftplugin)
* I have a few custom
[snippets](https://github.com/willdurand/vim-config/tree/master/vim/snippets)
