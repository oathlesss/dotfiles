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
              typeCheckingMode = "basic",
              -- ignore = { "reportUnreachable" },
              disableOrganizeImports = true,
              useTypingExtensions = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      }
    end,
  },
}
