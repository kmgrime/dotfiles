-- Code formatting with Conform.nvim
-- Configures formatters for different file types

return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports" },
        yaml = { "yamlfmt" },
        bicep = { "bicep" },
        python = { "black" },
        terraform = { "tofu" },  -- Use OpenTofu formatter for .tf files
        hcl = { "tofu" },       -- Also format HCL files with OpenTofu
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      -- },
    })
  end,
}
