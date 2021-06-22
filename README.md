# vim-sessions

Easy vim/neovim session support

## Installation

```
Plug 'igor-semenov/vim-sessions'
```

## Usage

let g:SessionFile = $HOME . ".vimsession.vim"

autocmd VimEnter * nested :call sessions#LoadSession(g:SessionFile)
autocmd VimLeave * :call sessions#MakeSession(g:SessionFile)
