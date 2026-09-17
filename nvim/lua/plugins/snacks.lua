return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false }, -- Disable LazyVim welcome screen
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true, -- Show hidden/dotfiles
          },
        },
      },
    },
  },
}
