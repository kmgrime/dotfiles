-- Lua language server configuration
-- Configured for Neovim Lua development with vim globals

return {
  cmd = {
    "lua-language-server",
  },
  filetypes = {
    "lua",
  },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
        -- disable = { "missing-parameters", "missing-fields" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
