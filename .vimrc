" Properties
syntax enable
filetype indent on
" colorscheme desert

" Sets
set tabstop=4
set number
set hlsearch
set incsearch
set autoindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set mouse=a
set clipboard=unnamed

" Netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"  Mappings
let mapleader=' '
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :terminal<CR>
nnoremap <C-e> :Ex<CR>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'

cal plug#end()
