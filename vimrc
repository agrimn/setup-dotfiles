call plug#begin("~/.vim/plugged")

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'

call plug#end()

" Enable lightline status bar
set laststatus=2
set noshowmode
set number

" Change the color scheme for lightline
if !has('gui_running')
  set t_Co=256
endif

" Changes the lightline status bar colorscheme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" NERD Tree mappings C = Ctrl
" leader is \
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" q should be able to close NERDTree as well if this is the last window and
" tab open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTree commands to focus cursor on file on startup and also open NERDTree
autocmd VimEnter * NERDTree | wincmd p
