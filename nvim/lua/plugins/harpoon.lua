-- Harpoon file navigation with FZF integration
-- Quick navigation between frequently used files

-- helper function to use FZF on harpoon list
local function toggle_fzf_harpoon(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  
  -- Create a temporary file with harpoon entries
  local temp_file = vim.fn.tempname()
  local handle = io.open(temp_file, 'w')
  if handle then
    for _, path in ipairs(file_paths) do
      handle:write(path .. '\n')
    end
    handle:close()
    
    -- Use FZF to select from harpoon list
    vim.cmd('call fzf#run(fzf#wrap({"source": "cat ' .. temp_file .. '", "sink": "edit", "options": "--prompt=\\"Harpoon> \\""}))') 
    
    -- Clean up temp file
    vim.fn.delete(temp_file)
  end
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local harpoon = require('harpoon')
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>fl", function() toggle_fzf_harpoon(harpoon:list()) end,
      { desc = "Open harpoon window with FZF" })
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
  end
}
