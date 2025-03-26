" plugins
call plug#begin()

" List your plugins here
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

hi User1 ctermbg=black ctermfg=grey guibg=black guifg=grey
hi User2 ctermbg=green ctermfg=black guibg=green guifg=black
hi User3 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen

set tabstop=2
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

set termguicolors
syntax on
colorscheme dracula
"" hi Normal guibg=NONE ctermbg=NONE
filetype plugin indent on
set paste

let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

let mapleader=' '
nnoremap <leader>t :terminal<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>q :bd<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
