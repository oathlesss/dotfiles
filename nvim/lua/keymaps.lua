local map = vim.keymap.set

local function fugitive(command)
  return function()
    vim.cmd.packadd("vim-fugitive")
    vim.cmd(command)
  end
end

map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>", { desc = "Tmux sessionizer" })
map("n", "<leader>gs", fugitive("Git"), { desc = "Git status" })
map("n", "<leader>gb", fugitive("Git blame"), { desc = "Git blame" })
map("n", "<leader>gd", fugitive("Gvdiffsplit"), { desc = "Git diff" })
map("n", "<leader>gw", fugitive("Gwrite"), { desc = "Git stage file" })
map("n", "<leader>gl", fugitive("Git log --oneline --decorate --graph"), { desc = "Git log" })
map("n", "<leader>gc", fugitive("Git commit"), { desc = "Git commit" })
map("n", "<leader>gp", fugitive("Git push"), { desc = "Git push" })
map("n", "<leader>gP", fugitive("Git pull --rebase"), { desc = "Git pull rebase" })
map("n", "<leader>gr", fugitive("Gread"), { desc = "Git restore file" })
