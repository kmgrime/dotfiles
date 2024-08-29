set number
syntax on
filetype indent on
set tabstop=2
set softtabstop=2
set autoindent
set encoding=utf-8
set termguicolors
set mouse=a
set rtp+=/opt/homebrew/opt/fzf

nnoremap <C-e> :NERDTree<CR>
nnoremap <C-t> :terminal<CR>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
 
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme desert
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
