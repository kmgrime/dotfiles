return {
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
  keys = {
    { '<leader>ff', ':Files<CR>', desc = 'FZF find files' },
    { '<leader>fg', ':Rg<CR>', desc = 'FZF live grep' },
    { '<leader>fb', ':Buffers<CR>', desc = 'FZF buffers' },
    { '<leader>fh', ':Helptags<CR>', desc = 'FZF help tags' },
    { '<C-e>', ':Files<CR>', desc = 'FZF find files (Ctrl-E)' },
  }
}
