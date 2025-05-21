-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>silent !tmux neww tmux-sessions.sh<CR>",
  { noremap = true, desc = "Select a tmux session" }
)

vim.keymap.set(
  "n",
  "<leader>uN",
  "<cmd>NoNeckPain<CR>",
  {noremap = true, desc = "Toggle NoNeckPain" }
)
