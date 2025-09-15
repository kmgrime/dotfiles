return {
	{
		"github/copilot.vim",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- Configuration options
			debug = false,
			show_help = true,
			disable_extra_info = false,
		},
		keys = {
			{ "<leader>zm", "<cmd>CopilotChatToggle<cr>", desc = "Copilot: Toggle Chat Models" },
			{ "<leader>zc", "<cmd>CopilotChatBuffer<cr>", desc = "Copilot: Chat with Current Buffer" },
			{ "<leader>ze", "<cmd>CopilotChatExplain<cr>", desc = "Copilot: Explain Code", mode = { "n", "x" } },
			{ "<leader>zt", "<cmd>CopilotChatTests<cr>", desc = "Copilot: Generate Tests", mode = { "n", "x" } },
			{ "<leader>zr", "<cmd>CopilotChatReview<cr>", desc = "Copilot: Review Code", mode = { "n", "x" } },
			{ "<leader>zf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Copilot: Fix Diagnostic" },
			{ "<leader>zq", "<cmd>CopilotChatQuickfix<cr>", desc = "Copilot: Quick Fix" },
			{ "<leader>zs", "<cmd>CopilotChatVsplitToggle<cr>", desc = "Copilot: Toggle Split View" },
		},
	},
}
