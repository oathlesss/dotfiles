-- Treesitter post-install/update hook - must come before vim.pack.add()
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local name, kind = event.data.spec.name, event.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not event.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})


vim.pack.add({
  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

  -- Completion
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.*" },

  -- Picker
  "https://github.com/ibhagwan/fzf-lua",

  -- Colorschemes
  "https://github.com/catppuccin/nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/rose-pine/neovim",
})

vim.cmd.colorscheme("rose-pine")
