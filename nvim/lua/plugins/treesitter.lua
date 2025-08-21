-- Treesitter syntax highlighting and parsing
-- Provides better syntax highlighting and code understanding

return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotage = { enable = true },
      ensure_installed = {
        "lua",
        "bicep",
        "bash",
        "go",
        "helm",
        "python",
        "rst",
        "markdown_inline",
        "yaml",
        "hcl",        -- Terraform/HCL syntax
        "terraform",  -- Terraform configuration files
      },
      auto_install = false,
    })
  end
}
