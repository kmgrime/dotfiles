-- Code formatting with Conform.nvim
-- Configures formatters for different file types

return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "golines", "gofmt" },
        yaml = { "yamlfmt" },
        bicep = { "bicep" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      -- },
    })
  end,
}
