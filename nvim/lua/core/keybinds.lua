local keymap = vim.keymap.set

keymap("n", "<leader>mu", function() require('mini.deps').update() end, { desc = 'Update Plugins' })

-- lsp keymaps
keymap("n", "gd", function() vim.lsp.buf.definition() end, { desc = 'Go To Definition' })
keymap("n", "<leader>ls", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = 'Show all Symbols' })
keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = 'Rename This' })
keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = 'Code Actions' })
keymap("n", "<leader>le", function() require('mini.extra').pickers.diagnostic({ scope = "current" }) end, { desc = "LSP Errors in Buffer" })
keymap("n", "<leader>lf", function() vim.diagnostic.setqflist({ open = true }) end, { desc = "LSP Quickfix" })

-- git keymaps
keymap("n", "<leader>gb", function() require('mini.extra').pickers.git_commits({ path = vim.fn.expand('%:p') }) end, { desc = 'Git Log this File' })
keymap("n", "<leader>gp", "<cmd>:Git pull<cr>", { desc = 'Git Push' })
keymap("n", "<leader>gs", "<cmd>:Git push<cr>", { desc = 'Git Pull' })
keymap("n", "<leader>ga", "<cmd>:Git add .<cr>", { desc = 'Git Add All' })
keymap("n", "<leader>gc", '<cmd>:Git commit -m "wip"<cr>', { desc = 'Git Autocommit' })
keymap("", "<leader>gd", function() require('mini.diff').toggle_overlay() end, { desc = 'Visual Diff Buffer' })
keymap("", "<leader>gh", function() require('mini.git').show_range_history() end, { desc = 'Git Range History' })
keymap("n", "<leader>gx", function() require('mini.git').show_at_cursor() end, { desc = 'Git Context Cursor' })

keymap("n", "YY", "<cmd>%y<cr>", { desc = 'Yank Buffer' })
keymap("n", "<Esc>", "<cmd>noh<cr>", { desc = 'Clear Search' })

keymap("n", "<leader>rw", function()
	local word = vim.fn.expand("<cword>")
	local cmd = ":%s/" .. word .. "/"
	vim.api.nvim_feedkeys(cmd, "n", false)
end, { desc = 'Start Replace' })


-- format buffer
-- with and without LSP
if not vim.tbl_isempty(vim.lsp.get_clients()) then
	keymap("n", "<leader>bf", function()
		vim.lsp.buf.format()
	end, { desc = 'Format Buffer (LSP)' })
else
	keymap("n", "<leader>bf", "gg=G", { desc = 'Format Buffer (vim)' })
end

--  ─( Colorscheme Picker )─────────────────────────────────────────────
local set_colorscheme = function(name) pcall(vim.cmd, 'colorscheme ' .. name) end
local pick_colorscheme = function()
	local init_scheme = vim.g.colors_name
	local new_scheme = require('mini.pick').start({
		source = {
			items = vim.fn.getcompletion("", "color"),
			preview = function(_, item)
				set_colorscheme(item)
			end,
			choose = set_colorscheme
		},
		mappings = {
			preview = {
				char = '<C-p>',
				func = function()
					local item = require('mini.pick').get_picker_matches()
					pcall(vim.cmd, 'colorscheme ' .. item.current)
				end
			}
		}
	})
	if new_scheme == nil then set_colorscheme(init_scheme) end
end

-- find keymaps
keymap("n", "<leader>ff", function() require('mini.pick').builtin.files() end, { desc = 'Find File' })
keymap("n", "<leader>fr", function() require('mini.pick').builtin.resume() end, { desc = 'Find Resume' })
keymap("n", "<leader>e", function()
	local buffer_name = vim.api.nvim_buf_get_name(0)
	if buffer_name == "" or string.match(buffer_name, "Starter") then
		require('mini.files').open(vim.loop.cwd())
	else
		require('mini.files').open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = 'Find Here' })
keymap("n", "<leader><space>", function() require('mini.pick').builtin.buffers() end, { desc = 'Find Buffer' })
keymap("n", "<leader>fg", function() require('mini.pick').builtin.grep_live() end, { desc = 'Find String' })
keymap("n", "<leader>fG", function()
	local wrd = vim.fn.expand("<cword>")
	require('mini.pick').builtin.grep({ pattern = wrd })
end, { desc = 'Find String Cursor' })
keymap("n", "<leader>fh", function() require('mini.pick').builtin.help() end, { desc = 'Find Help' })
keymap("n", "<leader>fl", function() require('mini.extra').pickers.hl_groups() end, { desc = 'Find HL Groups' })
keymap("n", "<leader>fc", pick_colorscheme, { desc = 'Change Colorscheme' })
keymap('n', ',', function() require('mini.extra').pickers.buf_lines({ scope = 'current' }) end, { nowait = true, desc = 'Search Lines' })
