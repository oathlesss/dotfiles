return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- Disable basedpyright
        basedpyright = {
          enabled = false,
        },
        -- Disable pyright as fallback
        pyright = {
          enabled = false,
        },
        -- Enable ty language server
        ty = {
          enabled = true,
          settings = {
            ty = {
              experimental = {
                autoImport = true,
              },
              inlayHints = {
                variableTypes = false,
                callArgumentNames = false,
              },
            },
          },
        },
        pyrefly = {
          enabled = false,
        },
        zuban = {
          enabled = false,
        },
        -- Keep ruff for linting and formatting
        ruff = {},
      },
    },
  },
}
