set number
syntax enable
filetype indent on
set tabstop=4
set softtabstop=4
set autoindent
set encoding=utf-8
 
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :terminal<CR>
 
call plug#begin()
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'hashivim/vim-terraform'
Plug 'hashicorp/terraform-ls'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
call plug#end()