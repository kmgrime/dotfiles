" plug
call plug#begin()

" List your plugins here
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" runtimepath
set runtimepath^=$HOME/.vim/.vim

" options
set tabstop=2
set number
set relativenumber
set autoindent
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set clipboard=unnamedplus
set laststatus=2
set statusline=%f\ %y\ %m\ %r\ %=Ln\ %l,%c\ [%p%%]
set termguicolors
syntax on
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" mappings
let mapleader=' '
nnoremap <leader>t :terminal<CR>
nnoremap <leader>cd :Ex<CR>
nnoremap <leader>q :bd<CR>
   
" go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
" control - E: Fuzzy search for files.
nnoremap <C-e> :Files<Cr>
