return {
  {
    'junegunn/fzf',
    build = ':call fzf#install()'
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    cmd = { 'Files', 'Rg', 'Buffers', 'Helptags' },
    keys = {
      { '<leader>ff', "<cmd>let $FZF_DEFAULT_COMMAND='find . -type f'<CR>:Files<CR>", desc = 'FZF find files' },
      { '<leader>fg', ':Rg<CR>', desc = 'FZF live grep' },
      { '<leader>fb', ':Buffers<CR>', desc = 'FZF buffers' },
      { '<leader>fh', ':Helptags<CR>', desc = 'FZF help tags' },
      { '<C-e>', "<cmd>let $FZF_DEFAULT_COMMAND='find . -type f'<CR>:Files<CR>", desc = 'FZF find files (Ctrl-E)', mode = 'n' }
    }
  }
}
