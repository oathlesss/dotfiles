vim.cmd.packadd("which-key.nvim")

local wk = require("which-key")

wk.setup({})

wk.add({
  { "<leader>g", group = "Git" },
})
