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

  -- Use one Python language server at a time.
  -- zubanls = {
  --   cmd          = { "zubanls" },
  --   filetypes    = { "python" },
  --   root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
  -- },

  ty = {
    cmd          = { "ty", "server" },
    filetypes    = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
    settings = {
      ty = {},
    },
  },

  ruff = {
    on_attach = function(client)
      -- Ruff handles linting/formatting only; defer hover to the Python LSP.
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

  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
  },

  htmlls = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    root_markers = { "package.json", ".git" },
  },

  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_markers = { "package.json", ".git" },
  },

  bashls = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh" },
    root_markers = { ".git" },
  },

  -- Neovim detects docker-compose files as plain yaml, so keep dockerls scoped
  -- to Dockerfiles and let yamlls continue to own yaml buffers.
  dockerls = {
    cmd = { "docker-language-server", "start", "--stdio" },
    filetypes = { "dockerfile" },
    root_markers = { "Dockerfile", ".git" },
  },

  marksman = {
    cmd = { "marksman", "server" },
    filetypes = { "markdown" },
    root_markers = { ".marksman.toml", ".git" },
  },

  taplo = {
    cmd = { "taplo", "lsp", "stdio" },
    filetypes = { "toml" },
    root_markers = { "taplo.toml", ".git" },
  },

  emmet_ls = {
    cmd = { "emmet-language-server", "--stdio" },
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    root_markers = { "package.json", ".git" },
  },

  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
    root_markers = { ".git" },
    settings = {
      yaml = {
        schemaStore = {
          enable = true,
        },
        schemas = {
          kubernetes = {
            "k8s/**/*.yaml",
            "k8s/**/*.yml",
            "kubernetes/**/*.yaml",
            "kubernetes/**/*.yml",
            "manifests/**/*.yaml",
            "manifests/**/*.yml",
            "*.k8s.yaml",
            "*.k8s.yml",
            "*.kubernetes.yaml",
            "*.kubernetes.yml",
          },
        },
      },
    },
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
