local fzf = require("fzf-lua")
local theme = require("theme")
local map = vim.keymap.set

-- Files
map("n", "<leader>ff", fzf.files, { desc = "Find Files" })
map("n", "<leader>fr", fzf.oldfiles, { desc = "Recent Files" })
map("n", "<leader>fc", function()
  fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config Files" })

-- Search
map("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
map("n", "<leader>fs", fzf.grep_cword, { desc = "Grep Word Under Cursor" })
map("n", "<leader>fS", fzf.grep_cWORD, { desc = "Grep WORD Under Cursor" })

-- Neovim
map("n", "<leader>fk", fzf.keymaps, { desc = "Find Keymaps" })
map("n", "<leader>fh", fzf.helptags, { desc = "Find Help Tags" })
map("n", "<leader>fd", fzf.diagnostics_workspace, { desc = "Workspace Diagnostics" })
map("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
map("n", "<leader>fu", fzf.undotree, { desc = "Undo tree" })

map("n", "<leader>ft", function()
  theme.set_picker_active(true)
  theme.enforce_dark_background()
  fzf.colorschemes({
    colors = theme.get_managed_themes(),
    live_preview = true,
    actions = {
      ["default"] = function(selected)
        theme.set_picker_active(false)
        if selected and selected[1] then
          theme.apply_managed_theme(selected[1])
        end
      end,
      ["esc"] = function()
        theme.set_picker_active(false)
        local saved = theme.get_saved_theme()
        if saved then
          theme.apply_managed_theme(saved)
        end
      end,
    },
  })
end, { desc = "Pick Theme" })
