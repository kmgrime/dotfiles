-- Bicep language server configuration
-- Provides Azure Bicep template support with validation and IntelliSense

return {
  cmd = { "bicep-langserver" },
  filetypes = { "bicep" },
  root_markers = { ".git", "main.bicep", "*.bicep" },
  settings = {
    bicep = {
      completion = {
        enable = true,
      },
      diagnostics = {
        enable = true,
      },
      formatting = {
        enable = true,
      },
    },
  },
  single_file_support = true,
}
