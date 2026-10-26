return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false,
      anti_conceal = { enabled = false },
      file_types = { "markdown", "opencode_output" },
    },
    config = function(_, opts)
      local rm = require("render-markdown")
      rm.setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "opencode_output",
        callback = function()
          rm.buf_enable()
        end,
      })
    end,
    ft = { "opencode_output" },
    cmd = { "RenderMarkdown" },
  },
  {
    "sudo-tee/opencode.nvim",
    config = function()
      require("opencode").setup({
        debug = {
          highlight_changed_lines = true,
        },
        context = {
          buffer = {
            enabled = true,
          },
        },
        ui = {
          input = {
            text = {
              wrap = true,
            },
          },
        },
        keymap = {
          editor = {
            ['<leader>aa'] = { 'toggle', desc = 'Toggle Opencode window' },
          },
        },
      })

      local api = require("opencode.api")
      vim.api.nvim_create_user_command("AIAnnotate", function(opts)
        api.quick_chat("Add type annotations", {
          start = opts.line1,
          stop = opts.line2,
        })
      end, { range = true, desc = "Annotate the selected lines" })

      vim.api.nvim_create_user_command("AICommitMessage", function()
        api.quick_chat("Generate a conventional commit message from #git_diff")
      end, { desc = "Generate a commit message on the current line" })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
      "folke/snacks.nvim",
    },
  },
}
