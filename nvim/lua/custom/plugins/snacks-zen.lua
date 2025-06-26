return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    zen = {
      toggles = {
        dim = false,
        git_signs = true,
        mini_diff_signs = true,
        diagnostics = true,
        inlay_hints = true,
      },
      show = {
        statusline = true,
        tabline = true,
      },
    },
    styles = {
      zen = {
        enter = true,
        fixbuf = false,
        minimal = false,
        width = 180,
        height = 0,
        backdrop = { transparent = true, blend = 40 },
        keys = { q = false },
        zindex = 40,
        wo = {
          winhighlight = 'NormalFloat:Normal',
        },
        w = {
          snacks_main = true,
        },
      },
    },
  },
  keys = {
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
  },
}
