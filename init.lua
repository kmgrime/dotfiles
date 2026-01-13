-- leader mapping
vim.g.mapleader = " "

-- Editor Display
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.colorcolumn = "120"    -- Show column guide
vim.opt.signcolumn = "yes"    -- Always show sign column
vim.opt.showmatch = true      -- Show matching brackets
vim.opt.wrap = false          -- Don't wrap lines

-- Editor Behavior
vim.opt.scrolloff = 10    -- Lines of context above/below cursor
vim.opt.sidescrolloff = 8 -- Columns of context left/right of cursor
vim.opt.swapfile = false  -- Don't create swap files

-- Indentation & Spacing
vim.opt.shiftwidth = 2     -- Size of indent
vim.opt.tabstop = 2        -- Size of tab
vim.opt.softtabstop = 2    -- Size of soft tab
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting

-- UI & Colors
vim.opt.termguicolors = true -- Enable true color support
vim.opt.cmdheight = 1        -- Command line height
vim.o.winborder = "rounded"  -- Rounded window borders

-- System Integration
--vim.opt.clipboard = "unnamedplus"  -- Use system clipboard globally
vim.opt.spelllang = { "en", "no" } -- Spell check languages

-- File Explorer
vim.g.netrw_banner = 0 -- Disable banner in netrw

-- Window movement
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Tab/Buffer management
vim.keymap.set('n', '<leader>1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<leader>4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<leader>5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'Close buffer' })

-- File management
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = 'Open Explorer' })
vim.keymap.set("n", "<leader>cx", ":Rex<CR>", { desc = 'Close Explorer' })

-- Clipboard operations
vim.keymap.set('n', 'y', '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set('v', 'y', '"+y', { desc = "Yank selection to system clipboard" })

-- Search and Find
vim.keymap.set('n', '<leader>ff',
    "<cmd>let $FZF_DEFAULT_COMMAND='find . -type f -not -path \"*/.git/*\" -not -path \"*/.venv/*\"'<CR>:Files<CR>",
    { desc = 'FZF find files' })
vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'FZF live grep' })
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'FZF buffers' })
vim.keymap.set('n', '<leader>fh', ':Helptags<CR>', { desc = 'FZF help tags' })

-- LSP Configuration
local function setup_lsp()
    require("mason").setup({
        ensure_installed = { "ruff", "shfmt", "clang-format", "stylua", "goimports" }
    })

    local on_attach = function(_, bufnr)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    end

    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright", "bashls", "gopls" },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({
                    on_attach = on_attach
                })
            end
        }
    })
end

--plugins
-- LAZY until v0.12 drops
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --"rose-pine/neovim",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "nvim-treesitter/nvim-treesitter",
    "stevearc/conform.nvim",
})

-- Setup formatters
require("conform").setup({
    formatters_by_ft = {
        c = { "clang_format" },
        python = { "ruff_format" },
        go = { "goimports" },
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
    },
})
vim.keymap.set('n', '<leader>cf', function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Setup Treesitter
require('nvim-treesitter').setup({
    ensure_installed = { "c", "python", "go", "lua", "bash" },
})
vim.treesitter.language.register("bash", "sh")
-- Setup LSP after plugins are loaded
setup_lsp()

--plugins options
--vim.cmd("colorscheme rose-pine")

-- transparent background
local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

enable_transparency()
