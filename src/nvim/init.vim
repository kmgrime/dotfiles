call plug#begin(stdpath('data'))

Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'ms-jpq/coq_nvim'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'hashivim/vim-terraform'
Plug 'hashicorp/terraform-ls'

call plug#end()

language en_US
