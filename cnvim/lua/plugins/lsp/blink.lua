return {
	{
		"saghen/blink.cmp",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "default",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<Tab>"] = { "accept", "fallback" },
				["<C-c>"] = { "cancel", "fallback" },
				["<C-n>"] = { "scroll_documentation_down" },
				["<C-p>"] = { "scroll_documentation_up" },
				["<C-s>"] = { "show" },
			},
			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				documentation = { auto_show = true },
				-- Use text instead of icons in autocompletion menu
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1, "source_name" },
						},
					},
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets" },
				providers = {},
				per_filetype = {
					lua = { "lsp", "buffer", "path", "snippets" },
					markdown = { "lsp", "path", "snippets" }, -- do not add 'buffer' here, it's slow AF
					text = { "buffer", "path" },
					ps1 = { "lsp", "buffer", "path", "snippets" },
				},
			},
			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
