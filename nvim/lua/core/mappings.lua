------------------------------------- Global Mappings -------------------------------------------

vim.g.mapleader = " " -- Set the leader key to <space>
vim.g.maplocalleader = " " -- Set the localleader key to <space>

------------------------------------- Global Vars -------------------------------------------
local keymap = vim.keymap

------------------------------------- Insert Mode -------------------------------------------

-- Navigate within insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

keymap.set("i", "<C-a>", "<ESC>^i", { desc = "Move to the beginning of the line" })
keymap.set("i", "<C-e>", "<End>", { desc = "Move to the end of the line" })

------------------------------------- Normal Mode -------------------------------------------

-- Switch between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the window below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the window above" })

-- Clear serach highlight
keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear search highlights" })

-- Smooth scrolling for wrapped lines
keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, desc = "Move down (handle wrapped lines)" })
keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, desc = "Move up (handle wrapped lines)" })
keymap.set("n", "<Up>", 'v:count == 0 ? "gk" : "k"', { expr = true, desc = "Move up (handle wrapped lines)" })
keymap.set("n", "<Down>", 'v:count == 0 ? "gj" : "j"', { expr = true, desc = "Move down (handle wrapped lines)" })

-- Undo Tree Command
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree", silent = true })

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set("n", "<Space>", "<Nop>", { desc = "Disable space key's default behaviour", silent = true })

-- Telescope
keymap.set("n", "ff", "<cmd> Telescope find_files previewer=false <CR>", { desc = "Find files" })
keymap.set(
	"n",
	"fa",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true previewer=true <CR>",
	{ desc = "Find all" }
)
keymap.set("n", "fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
keymap.set("n", "fk", "<cmd> Telescope keymaps<CR>", { desc = "Keymaps" })
keymap.set("n", "fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" })
keymap.set("n", "fs", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })
keymap.set("n", "fp", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- Telescope bookmarks
keymap.set("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "Telescope bookmarks" })

-- Telescope Git
keymap.set("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
keymap.set("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "Git status" })

------------------------------------- Visual Mode -------------------------------------------

-- Navigation
keymap.set("v", "<Up>", 'v:count == 0 ? "gk" : "k"', { expr = true, desc = "Move up (handle wrapped lines)" })
keymap.set("v", "<Down>", 'v:count == 0 ? "gj" : "j"', { expr = true, desc = "Move down (handle wrapped lines)" })

-- Intendations
keymap.set("v", "<", "<gv", { desc = "Indent line left and keep selection" })
keymap.set("v", ">", ">gv", { desc = "Indent line right and keep selection" })

-- Replace without copying replaced text in visual mode
keymap.set(
	"v",
	"p",
	'p:let @+=@0<CR>:let @"=@0<CR>',
	{ silent = true, desc = "Paste without overwriting the register" }
)

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set("v", "<Space>", "<Nop>", { desc = "Disable space key's default behaviour", silent = true })

------------------------------------- Visual-line (x) Mode -------------------------------------------

-- Navigation
keymap.set("x", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, desc = "Move down (handle wrapped lines)" })
keymap.set("x", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, desc = "Move up (handle wrapped lines)" })

-- Replace without copying replaced text in visual-line mode
keymap.set(
	"x",
	"p",
	'p:let @+=@0<CR>:let @"=@0<CR>',
	{ silent = true, desc = "Paste without overwriting the register" }
)
