return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { 
          enabled = true,
          show_start = true, 
          show_end = true,
          highlight = { "Function", "Label" },
          include = {
            node_type = {
              ["*"] = { "*" },
            },
          },
        },
        exclude = {
          filetypes = {
            "help",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "trouble",
            "qf",
            "gitcommit",
            "gitrebase",
            "NvimTree",
            "TelescopePrompt",
            "fzf",
            "man",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "Outline",
          },
        },
      }
    end,
    main = "ibl",
  },
}
