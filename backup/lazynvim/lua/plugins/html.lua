return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- html will be automatically installed with mason and loaded with lspconfig
        html = {
          filetypes = { "html", "htmldjango", "djangohtml" },
        },
        htmx = {},
      },
    },
  },
}
