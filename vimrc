set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins installed"
so ~/.vim/plugins.vim

" Key bindings "
" ============ "
" disable arrow keys"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" enable fzf "
map ; :Files<CR>

" enable nerdTree "
map <C-o> :NERDTreeToggle<CR>

" git gutter bindings "
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" light line - makes vim status bars LIT "
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
set laststatus=2

"show line numbers"
set number

"Turn on silver searcher"
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_solarized_bg='dark'

" helps copy things to clipboard "
set clipboard=unnamed
