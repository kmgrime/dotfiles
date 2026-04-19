-- Move lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Tab/Buffer management
vim.keymap.set("n", "<leader>1", "1gt", { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>2", "2gt", { desc = "Go to tab 2" })
vim.keymap.set("n", "<leader>3", "3gt", { desc = "Go to tab 3" })
vim.keymap.set("n", "<leader>4", "4gt", { desc = "Go to tab 4" })
vim.keymap.set("n", "<leader>5", "5gt", { desc = "Go to tab 5" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })
