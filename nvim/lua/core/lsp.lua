--[[
LSP Setup
--------- 
This file sets up all language servers using Neovim's integrated LSP client (no Mason or external manager).

How to add a new server:
1. Create a config file in /lsp/ (e.g., lsp/bicep.lua or lsp/terraform.lua).
2. Add the server name to the vim.lsp.enable() list below.
3. The server will use the built-in LSP with default settings.

For custom server configurations, you can use vim.lsp.config() to override settings.
This setup uses only Neovim's built-in LSP. No lspconfig plugin or Mason installer is used.
--]]

-- Enable LSP servers using Neovim's integrated LSP
vim.lsp.enable({
    "gopls",
    "lua_ls", 
    "yamlls",  -- Note: using yamlls (standard name) instead of yaml
    "opentofuls",   -- OpenTofu language server
    "bicep",        -- Bicep language server
    "pyright",
})

-- Configure LSP server settings using vim.lsp.config
vim.lsp.config("gopls", require("lsp.gopls"))
vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.config("yamlls", require("lsp.yaml"))
vim.lsp.config("opentofuls", require("lsp.opentofuls"))
vim.lsp.config("bicep", require("lsp.bicep"))
vim.lsp.config("pyright", require("lsp.python"))  -- Using python.lua config file

-- Configure diagnostics
vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
