return {
  {
    "snacks.nvim",
    opts = {
      zen = {
        win = {
          backdrop = {
            transparent = false,
          },
        },
      },
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
  ______               __      __        __                               
 /      \             |  \    |  \      |  \                              
|  $$$$$$\  ______   _| $$_   | $$____  | $$  ______    _______   _______ 
| $$  | $$ |      \ |   $$ \  | $$    \ | $$ /      \  /       \ /       \
| $$  | $$  \$$$$$$\ \$$$$$$  | $$$$$$$\| $$|  $$$$$$\|  $$$$$$$|  $$$$$$$
| $$  | $$ /      $$  | $$ __ | $$  | $$| $$| $$    $$ \$$    \  \$$    \ 
| $$__/ $$|  $$$$$$$  | $$|  \| $$  | $$| $$| $$$$$$$$ _\$$$$$$\ _\$$$$$$\
 \$$    $$ \$$    $$   \$$  $$| $$  | $$| $$ \$$     \|       $$|       $$
  \$$$$$$   \$$$$$$$    \$$$$  \$$   \$$ \$$  \$$$$$$$ \$$$$$$$  \$$$$$$$ 
   ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },
}
