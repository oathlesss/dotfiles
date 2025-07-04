if vim.fn.has("nvim-0.11") == 0 then
	vim.notify("NativeVim only supports Neovim 0.11+", vim.log.levels.ERROR)
	return
end

require("core.mini-deps")
require("core.mini")
require("core.options")
require("core.lsp")
