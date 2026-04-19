return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        pyright = false, -- Disable Pyright
        ty = {},
        gopls = {},
        bicep = {
          filetypes = { "bicep", "bicepparam" },
          get_language_id = function(_, ftype)
            if ftype == "bicepparam" then
              return "bicep-params"
            end
            return "bicep"
          end,
        },
        ruff = {},
        qmlls = {},
      },
    },
  },
}
