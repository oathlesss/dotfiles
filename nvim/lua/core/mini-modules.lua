local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function() require("mini.align").setup() end)
later(function()
	local animate = require("mini.animate")
	animate.setup({
		scroll = {
			-- Disable Scroll Animations, as the can interfer with mouse Scrolling
			enable = false,
		},
		cursor = {
			timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
		},
	})
end)
later(function()
	require("mini.basics").setup({
		options = {
			basic = true,
			extra_ui = true,
			win_borders = "bold",
		},
		mappings = {
			basic = true,
			windows = true,
		},
		autocommands = {
			basic = true,
			relnum_in_visual_mode = true,
		},
	})
end)
later(function() require("mini.bracketed").setup() end)
later(function() require("mini.bufremove").setup() end)
later(function()
	require("mini.clue").setup({
		triggers = {
			-- Leader triggers
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			{ mode = "n", keys = "\\" },

			-- Built-in completion
			{ mode = "i", keys = "<C-x>" },

			-- `g` key
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			-- Surround
			{ mode = "n", keys = "s" },

			-- Marks
			{ mode = "n", keys = "'" },
			{ mode = "n", keys = "`" },
			{ mode = "x", keys = "'" },
			{ mode = "x", keys = "`" },

			-- Registers
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "i", keys = "<C-r>" },
			{ mode = "c", keys = "<C-r>" },

			-- Window commands
			{ mode = "n", keys = "<C-w>" },

			-- `z` key
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },
		},

		clues = {
			{ mode = "n", keys = "<Leader>b", desc = " Buffer" },
			{ mode = "n", keys = "<Leader>f", desc = " Find" },
			{ mode = "n", keys = "<Leader>g", desc = "󰊢 Git" },
			{ mode = "n", keys = "<Leader>i", desc = "󰏪 Insert" },
			{ mode = "n", keys = "<Leader>l", desc = "󰘦 LSP" },
			{ mode = "n", keys = "<Leader>m", desc = " Mini" },
			{ mode = "n", keys = "<Leader>q", desc = " NVim" },
			{ mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
			{ mode = "n", keys = "<Leader>s", desc = " Terminal" },
			{ mode = "n", keys = "<Leader>u", desc = "󰔃 UI" },
			{ mode = "n", keys = "<Leader>w", desc = " Wiki" },
			require("mini.clue").gen_clues.g(),
			require("mini.clue").gen_clues.builtin_completion(),
			require("mini.clue").gen_clues.marks(),
			require("mini.clue").gen_clues.registers(),
			require("mini.clue").gen_clues.windows(),
			require("mini.clue").gen_clues.z(),
		},
		window = {
			delay = 300,
		},
	})
end)
later(function() require('mini.colors').setup() end)
later(function() require("mini.comment").setup() end)
later(function()
	require("mini.completion").setup({
		mappings = {
			go_in = "<RET>",
		},
		window = {
			info = { border = "solid" },
			signature = { border = "solid" },
		},
	})
end)
later(function()
	require("mini.cursorword").setup()
	vim.api.nvim_set_hl(0, "MiniCursorword", { underline = true })
	vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { underline = false, bg = NONE })
end)
later(function()
	require("mini.diff").setup({
		view = {
			style = "sign",
			signs = { add = "█", change = "▒", delete = "" },
		},
	})
end)
later(function() require("mini.doc").setup() end)
later(function() require("mini.extra").setup() end)
later(function()
	require("mini.files").setup({
		mappings = {
			close = '<ESC>',
		},
		windows = {
			preview = true,
			border = "rounded",
			width_preview = 80,
		},
		options = {
			use_as_default_explorer = false,
		},
	})
end)
later(function() require("mini.fuzzy").setup() end)
later(function() require("mini.git").setup() end)
later(function()
	local hipatterns = require("mini.hipatterns")

	local censor_extmark_opts = function(_, match, _)
		local mask = string.rep("*", vim.fn.strchars(match))
		return {
			virt_text = { { mask, "Comment" } },
			virt_text_pos = "overlay",
			priority = 200,
			right_gravity = false,
		}
	end

	-- This is a custom "hide my password" solution
	-- Add patterns to match below
	-- toggle with <leader>up
	local password_table = {
		pattern = {
			"password: ()%S+()",
			"password_usr: ()%S+()",
			"_pw: ()%S+()",
			"password_asgard_read: ()%S+()",
			"password_elara_admin: ()%S+()",
			"gpg_pass: ()%S+()",
			"passwd: ()%S+()",
			"secret: ()%S+()",
		},
		group = "",
		extmark_opts = censor_extmark_opts,
	}

	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Cloaking Passwords
			pw = password_table,

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})

	vim.keymap.set("n", "<leader>up", function()
		if next(hipatterns.config.highlighters.pw) == nil then
			hipatterns.config.highlighters.pw = password_table
		else
			hipatterns.config.highlighters.pw = {}
		end
		vim.cmd("edit")
	end, { desc = "Toggle Password Cloaking" })
end)
later(function() require("mini.icons").setup() end)
later(function()
	require("mini.indentscope").setup({
		draw = {
			animation = function()
				return 1
			end,
		},
		symbol = "│",
	})
end)
later(function() require("mini.jump").setup() end)
later(function() require("mini.jump2d").setup() end)
later(function() require("mini.map").setup() end)
later(function() require("mini.misc").setup() end)
later(function()
	require("mini.move").setup({
		mappings = {
			-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
			left = '<M-S-h>',
			right = '<M-S-l>',
			down = '<M-S-j>',
			up = '<M-S-k>',

			-- Move current line in Normal mode
			line_left = '<M-S-h>',
			line_right = '<M-S-l>',
			line_down = '<M-S-j>',
			line_up = '<M-S-k>',
		},
	}
)
end)
later(function()
	-- We took this from echasnovski's personal configuration
	-- https://github.com/echasnovski/nvim/blob/master/init.lua

	local filterout_lua_diagnosing = function(notif_arr)
		local not_diagnosing = function(notif)
			return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
		end
		notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
		return MiniNotify.default_sort(notif_arr)
	end
	require("mini.notify").setup({
		content = { sort = filterout_lua_diagnosing },
		window = { config = { border = "solid" } },
	})
	vim.notify = MiniNotify.make_notify()
end)
later(function() require("mini.operators").setup() end)
-- later(function()require("mini.pairs").setup()end)
later(function()
	local win_config = function()
		local height = math.floor(0.618 * vim.o.lines)
		local width = math.floor(0.4 * vim.o.columns)
		return {
			anchor = "NW",
			height = height,
			width = width,
			border = "solid",
			row = math.floor(0.5 * (vim.o.lines - height)),
			col = math.floor(0.5 * (vim.o.columns - width)),
		}
	end
	require("mini.pick").setup({
		mappings = {
			choose_in_vsplit = "<C-CR>",
		},
		options = {
			use_cache = true,
		},
		window = {
			config = win_config,
		},
	})
	vim.ui.select = MiniPick.ui_select
end)
later(function() require("mini.splitjoin").setup() end)
later(function()
	local gen_loader = require('mini.snippets').gen_loader
	require('mini.snippets').setup({
		snippets = {
			-- Load custom file with global snippets first (adjust for Windows)
			gen_loader.from_file('~/.config/nvim/snippets/global.json'),

			-- Load snippets based on current language by reading files from
			-- "snippets/" subdirectories from 'runtimepath' directories.
			gen_loader.from_lang(),
		},
	})
end)
later(function()
	require("mini.statusline").setup({
		content = {
			active = function()
				local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
				local git           = MiniStatusline.section_git({ trunc_width = 40 })
				local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
				local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
				local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

				return MiniStatusline.combine_groups({
					{ hl = mode_hl,                 strings = { mode } },
					{ hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
					'%<', -- Mark general truncate point
					{ hl = 'MiniStatuslineFilename', strings = { filename } },
					'%=', -- End left alignment
					{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
					{ hl = mode_hl,                  strings = { search, location } },
				})
			end,
			inactive = nil,
		},
	})
end)
later(function() require("mini.surround").setup() end)
later(function() require("mini.trailspace").setup() end)
later(function() require("mini.visits").setup() end)

