return {
  "kmgrime/nota.nvim",
  config = function()
    require("nota").setup({
      notes_path = "~/notes", -- path to directory of your notes
    })
  end,
}
