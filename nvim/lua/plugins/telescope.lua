-- FZF fuzzy finder
-- Provides file finding, live grep, and buffer navigation

return {
  'junegunn/fzf',
  build = './install --bin',
  dependencies = { 'junegunn/fzf.vim' },
  config = function()
    -- FZF layout and appearance
    vim.g.fzf_layout = { down = '40%' }
    vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/' }
    
    -- Custom FZF actions
    vim.g.fzf_action = {
      ['ctrl-t'] = 'tab split',
      ['ctrl-x'] = 'split',
      ['ctrl-v'] = 'vsplit'
    }

    -- Key mappings
    vim.keymap.set('n', '<leader>ff', ':Files<CR>', { desc = 'FZF find files' })
    vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'FZF live grep' })
    vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'FZF buffers' })
    vim.keymap.set('n', '<leader>fh', ':Helptags<CR>', { desc = 'FZF help tags' })
    vim.keymap.set('n', '<C-e>', ':Files<CR>', { desc = 'FZF find files (Ctrl-E)' })
  end
}

