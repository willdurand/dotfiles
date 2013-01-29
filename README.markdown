My VIM Config
=============

This is my VIM config for development based (a long time ago) on @vjousse's
config. Now, I dropped a lot of useless stuffs, and I try to keep a minimal
configuration to be close to the original **vim**, and to be efficient with it
even without my configuration.

Installation
------------

    git clone git://github.com/willdurand/vim-config.git
    cd vim-config && ./install.sh


Commands
--------

* `:W`      will save the current file with **sudo**.


Mapping
-------

### General

Important: The **leader** key is `,`.

* `,t`      will activate CtrlP to fast search files.
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

* `,doc`    on a PHP function will open the [php.net](http://en.php.net) doc.
* `F7`      will generate a _tags_ file using **ctags**.
* `,cns`    will insert the current namespace based on the filename.
* `<ctrl>l` will run the PHP linter to detect syntax errors.
* `,m`      will run PHPUnit (actually it's mapped to `:make`)

See also the **Xdebug** section above.

### Xdebug

To enable the Xdebug mapping, use `F9`.

* `F1`      Resize the debugger window.
* `F2`      Step into.
* `F3`      Step over.
* `F4`      Step out.
* `,e`      Eval a variable.
* `F5`      Run the debugger.
* `F6`      Quit the debugger.
* `F11`
* `F12`

**Note:** This mapping only works with the _php_ filetype.

### Symfony2

* `,v`      in a controller, will switch to the view related to the current
action.
* `,c`      in a view, will switch to the related action, in the right
controller.

### JavaScript

* `<ctrl>l` will run `gjslint` (if available) to detect JS errors.


Snippets
--------

**snipMate** adds a lot of snippets but I also wrote mine.

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

### Propel

* `db`          will add a new _database_ block definition.
* `table`       will add a new _table_ block definition.
* `column`      will add a new _column_ declaration.
* `fk`, `foreign-key`   will generate a new _foreign-key_ declaration.
* `index`       will add a new _index_ block definition.
* `i-col`       will add a new _column index_ declaration.
* `unique`      will add a new _unique_ block definition.
* `u-col`       will add a new _unique column_ declaration.
* `behav`       will add a new _behavior_ declaration.

### ExtJS

See: `vim/snippets/extjs.snippets`.

### Markdown

See: `vim/snippets/markdown.snippets`.

### Twig

* `bcss`        will add a new block named `stylesheets`.
* `bjs`         will add a new block named `javascripts`.
* `bbody`       will add a new block named `body`.
* `bcontent`    will add a new block named `content`.
* `extend`      will add a new `extend` declaration.


Helpers
-------

* `xdate`       will insert the current date.
* `xsigp`       will insert the configured personal signature.
* `xsigw`       will insert the configured work signature.
