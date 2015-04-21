My VIM Config
=============

This is my VIM config for development based (a long time ago) on @vjousse's
config. Now, I dropped a lot of useless stuffs, and I try to keep a minimal
configuration to be close to the original **vim**, and to be efficient with it
even without my configuration.

Installation
------------

```
$ git clone git://github.com/willdurand/vim-config.git --recursive
$ cd vim-config && bin/install
```


Commands
--------

* `:W`      will save the current file with **sudo**.


Mapping
-------

This list is not exhaustive.

### General

Important: the **leader** key is `,`.

* `,t`      will activate CtrlP to fast search files.
* `,2`      will set a two-spaces indentation.
* `,4`      will set a four-spaces indentation.
* `,<Right>` is a shortcut for `C-]` (go to the declaration of a class, variable, ...).
* `,<Left>` is a shortcut for `C-T` (go back).

### PHP

* `,doc`    on a PHP function will open the [php.net](http://en.php.net) doc.
* `,cns`    will insert the current namespace based on the filename.
* `<ctrl>l` will run the PHP linter to detect syntax errors.
* `,m`      will run PHPUnit (actually it's mapped to `:make`)

### Symfony

* `,v`      in a controller, will switch to the view related to the current
action.
* `,c`      in a view, will switch to the related action, in the right
controller.

### JavaScript

* `<ctrl>l` will run `gjslint` (if available) to detect JS errors.


Snippets
--------

**snipMate** adds a lot of snippets but I also wrote mine.

### Symfony

1. _sfxml.snippets_

* `services`    will add a complete XML structure to declare services in XML.
* `serv`        will add a single _service_ declaration.
* `param`       will add a _parameter_ declaration.
* `tag`         will add a _tag_ declaration.
* `arg`         will add a scalar argument declaration.
* `args`        will add a service type argument.

2. _sfclass.snippets_

* `action`      will add an action method.

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
