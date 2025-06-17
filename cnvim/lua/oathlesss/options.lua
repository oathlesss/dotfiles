-- LSP activation (references lsp/<filename>
vim.lsp.enable({
    "lua",
    "python",
    "sql",
})

-- Rounded borders
vim.opt.winborder = "rounded"

-- Inline hints
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "Error",
            [vim.diagnostic.severity.WARN] = "Warn",
            [vim.diagnostic.severity.INFO] = "Info",
            [vim.diagnostic.severity.HINT] = "Hint",
        },
    },
    -- virtual_text = true,
    -- virtual_lines = false,
    jump = {
        float = true,
    },
    virtual_lines = {
        current_line = true,
    },
})

vim.lsp.log_levels = "OFF"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.o.completeopt = "menuone,noselect"
vim.o.wrap = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.timeoutlen = 300
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.list = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.o.termguicolors = true

vim.g.snacks_animate = false

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


