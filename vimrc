set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins installed"
so ~/.vim/plugins.vim

"Key bindings to disable arrow keys"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"show line numbers"
set number

"Turn on silver searcher"
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_solarized_bg='dark'

" helps copy things to clipboard "
set clipboard=unnamed
