syntax enable
filetype indent on
set termguicolors
set background=dark
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

let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

let mapleader=' '
nnoremap <C-t> :terminal<CR>
nnoremap <C-e> :Ex<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
cal plug#end()
let g:airline_theme = 'catppuccin_mocha'
colorscheme catppuccin_mocha
hi Normal guibg=NONE ctermbg=NONE
