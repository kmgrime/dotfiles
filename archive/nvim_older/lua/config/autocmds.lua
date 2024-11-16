-- Map <leader>f to format the selected range in visual mode
vim.api.nvim_set_keymap(
  "v",
  "<leader>f",
  "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
  { noremap = true, silent = true }
)
