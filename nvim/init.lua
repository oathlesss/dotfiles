if vim.fn.has("nvim-0.11") == 0 then
	vim.notify("Use Neovim 0.11+", vim.log.levels.ERROR)
	return
end

-- Install mini.nvim
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.uv.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim",
        mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require("mini.deps").setup({ path = { package = path_package } })

-- options
require("core.options")

-- plugins
require("core.colorschemes")
require("core.mini-modules")
require("core.barbecue")
require("core.supermaven")

-- keybinds
require("core.keybinds")

require("core.lsp")
require("core.autocommands")
