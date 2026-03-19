local map = vim.keymap.set
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")
