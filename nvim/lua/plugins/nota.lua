return {
  "kmgrime/nota.nvim",
  config = function()
    require("nota").setup({
      notes_path = "~/notes",
    })
  end,
}
