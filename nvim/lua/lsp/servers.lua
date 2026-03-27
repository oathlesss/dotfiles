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
    cmd = { "vtsls", "--stdio" },
    init_options = {
      hostInfo = "neovim",
    },
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "ts", "js", },
  },

  -- djlsp = {
  --   cmd = { "/Users/rubenhesselink/personal/repos/django-template-lsp/env/bin/djlsp", "--enable-log"},
  --   filetypes = { "htmldjango", "django-html", "html" },
  --   root_markers = { "manage.py", ".git" },
  --   init_options = {
  --     docker_compose_file = "docker-compose.yml",
  --     docker_compose_service = "django",
  --     cache = true,
  --   },
  -- },
}

