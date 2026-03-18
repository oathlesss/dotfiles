return {
  "saxon1964/neovim-tips",
  version = "*", -- Only update on tagged releases
  lazy = false, -- Load on startup (recommended for daily tip feature)
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL: Choose your preferred markdown renderer (or omit for raw markdown)
    "MeanderingProgrammer/render-markdown.nvim", -- Clean rendering
    -- OR: "OXY2DEV/markview.nvim", -- Rich rendering with advanced features
  },
  opts = {
    -- OPTIONAL: Location of user defined tips (default value shown below)
    user_file = vim.fn.stdpath("config") .. "/neovim_tips/user_tips.md",
    -- OPTIONAL: Prefix for user tips to avoid conflicts (default: "[User] ")
    user_tip_prefix = "[User] ",
    -- OPTIONAL: Show warnings when user tips conflict with builtin (default: true)
    warn_on_conflicts = true,
    -- OPTIONAL: Daily tip mode (default: 1)
    -- 0 = off, 1 = once per day, 2 = every startup
    daily_tip = 0,
    -- OPTIONAL: Bookmark symbol (default: "🌟 ")
    bookmark_symbol = "🌟 ",
  },
  -- init = function()
  --   -- OPTIONAL: Change to your liking or drop completely
  --   -- The plugin does not provide default key mappings, only commands
  --   local map = vim.keymap.set
  --   map("n", "<leader>Nto", ":NeovimTips<CR>", { desc = "Neovim tips", silent = true })
  --   map("n", "<leader>Nte", ":NeovimTipsEdit<CR>", { desc = "Edit your Neovim tips", silent = true })
  --   map("n", "<leader>Nta", ":NeovimTipsAdd<CR>", { desc = "Add your Neovim tip", silent = true })
  --   map("n", "<leader>Nth", ":help neovim-tips<CR>", { desc = "Neovim tips help", silent = true })
  --   map("n", "<leader>Ntr", ":NeovimTipsRandom<CR>", { desc = "Show random tip", silent = true })
  --   map("n", "<leader>Ntp", ":NeovimTipsPdf<CR>", { desc = "Open Neovim tips PDF", silent = true })
  -- end,
}
