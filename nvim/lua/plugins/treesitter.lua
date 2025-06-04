return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    autotage = { enable = true },
	    ensure_installed = {
		"lua",
		"bicep",
		"bash",
		"go",
		"helm",
		"python",
		"rst",
		"markdown_inline",
		"yaml",
	    },
	    auto_install = false,
	})
    end
}
