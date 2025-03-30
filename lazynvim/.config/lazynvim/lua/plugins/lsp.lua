return {
  {
    "microsoft/python-type-stubs",
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = { enabled = false }

      opts.servers = opts.servers or {}

      opts.servers.basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              stubPath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs"),
              typeCheckingMode = "off",
              -- ignore = { "reportUnreachable" },
              disableOrganizeImports = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      }

      opts.servers.djlsp = {
        -- cmd = { "/Users/rubenhesselink/.local/share/nvim/mason/bin/djlsp" },
        cmd = { "/Users/rubenhesselink/Developer/Projects/Personal/django-template-lsp/env/bin/djlsp" },
        root_dir = require("lspconfig.util").root_pattern("manage.py", ".git"),
      }
    end,
  },
}
