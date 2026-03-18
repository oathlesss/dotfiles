return {
  lua_ls = {
    settings = {
      Lua = {
        runtime   = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
        diagnostics = { globals = { "vim" } },
        telemetry   = { enable = false },
      },
    },
  },

  zubanls = {
    cmd          = { "zubanls" },
    filetypes    = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
  },

  ruff = {
    on_attach = function(client)
      -- Ruff handles linting/formatting only; defer hover to zubanls
      client.server_capabilities.hoverProvider = false
    end,
  },

  vtsls = {
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
}

