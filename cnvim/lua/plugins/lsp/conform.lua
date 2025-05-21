-- Some things are from https://www.josean.com/posts/neovim-linting-and-formatting
return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		tag = "stable",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					svelte = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					text = { "woke" },
					graphql = { "prettier" },
					lua = { "stylua" },
					python = { "ruff" },
					sh = { "shfmt" },
					terraform = { "tflint" },
					hcl = { "hclfmt" },
					gitcommit = { "commitlint" },
				},
				stop_after_first = false,
				format_on_save = function(bufnr)
					-- Disable "format_on_save lsp_fallback" for languages that don't
					-- have a well standardized coding style. You can add additional
					-- languages here or re-enable it for the disabled ones.
					local disable_filetypes = { c = true, cpp = true, python = true }
					if disable_filetypes[vim.bo[bufnr].filetype] then
						return nil
					else
						return {
							timeout_ms = 500,
							lsp_format = "fallback",
						}
					end
				end,
			})
		end,
	},
}
