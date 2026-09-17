-- Rose Pine with transparent background
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
      highlight_groups = {
        Visual = { bg = "#524f67", inherit = false },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "rose-pine",
      },
    },
  },
}
