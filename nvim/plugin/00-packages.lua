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


local specs = {
  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

  -- Completion
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.*" },

  -- Utils
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/which-key.nvim",

  -- Picker
  "https://github.com/ibhagwan/fzf-lua",

  -- Harpoon
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

  -- Git
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/tpope/vim-fugitive",

  -- Statusline
  "https://github.com/nvim-tree/nvim-web-devicons", -- Dependency of lualine
  "https://github.com/nvim-lualine/lualine.nvim",

  -- File tree
  "https://github.com/stevearc/oil.nvim",

  -- TODO Comments
  "https://github.com/folke/todo-comments.nvim",

  -- Colorschemes
  "https://github.com/catppuccin/nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/rose-pine/neovim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/vague-theme/vague.nvim",
  "https://github.com/danilo-augusto/vim-afterglow",
  { src = "https://github.com/everviolet/nvim", name = "evergarden" },
  "https://github.com/xero/miasma.nvim",
  "https://github.com/trapd00r/neverland-vim-theme",
  "https://github.com/bettervim/yugen.nvim",
  "https://github.com/savq/melange-nvim",
  "https://github.com/zootedb0t/citruszest.nvim",
  "https://github.com/rockerBOO/boo-colorscheme-nvim",
}

local function spec_name(spec)
  if type(spec) == "string" then
    return spec:match("/([^/]+)%.git$") or spec:match("/([^/]+)$")
  end

  return spec.name or (spec.src:match("/([^/]+)%.git$") or spec.src:match("/([^/]+)$"))
end

local wanted = {}
for _, spec in ipairs(specs) do
  wanted[spec_name(spec)] = true
end

local stale = {}
for _, plugin in ipairs(vim.pack.get()) do
  if not wanted[plugin.spec.name] then
    table.insert(stale, plugin.spec.name)
  end
end

if #stale > 0 then
  vim.pack.del(stale)
end

vim.pack.add(specs)
