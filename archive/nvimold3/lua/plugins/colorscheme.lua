return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  config = function()
    vim.cmd("colorscheme github_light_default")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
  end,
}
