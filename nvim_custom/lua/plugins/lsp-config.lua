return {
  {
    "williamboman/mason.nvim",
    config = function()
	require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "bicep", "yamlls", "gopls", "pyright" },
	})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
	})

	lspconfig.bicep.setup({
		capabilities = capabilities,
		cmd = { "bicep-lsp" },
		filetypes = { "bicep" },
		root_dir = require("lspconfig").util.root_pattern(".git", "main.bicep"),
		settings = {},
	})

	lspconfig.yamlls.setup({
		capabilities = capabilities,
		settings = {
			yaml = {
				schemas = {},
				validate = true,
				hover = true,
				completion = true,
			},
		},
	})

	lspconfig.gopls.setup({
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
	})

	lspconfig.pyright.setup({
		capabilities = capabilities,
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_dir = require("lspconfig").util.root_pattern(
			".git",
			"setup.py",
			"setup.cfg",
			"pyproject.toml",
			"requirements.txt"
		),
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	})

	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
