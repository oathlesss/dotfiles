local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- https://github.com/vague2k/vague.nvim
now(function()
  add({ source = 'vague2k/vague.nvim' })
  vim.cmd('colorscheme vague')
end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-notify.md#default-config
now(function()
	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()
end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-icons.md#default-config
now(function() require("mini.icons").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-tabline.md#default-config
now(function() require("mini.tabline").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-statusline.md#default-config
now(function() require("mini.statusline").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-clue.md#default-config
now(function() 
	miniclue = require("mini.clue")
	miniclue.setup({
		triggers = {
			-- Leader triggers
			{ mode = 'n', keys = '<Leader>' },
			{ mode = 'n', keys = ' '},
			{ mode = 'x', keys = '<Leader>' },
			{ mode = 'x', keys = ' ' },

			-- Built-in completion
			{ mode = 'i', keys = '<C-x>' },

			-- `g` key
			{ mode = 'n', keys = 'g' },
			{ mode = 'x', keys = 'g' },

			-- Marks
			{ mode = 'n', keys = "'" },
			{ mode = 'n', keys = '`' },
			{ mode = 'x', keys = "'" },
			{ mode = 'x', keys = '`' },

			-- Registers
			{ mode = 'n', keys = '"' },
			{ mode = 'x', keys = '"' },
			{ mode = 'i', keys = '<C-r>' },
			{ mode = 'c', keys = '<C-r>' },

			-- Window commands
			{ mode = 'n', keys = '<C-w>' },

			-- `z` key
			{ mode = 'n', keys = 'z' },
			{ mode = 'x', keys = 'z' },
		},

		clues = {
			-- Enhance this by adding descriptions for <Leader> mapping groups
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
		},
	})
end)
now(function()
	local keymap = require("mini.keymap")
	keymap.setup()

	keymap.map_combo({ 'i', 'c' }, 'jk', '<BS><BS><ESC>')
	keymap.map_combo({ 'i', 'c' }, 'kj', '<BS><BS><ESC>')
end)

-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-basics.md#default-config
later(function() require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = "default",
	},
	mappings = {
		basic = true,
		windows = true,
		move_with_alt = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = true,
	},
}) end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md#default-config
later(function() require("mini.ai").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pick.md#default-config
later(function()
	pick = require("mini.pick")
	pick.setup()
	vim.keymap.set('n', '<leader>ff', pick.builtin.files, { desc = 'Pick: files' })
	vim.keymap.set('n', '<leader>fg', pick.builtin.grep_live, { desc = 'Pick: grep_live' })
	vim.keymap.set('n', '<leader>fr', pick.builtin.resume, { desc = 'Pick: resume' })
end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md#default-config
later(function() require("mini.surround").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md#default-config
later(function() require("mini.completion").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-git.md#default-config
later(function() require("mini.git").setup() end)
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-jump.md#default-config
later(function() require("mini.jump").setup() end)
later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  -- Possible to immediately execute code which depends on the added plugin
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc' },
    highlight = { enable = true },
  })
end)
