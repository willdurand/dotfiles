My VIM Config
=============

This is my VIM config for PHP/Ruby development based on @vjousse's config.

* Autocompletion
* Syntax hightlighting
* Snippets (comes from [vim-symfony-snipmate](https://github.com/themouette/vim-symfony-snipmate))
* Xdebug debugger integration
* Git integration
* reStructuredText syntax + preview in browser
* Markdown syntax + preview in browser
* Ready for symfony/Symfony2
* etc

There is a shell script to symlink all files.


Plugins
=======

This config comes with the following plugins:

* Fugitive (Git)
* Solarized
* snipMate
* Command-T
* Gitv
* Ack
* ...


Commands
========

* `:W`      will save the current file with **sudo**.


Mapping
=======

### General

Important: The map **leader** is `,`.

* `,t`      will activate Command-T to fast search files.
* `,2`      will set a two-spaces indentation.
* `,4`      will set a four-spaces indentation.
* `,<Right>` is a shortcut for `C-]` (go to the declaration of a class, variable, ...).
* `,<Left>` is a shortcut for `C-T` (go back).
* `zz`      is a shortcut for `zjzo`.
* `,te`     is a shortcut for `tabedit`.
* `,tc`     will close the active tab.
* `,to`     is a shortcut for `tabonly`.
* `,tn`     will move to the next tab.
* `,tp`     will move to the previous tab.
* `,tf`     will move to the first tab.
* `,tl`     will move to the last tab.
* `,tm`     will move the active tab to the right.
* `,tr`     will move the active tab to the left.

### PHP

* `,doc`    on a PHP function will open the [php.net](http://fr.php.net) doc.
* `F7`      will generate a _tags_ file using **ctags**.
* `,cns`    will insert the **c**urent **n**ame**s**pace based on the filename.

See also the **Xdebug** section above.

### Xdebug

* `F1`      Resize the debugger window.
* `F2`      Step into.
* `F3`      Step over.
* `F4`      Step out.
* `,e`      Eval a variable.
* `F5`      Run the debugger.
* `F6`      Quit the debugger.
* `F11`
* `F12`

This mapping only works with the _php_ filetype.

### Markdown

* `F5`      will render the active Markdown file in your browser.

### reStructuredText

* `F5`      will render the active reStructuredText file in your browser.

### symfony 1.x

* `C-F3`    will switch from the action to the view and from the view to the action.


Snippets
========

snipMate adds a lot of snippets but I also wrote mine.

### Symfony2

1. _sf2xml.snippets_

* `services`    will add a complete XML structure to declare services in XML.
* `serv`        will add a single _service_ declaration.
* `param`       will add a _parameter_ declaration.
* `tag`         will add a _tag_ declaration.
* `arg`         will add a scalar argument declaration.
* `args`        will add a service type argument.

2. _sf2class.snippets_

* `action`      will add an action method.

### symfony 1.x

Too many snippets, please read these files:

* _symfony.snippets_
* _sfform.snippets_
* _sftemplate.snippets_

### Propel

* `table`       will add a new _table_ block definition.
* `column`      will add a new _column_ declaration.
* `fk`, `foreign-key`   will generate a new _foreign-key_ declaration.
* `index`       will add a new _index_ block definition.
* `i-col`       will add a new _column index_ declaration.
* `unique`      will add a new _unique_ block definition.
* `u-col`       will add a new _unique column_ declaration.


Helpers
=======

* `xdate`   will insert the current date.
* `xsigp`   will insert the configured personal signature.
* `xsigw`   will insert the configured work signature.


Troubleshooting
===============

You may have to install `python-markdown` :

  > wget http://pypi.python.org/packages/source/M/Markdown/Markdown-2.0.tar.gz

  > tar xvzf Markdown-2.0.tar.gz

  > cd Markdown-2.0/

  > sudo python setup.py install


Will.
