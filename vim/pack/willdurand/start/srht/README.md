# srht.vim

## Usage

In doubt, run `:help srht`.

This plugin provides the following features per service:

- `git.sr.ht`: if [vim-fugitive](https://github.com/tpope/vim-fugitive) is
  installed, this plugin will allow `:Gbrowse` to open sourcehut URLs
- `paste.sr.ht`: create and retrieve pastes (requires `curl` and the
  [webapi-vim](https://github.com/mattn/webapi-vim) plugin)

### Configuration

- `g:srht_token_file` (default: `~/.srht-vim`): path to filename containing a
   sourcehut personal access token (which is only required for commands that
   interact with the sourcehut APIs)
- `g:srht_paste_default_visibility` (default: `unlisted`): default paste
   visibility
- `g:srht_paste_url` (default: `https://paste.sr.ht/`): base URL of the paste
   hosting service
- `g:srht_git_domain` (default: `git.sr.ht`): domain of the git hosting service

## Installation

Install the _srht.vim_ plugin using your favorite package manager, or use Vim's
built-in package support:

```
mkdir -p ~/.vim/pack/willdurand/start
cd ~/.vim/pack/willdurand/start
# [copy the srht.vim plugin]
vim -u NONE -c "helptags srht/doc" -c q
```

## License

srht.vim is released under the MIT License. See the bundled
[LICENSE](./LICENSE.md) file for details.
