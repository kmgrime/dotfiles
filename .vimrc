" plug
call plug#begin()

" List your plugins here
Plug 'rose-pine/vim', { 'as': 'rose-pine' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" runtimepath
set runtimepath^=$HOME/.vim/.vim

" options
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set number
set relativenumber
set smartindent
set encoding=utf-8
set mouse=a
set clipboard=unnamedplus
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrap
set scrolloff=8
set signcolumn=yes
set updatetime=250
set hidden
set splitright
set splitbelow
set laststatus=2
set termguicolors
syntax on
colorscheme rosepine
hi Normal guibg=NONE ctermbg=NONE
let g:netrw_banner = 0

" statusline
set statusline=%f\ %y\ %m\ %r\ %=Ln\ %l,%c\ [%p%%]

" mappings
let mapleader=' '
nnoremap <leader>t :terminal<CR>
noremap <leader>cd :Ex<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>g :GFiles<CR>
