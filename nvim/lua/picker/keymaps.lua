local fzf = require("fzf-lua")
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

-- Git
map("n", "<leader>gf", fzf.git_files, { desc = "Git Files" })
map("n", "<leader>gc", fzf.git_commits, { desc = "Git Commits" })
map("n", "<leader>gb", fzf.git_branches, { desc = "Git Branches" })
