-- Key mappings and leader key configuration
-- Sets up window navigation, tab switching, and basic shortcuts

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = 'Open Explorer' })
vim.keymap.set("n", "<leader>cx", ":Rex<CR>", { desc = 'Close Explorer' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

vim.keymap.set('n', '<leader>1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<leader>4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<leader>5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'Close buffer' })
